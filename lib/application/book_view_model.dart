import 'package:hive/hive.dart';
import 'package:memorylif/common/logger/log.dart';
import 'package:memorylif/data/models/content_model.dart';
import 'package:memorylif/ui/base/base_view_model.dart';


class BookViewModel extends BaseViewModel {
  String? todayContent;

  updateTodayContent({required String content}){
    todayContent = content;
    setState();
  }

  Box? myBook;

  openBook()async{
    myBook = await Hive.openBox('myBook');
  }

  putContentInBook({required String date, required String textContent}){
    ContentModel content = ContentModel(date: date, textContent: textContent);
    myBook?.put(date, textContent);
    getContentFromBook(date: date);
  }

  getContentFromBook({required String date}){
    var content = myBook?.get(date);
    d(content);
  }

}