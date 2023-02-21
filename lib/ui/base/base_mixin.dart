
import 'package:memorylif/constant/constants.dart';
import 'package:memorylif/di/di.dart';
import 'package:memorylif/services/navService/i_navigation_service.dart';
import 'package:memorylif/ui/utils/utils.dart';

mixin BaseMixin {
  final INavigationService _navigator = inject<INavigationService>();
  final Px _dimens = inject<Px>();
  final Utils _utils = inject<Utils>();
  Utils get utils => _utils;

  INavigationService get navigator => _navigator;
  Px get dimens => _dimens;
}
