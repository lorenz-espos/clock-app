import 'package:flutter/material.dart';

class Mytheme {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.grey.shade900,
      primaryColor: Colors.grey.shade900,
      colorScheme: ColorScheme.dark(),
      iconTheme: IconThemeData(color: Colors.orangeAccent, opacity: 0.8));
  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.white,
      colorScheme: ColorScheme.light(),
      iconTheme: IconThemeData(color: Colors.grey.shade900, opacity: 0.6));
}
