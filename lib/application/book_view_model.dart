import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:memorylif/application/core/extensions/extensions.dart';
import 'package:memorylif/common/logger/log.dart';
import 'package:memorylif/constant/constants.dart';
import 'package:memorylif/data/models/content_model.dart';
import 'package:memorylif/ui/base/base_view_model.dart';


enum BookContentFetchStatus{normal, loading, loaded}

class BookViewModel extends BaseViewModel {
  String? todayContent;

  BookContentFetchStatus bookContentFetchStatus = BookContentFetchStatus.normal;

  changeBookContentFetchStatus({required BookContentFetchStatus status}){
    bookContentFetchStatus = status;
    setState();
  }

  updateTodayContent({required String content}) {
    todayContent = content;
    setState();
  }

  Box? myBook;

  openBook() async {
    myBook = await Hive.openBox('myBook');
  }

  putContentInBook({required String date, required String textContent}) {
    ContentModel content = ContentModel(date: date, textContent: textContent);
    d('date::: $date');
    myBook?.put(date, textContent);
    getContentFromBook(date: date);
  }

  getContentFromBook({required String date}) {
    var content = myBook?.get(date);
    // d('$date content... $content');
    return content;
  }


  FetchDataFromFirebase()async{
    if(iPrefHelper.getAppPremiumStatus() == true){
      changeBookContentFetchStatus(status: BookContentFetchStatus.loading);
      final users = FirebaseFirestore.instance.collection('content').doc(iPrefHelper.retrieveUser()['email']);
      for(int month = 1; month<=DateTime.now().month; month++){
        for(int date = 1; date <= DateUtils.getDaysInMonth(DateTime.now().year, month); date++){
          d('Date:::: ${date.twoDigits}-${month.twoDigits}-${DateTime.now().year}');
          String nDate = '${date.twoDigits}-${month.twoDigits}-${DateTime.now().year}';
          final userContent =  await users.collection(getMonthName(month)).doc(nDate).get();
          if(userContent.exists){
            d(userContent.exists);
            putContentInBook(date: DateTime.now().format(Constants.apiDateFormat), textContent: userContent.get('content'));
          }
        }
      }
      changeBookContentFetchStatus(status: BookContentFetchStatus.loaded);
    }
  }


}
