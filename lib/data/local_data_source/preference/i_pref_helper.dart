
import 'package:shared_preferences/shared_preferences.dart';

abstract class IPrefHelper {
  String? retrieveToken();
  void setAppStatusPremium(bool premiumStatus);
  bool? getAppPremiumStatus();
  void saveToken(value);
  void removeToken();
  void saveBool(String key, bool value);
  bool?  getBool(String key);
  void saveUser(var verificationModel);
   retrieveUser();
  void removeUser();

  SharedPreferences get();
  void clear();
}
