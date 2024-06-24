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
  final List<Expense> _registeredExpense = [];

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpense.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpense.indexOf(expense);
    setState(() {
      _registeredExpense.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpense.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).colorScheme.primary,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => FractionallySizedBox(
        heightFactor: 0.8,
        child: ExpenseOverlay(
          onAddExpense: _addExpense,
        ),
      ),
    );
  }

  final String userName = 'Abhishek';

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expense found. Start adding some!'),
    );

    if (_registeredExpense.isNotEmpty) {
      mainContent = ExpenseList(
        addExpenses: _registeredExpense,
        removeExpenses: _removeExpense,
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text.rich(
          TextSpan(
            children: [
              const TextSpan(
                text: 'Hello,\n',
                style: TextStyle(
                  fontWeight: FontWeight.w400, 
                ),
              ),
              TextSpan(
                text: userName,
                style: const TextStyle(
                  fontWeight: FontWeight.w700, 
                ),
              ),
            ],
          ),
        ),
        toolbarHeight: 110,
        backgroundColor: Theme.of(context).colorScheme.surface,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: OutlinedButton(
              onPressed: _openAddExpenseOverlay,
              style: OutlinedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(10),
                side: const BorderSide(
                    color: Color.fromARGB(65, 158, 158, 158), width: 1.5),
              ),
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            // const Text('Chart'),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35),
              ),
              elevation: 2,
              color: Theme.of(context).colorScheme.secondary,
              child: Container(
                height: 230,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: mainContent,
            ),
          ],
        ),
      ),
    );
  }
}
