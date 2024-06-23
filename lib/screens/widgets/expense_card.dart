import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({required this.expense, super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        // child: Text(expense.title),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromARGB(255, 247, 244, 247),
              ),
              child: Center(
                child: SizedBox(
                  width: 45,
                  child: categoryIcons[expense.category],
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              children: [
                Text(expense.title),
                const Text('category here'),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                Text('₹${expense.amount.toStringAsFixed(2)}'),
                const SizedBox(height: 15),
                Text(expense.formattedDate),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
