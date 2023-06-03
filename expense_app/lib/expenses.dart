import 'package:expense_app/Model/expense.dart';
import 'package:expense_app/expenses_list.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
