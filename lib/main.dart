import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:memorylif/application/main_config/main_config.dart' as config;
import 'package:flutter/material.dart';
import 'package:memorylif/application/main_config/routes/route_import.dart';
// Import the generated file
import 'firebase_options.dart';
import 'application/app.dart';
import 'common/logger/log.dart';

typedef SetRegisteredRoutes = Route<dynamic> Function(RouteSettings settings);

Future<void> main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();     
    await config.initMainServiceLocator();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    const routes = RouteGenerator.generateRoute;
    const root = MemoryLifApp(route: routes);
    await Hive.initFlutter();
    runApp(root);
  }, (error, stackTrace) async {      
    d('ZonedGuardedError:  ${error.toString()} $stackTrace');
  });
}