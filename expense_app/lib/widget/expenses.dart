import 'package:expense_app/Model/expense.dart';
import 'package:expense_app/widget/expenses_list/expenses_list.dart';
import 'package:expense_app/widget/new_expenses.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpense = [
    Expense(
        title: 'flutter',
        amount: 13.12,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'cenima',
        amount: 10.12,
        date: DateTime.now(),
        category: Category.leisure)
  ];

  //Method for the add icon to show the new_bottom_add_overlay.
  void _openAddOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const NewExpenses(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _openAddOverlay,
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
        title: const Text('Flutter Expenses-Tracker'),
      ),
      body: Column(
        children: [
          const Text('Expenses chart'),
          Expanded(
            child: ExpensesList(expenses: _registeredExpense),
          ),
        ],
      ),
    );
  }
}
