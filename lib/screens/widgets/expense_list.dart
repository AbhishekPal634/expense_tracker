import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/screens/widgets/expense_card.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({required this.addExpenses,  required this.removeExpenses, super.key});

  final List<Expense> addExpenses;
  final void Function(Expense expense) removeExpenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: addExpenses.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(addExpenses[index]),
        onDismissed: (direction) {
          removeExpenses(addExpenses[index]);
        },
        child: ExpenseCard(expense: addExpenses[index]),
      ),
    );
  }
}
