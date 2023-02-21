import 'dart:async';
import 'package:memorylif/application/main_config/main_config.dart' as config;
import 'package:flutter/material.dart';
import 'package:memorylif/application/main_config/routes/route_import.dart';

import 'application/app.dart';
import 'common/logger/log.dart';
typedef SetRegisteredRoutes = Route<dynamic> Function(RouteSettings settings);

Future<void> main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();     
    await config.initMainServiceLocator();
    const routes = RouteGenerator.generateRoute;
    const root = ChatGPTCenteralApp(route: routes);
  
    runApp(root);
  }, (error, stackTrace) async {      
    d('ZonedGuardedError:  ${error.toString()} $stackTrace');
  });
}