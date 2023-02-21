// ignore_for_file: depend_on_referenced_packages

import 'package:audioplayers_web/audioplayers_web.dart';
import 'package:flutter_secure_storage_web/flutter_secure_storage_web.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:shared_preferences_web/shared_preferences_web.dart';

void registerPlugins(Registrar registrar) {
  AudioplayersPlugin.registerWith(registrar);
  FlutterSecureStorageWeb.registerWith(registrar);
  SharedPreferencesPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}
