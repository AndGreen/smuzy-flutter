import 'package:flutter/material.dart';
import 'package:smuzy_flutter/modules/app/app.dart';
import 'package:smuzy_flutter/modules/app/local_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDatabase.init();
  runApp(const App());
}
