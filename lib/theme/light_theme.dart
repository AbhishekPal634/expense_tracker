import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'Poppins',
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 32,
      fontFamily: 'Poppins',
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(
        const Color.fromARGB(255, 104, 61, 239),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(
      const Color.fromARGB(255, 104, 61, 239),
    )),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(
      const Color.fromARGB(255, 104, 61, 239),
    )),
  ),
  colorScheme: const ColorScheme.light(
    surface: Colors.white,
    primary: Color.fromARGB(255, 238, 233, 252),
    secondary: Color.fromARGB(255, 104, 61, 239),
  ),
);
