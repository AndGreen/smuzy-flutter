import 'package:flutter/material.dart';

class AppColors {
  static const active = Color(0xffF5FFA7);
  static const white = Color(0xffffffff);
  static const grayDark = Color(0xff121212);
  static const grayLight = Color(0xFF535353);
  static const gray = Color(0xff171719);
  static const grayBg = Color(0xff2D2E33);
  static const lightBg = Color(0xfff2f2f7);
  static const border = Color(0xff1C1D21);
  static const borderLight = Color(0xFFC2C2C2);
  static const green = Color(0xff26A258);
}

extension DarkMode on BuildContext {
  /// is dark mode currently enabled?
  bool get isDarkMode {
    final brightness = MediaQuery.of(this).platformBrightness;
    return brightness == Brightness.dark;
  }

  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
}
