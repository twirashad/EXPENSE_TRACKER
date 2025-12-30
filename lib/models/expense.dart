import 'package:uuid/uuid.dart';

const uuid = Uuid();
enum Category {
  food,
  travel,
  leisure,
  work,
  other,
}

class Expense {
  Expense({
    required this.category,
    required this.title,
   required this.amount,
    required this.date
  }): id = Uuid().v4();

  final Category category;  
  final String id;
  final String title;
  final double amount;
  final DateTime date;
}
