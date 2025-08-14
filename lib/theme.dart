import 'package:flutter/material.dart';

ThemeData lightmode = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      surface: Colors.yellow,
      primary: Colors.black,
      secondary: Colors.white,
    ));

ThemeData darkmode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
        surface: Colors.black,
        primary: Colors.yellow,
        secondary: Colors.black));
