import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTheme {
  ThemeData themeData = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xfff0f0f0),
    listTileTheme: ListTileThemeData(
      tileColor: const Color(0xff4c8890),
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    appBarTheme: const AppBarTheme(
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        color: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: const Color(0xff4c8890),
    ),
  );
}
