import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:news_mobx_app/services/preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var sharedPreferences = await SharedPreferences.getInstance();
  await FlutterStatusbarcolor.setStatusBarColor(Colors.teal);
  if (useWhiteForeground(Colors.teal)) {
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
  } else {
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
  }
  runApp(App(PreferencesService(sharedPreferences)));
}
