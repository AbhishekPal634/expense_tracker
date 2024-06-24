import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'Poppins',
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 32,
      fontFamily: 'Poppins',
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(const Color.fromARGB(255, 104, 61, 239)),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(const Color.fromARGB(255, 104, 61, 239)),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(const Color.fromARGB(255, 104, 61, 239)),
    ),
  ),
  // datePickerTheme: const DatePickerThemeData(
  //   backgroundColor: Color.fromARGB(255, 40, 41, 65),
  // ),
  colorScheme: const ColorScheme.dark(
    surface: Color.fromARGB(255, 27, 28, 49),
    primary: Color.fromARGB(255, 40, 41, 65),
    secondary: Color.fromARGB(255, 104, 61, 239),
  ),
);