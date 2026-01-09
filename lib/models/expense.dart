import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();
const uuid = Uuid();


const categoryIcons = {
  Category.food: Icons.fastfood,
  Category.travel: Icons.flight,
  Category.leisure: Icons.videogame_asset,
  Category.work: Icons.work,
};

enum Category { food, travel, leisure, work }

class Expense {
  Expense({
    required this.category,
    required this.title,
    required this.amount,
    required this.date,
  }) : id = Uuid().v4();

  final Category category;
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});

  ExpenseBucket.forCategory(final List<Expense> allExpenses, this.category)
    : expenses = allExpenses.where((expense) => expense.category == category).toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount;
    }

    return sum;
  }
}
