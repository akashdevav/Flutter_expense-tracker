import 'package:expense_app/Model/expense.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  Chart({super.key, required this.expenses});

  List<Expense> expenses;
  List<ExpensesBuckets> get buckets {
    return [
      ExpensesBuckets.forCategory(expenses, Category.food),
      ExpensesBuckets.forCategory(expenses,  Category.leisure),
      ExpensesBuckets.forCategory(expenses,  Category.travel),
      ExpensesBuckets.forCategory(expenses,  Category.work),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}