import 'dart:math';

import 'package:get/get.dart';
import 'package:loan_alert_desktop/database/loan.dart';
import 'package:loan_alert_desktop/database/loan_service.dart';
import 'package:loan_alert_desktop/objectbox.g.dart';
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_sync_flutter_libs/objectbox_sync_flutter_libs.dart';

class LoanController extends GetxController {
 late final LoanService _loanService;
  late final Box<Loan> _loanBox;
  List<Loan> loanss = [];

  @override
  void onInit() async {
    final store = Store(getObjectBoxModel(),
        directory: (await defaultStoreDirectory()).path + '-sync',
        macosApplicationGroup: 'loans' // TODO replace with a real name
        );
    _loanService = LoanService(store);
    _loanBox = store.box<Loan>();
    await _readLoans();
    super.onInit();
  }

  Future<void> _readLoans() async {
  
       loanss = await _loanService.getAllLoans();
    

    update();
  }

  Future<void> createLoan(Loan loan) async {
    await _loanService.addLoan(loan);
    await _readLoans();
  }

  Future<void> updateLoan(Loan loan) async {
    await _loanService.updateLoan(loan);
    await _readLoans();
  }

  Future<void> deleteLoan(Loan loan) async {
    await _loanService.deleteLoan(loan.id);
    await _readLoans();
  }

  Future<void> createDummyLoans() async {
    final random = Random();
    for (int i = 0; i < 10; i++) {
      final name = 'Loan ${i + 1}';
      final amount = (random.nextDouble() * 10000).toStringAsFixed(2);
      final date = DateTime.now().subtract(Duration(days: random.nextInt(365)));
      List<String> options = ['Pending', 'Paid'];
      String randomOption = options[Random().nextInt(options.length)];

      final loan = Loan(
          name: name,
          amount: (double.parse(amount)),
          date: date,
          status: randomOption);
      await createLoan(loan);
      print("gg");
    }
  }
}
