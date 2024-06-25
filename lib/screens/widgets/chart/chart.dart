import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  const Chart({required this.expense, super.key});

  final List<Expense> expense;

  List<ExpenseBucket> get buckets {
    return [
      ExpenseBucket.forCategory(expense, Category.food),
      ExpenseBucket.forCategory(expense, Category.leisure),
      ExpenseBucket.forCategory(expense, Category.travel),
      ExpenseBucket.forCategory(expense, Category.work),
    ];
  }

  double get maxTotalExpense {
    double maxTotalExpense = 0;

    for (final bucket in buckets) {
      if (bucket.totalExpenses > maxTotalExpense) {
        maxTotalExpense = bucket.totalExpenses;
      }
    }
    return maxTotalExpense;
  }

  double get overallTotalExpense {
    double overallTotalExpense = 0;

    for (final bucket in buckets) {
      overallTotalExpense += bucket.totalExpenses;
    }

    return overallTotalExpense;
  }

  String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
      ),
      elevation: 2,
      color: Theme.of(context).colorScheme.secondary,
      child: SizedBox(
        height: 240,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              padding: const EdgeInsets.fromLTRB(30, 20, 20, 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total Expense',
                    style: TextStyle(color: Colors.white),
                  ),
                  // const SizedBox(height: 5,),
                  Text(
                    '₹${overallTotalExpense.toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  for (final bucket in buckets) // alternative to map()
                    ChartBar(
                      fill: bucket.totalExpenses == 0
                          ? 0
                          : bucket.totalExpenses / maxTotalExpense,
                    )
                ],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: buckets
                  .map(
                    (bucket) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        // child: SizedBox(
                        //   width: 40, // Set the desired width
                        //   height: 40, // Set the desired height
                        //   child: categoryIcons[bucket.category],
                        // ),
                        child: Text(
                          capitalize(bucket.category.name),
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
