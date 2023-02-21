import 'dart:io';
import 'package:get_it/get_it.dart';
import 'package:memorylif/constant/constants.dart';
import 'package:memorylif/services/navService/i_navigation_service.dart';
import 'package:memorylif/services/navService/nav_service.dart';
import 'package:memorylif/ui/utils/overlay_helper.dart';
import 'package:memorylif/ui/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../application/network/external_values/ExternalValues.dart';
import '../application/network/external_values/iExternalValue.dart';

final inject = GetIt.instance;

Future<void> setupLocator() async {
  inject.registerSingletonAsync(() => SharedPreferences.getInstance());
  inject.registerLazySingleton<IExternalValues>(() => ExternalValues());
  inject.registerLazySingleton<Px>(() => Px());
  inject.registerLazySingleton<Utils>(() => Utils());

  inject.registerLazySingleton<INavigationService>(() => NavigationService());

  if (Platform.isIOS) {
    inject
        .registerLazySingleton<OverlayEntryHelper>(() => OverlayEntryHelper());
  }
}
