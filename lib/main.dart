import 'package:expense_tracker/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/theme/light_theme.dart';
import 'package:expense_tracker/theme/dark_theme.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const HomePage(),
    ),
  );
}
