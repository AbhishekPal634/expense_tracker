import 'package:expense_tracker/screens/expense_overlay.dart';
import 'package:expense_tracker/screens/widgets/expense_list.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Expense> _registeredExpense = [
    Expense(
      title: 'Flutter Course',
      amount: 649,
      category: Category.work,
      date: DateTime.now(),
    ),
    Expense(
      title: 'Movie',
      amount: 149,
      category: Category.leisure,
      date: DateTime.now(),
    ),
  ];

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpense.add(expense);
    });
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => FractionallySizedBox(
        heightFactor: 0.85,
        child: ExpenseOverlay(
          onAddExpense: _addExpense,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('MoneyMap'),
        backgroundColor: Colors.white,
        toolbarHeight: 120,
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            // const Text('Chart'),
            Container(
              height: 230,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: const Color.fromARGB(255, 172, 150, 233),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: ExpenseList(expenses: _registeredExpense),
            ),
          ],
        ),
      ),
    );
  }
}
