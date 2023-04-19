import 'dart:io';

import 'package:dio/dio.dart';
import 'package:memorylif/common/logger/log.dart';
import 'package:memorylif/data/models/user_model.dart';
import 'package:memorylif/ui/base/base_view_model.dart';

class AppViewModel extends BaseViewModel {
  UserModel? userData;

  saveUserModel({required UserModel newUserData}) {
    userData = newUserData;
    notifyListeners();
  }

  Future paymentApi({required int cardNumber, required int expMonth, required int expYear, required int cvc , required double amount}) async {
    var dio = Dio();
    try {
      String loginUrl =
          "https://nodejs-stripe-api-production.up.railway.app/api/payment";
      d(loginUrl);
      final map = {
        'number':  cardNumber,
        'expMonth': expMonth,
        'expYear': expYear,
        'amount': amount,
        'cvc': cvc,
      };
      d('map::: $map');
      final response = await dio.post(loginUrl,
          data: map,
          options: Options(
            headers: {HttpHeaders.contentTypeHeader: 'application/json'},
          ));
      d(response);
      return response.data['status'];
    } catch (e) {
      d(e);
      throw e.toString();
    }
  }
}
