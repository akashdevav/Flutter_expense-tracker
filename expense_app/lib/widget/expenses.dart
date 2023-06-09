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
        title: 'Kerala Trip',
        amount: 230.50,
        date: DateTime.now(),
        category: Category.travel),
    Expense(
        title: 'Food Paradise',
        amount: 30.50,
        date: DateTime.now(),
        category: Category.food),
  ];

  //Method for the add icon to show the new_bottom_add_overlay.
  void _openAddOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpenses(addExpenses: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpense.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final listIndex = _registeredExpense.indexOf(expense);
    setState(() {
      _registeredExpense.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Item Deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpense.insert(listIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expenses Found. Start adding some'),
    );
    if (_registeredExpense.isNotEmpty) {
      mainContent = ExpensesList(
          expenses: _registeredExpense, onRemoveExpense: _removeExpense);
    }
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
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
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
