// This class is used to display the list containing the items like title, amount, and date

import 'package:expense_app/Model/expense.dart';
import 'package:flutter/material.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem(this.expenses, {super.key});

  final Expense expenses;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expenses.title, 
            style: const TextStyle(fontWeight: FontWeight.bold),),
            Row(
              children: [
                Text('\$${expenses.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryItem[expenses.category]),
                    const SizedBox(width: 4,),
                    Text(expenses.formatedate)
                  ],
                )
              ],
            )
          ],
        ),
        
      ),
    );
  }
}
