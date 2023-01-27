import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smuzy/modules/app/app.dart';
import 'package:smuzy/modules/app/local_database.dart';

void initConfigs() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
}

void main() async {
  initConfigs();
  await LocalDatabase.init();
  runApp(const App());
}
