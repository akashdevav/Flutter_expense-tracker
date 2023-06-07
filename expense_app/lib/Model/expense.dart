//These class is used for the "data model" for custom class and object that can be grouped together.

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();
enum Category {food, travel, work, leisure}

const categoryItem = {
  Category.food : Icons.lunch_dining, 
  Category.travel : Icons.drive_eta, 
  Category.leisure : Icons.movie_creation_outlined,
  Category.work : Icons.work
};

class Expense {
  Expense({required this.title, required this.amount, required this.date, required this.category,})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formatedate {
    return formatter.format(date);
  }
}
