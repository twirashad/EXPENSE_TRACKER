import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

const categoryIcons = {
  Category.food: '🍔',
  Category.travel: '✈️',
  Category.leisure: '🎮',
  Category.work: '💼',
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
