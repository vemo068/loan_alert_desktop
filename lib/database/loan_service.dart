import 'package:loan_alert_desktop/database/loan.dart';
import 'package:objectbox/objectbox.dart';

class LoanService {
  final Store _store;

  LoanService(this._store);

  Box<Loan> get _loanBox => _store.box<Loan>();

  Future<List<Loan>> getAllLoans() async {
    return _loanBox.getAll();
  }

  Future<void> addLoan(Loan loan) async {
    _loanBox.put(loan);
  }

  Future<void> updateLoan(Loan loan) async {
    _loanBox.put(loan);
  }

  Future<void> deleteLoan(int loanId) async {
    _loanBox.remove(loanId);
  }
}
