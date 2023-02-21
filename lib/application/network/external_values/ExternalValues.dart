import 'package:memorylif/application/network/external_values/iExternalValue.dart';

class ExternalValues implements IExternalValues {
  @override
  String getBaseUrl() {
    return 'https://mindshift.onrender.com/v1';
  }

  @override
  String countriesBaseUrl() {
    return "https://countriesnow.space";
  }
}
