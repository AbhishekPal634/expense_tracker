import 'package:expense_tracker/screens/home_page.dart';
import 'package:flutter/material.dart';

var kCOlorScheme = ColorScheme.fromSeed(seedColor: Colors.white);

void main() {
  runApp(
    const MaterialApp(
      home: HomePage(),
    ),
  );
}
