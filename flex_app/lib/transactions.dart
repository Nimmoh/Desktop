
class Transaction {
  final String title;
  final String description;
  final double amount;
  final DateTime date;

  Transaction({
    required this.title,
    required this.description,
    required this.amount,
    required this.date,
  });
}
