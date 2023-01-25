import 'package:flutter/material.dart';
import 'package:smuzy/modules/app/app.dart';
import 'package:smuzy/modules/app/local_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDatabase.init();
  runApp(const App());
}
