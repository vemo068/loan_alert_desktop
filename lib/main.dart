import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loan_alert_desktop/controllers/loans_controller.dart';
import 'package:loan_alert_desktop/database/loan.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  runApp(LoansApp());
}

class LoansApp extends StatelessWidget {
  final LoanController loanController = Get.put(LoanController());
  LoansApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'LoansApp',
      home: LoanListPage(),
    );
  }
}

class LoanListPage extends StatelessWidget {
  final LoanController loanController = Get.find<LoanController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          loanController.createDummyLoans();
        },
      ),
      appBar: AppBar(
        title: Text('Loan List'),
      ),
      body: GetBuilder(
          init: loanController,
          builder: (_) {
            return ListView.builder(
              itemBuilder: ((context, index) {
                return LoanItem(loan: loanController.loanss[index]);
              }),
              itemCount: loanController.loanss.length,
            );
          }),
    );
  }
}

class LoanItem extends StatelessWidget {
  final Loan loan;

  const LoanItem({Key? key, required this.loan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat.yMMMMd();
    Duration difference = DateTime.now().difference(loan.date);
    return ListTile(
      title: Text(
        loan.name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: difference.inDays > 7 ? Colors.red : Colors.black,
        ),
      ),
      subtitle: Text(
        'Amount: ${loan.amount} - Date: ${dateFormat.format(loan.date)} - Paid: ${loan.status}',
      ),
    );
  }
}
