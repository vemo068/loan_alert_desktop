import 'package:objectbox/objectbox.dart';

@Entity()
@Sync()
class Loan {
  int id;
  String name;
  double amount;
  DateTime date;
  String status;

  Loan({
    this.id = 0,
    required this.name,
    required this.amount,
    required this.date,
    required this.status,
  });
}
