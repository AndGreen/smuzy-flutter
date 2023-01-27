import 'package:flutter/material.dart';

// TODO: rewrite using Context extension
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

  static var defaultRoutinesColors = {
    "red": const Color(0xffe25241),
    "pink": const Color(0xffd73965),
    "purple": const Color(0xff9037aa),
    "deepPurple": const Color(0xff6041b1),
    "indigo": const Color(0xff4154af),
    "blue": const Color(0xff4696ec),
    "cyan": const Color(0xff53bad1),
    "teal": const Color(0xff419488),
    "green": const Color(0xff67ac5c),
    "lightGreen": const Color(0xffd1da59),
    "yellow": const Color(0xfffdea60),
    "orange": const Color(0xfff29c38),
    "brown": const Color(0xff74564a),
    "gray": const Color(0xff9e9e9e),
    "blueGray": const Color(0xff667d8a),
    "black": const Color(0xff344047),
  };
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
