class Transaction {
  final String id;
  final String desc;
  final double amount;
  final DateTime date;

  Transaction({
    required this.id,
    required this.desc,
    required this.amount,
    required this.date,
  });
}
