

import 'package:memorylif/data/models/user_model.dart';
import 'package:memorylif/ui/base/base_view_model.dart';


class AppViewModel extends BaseViewModel {
  UserModel? userData;

  saveUserModel({required UserModel newUserData}){
    userData = newUserData;
    notifyListeners();
  }

}
