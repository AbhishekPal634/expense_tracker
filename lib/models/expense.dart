import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat('dd/MM/yyyy');

const uuid = Uuid();

enum Category {food, travel, leisure, work}

final categoryIcons = {
  Category.food : Image.asset('assets/images/food.png'),
  Category.travel : Image.asset('assets/images/travel.png'),
  Category.work : Image.asset('assets/images/work.png'),
  Category.leisure : Image.asset('assets/images/leisure.png'),
};

class Expense {
  Expense({required this.title, required this.amount, required this.date, required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}