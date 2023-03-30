import 'package:memorylif/constant/constants.dart';
import 'package:memorylif/data/local_data_source/preference/i_pref_helper.dart';
import 'package:memorylif/di/di.dart';
import 'package:memorylif/services/navService/i_navigation_service.dart';
import 'package:memorylif/ui/utils/utils.dart';

mixin BaseMixin {
  final INavigationService _navigator = inject<INavigationService>();
  final Px _dimens = inject<Px>();
  final IPrefHelper iPrefHelper = inject();
  final Utils _utils = inject<Utils>();
  Utils get utils => _utils;
  INavigationService get navigator => _navigator;
  Px get dimens => _dimens;

  String getDayStatus() {
    DateTime now = DateTime.now();
    int currentHour = now.hour;

    return _getTimeOfDay(currentHour);
  }

  String _getTimeOfDay(int hour) {
    if (hour >= 5 && hour < 12) {
      return "morning";
    } else if (hour >= 12 && hour < 17) {
      return "afternoon";
    } else if (hour >= 17 && hour < 20) {
      return "evening";
    } else {
      return "night";
    }
  }

}
