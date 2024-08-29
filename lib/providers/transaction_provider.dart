
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionProvider with ChangeNotifier {

  String _fillter = 'all';

  List<Transaction> _transactions = [
    // Ejemplos de transacciones
    Transaction(id: 't1', type: 'income', date: DateTime.now().subtract(Duration(days: 1)), amount: 1200.00, title: 'Comida'),
    Transaction(id: 't2', type: 'expense', date: DateTime.now().subtract(Duration(days: 2)), amount: 300.50, title: 'Alquiler'),
    Transaction(id: 't3', type: 'income', date: DateTime.now().subtract(Duration(days: 3)), amount: 1500.00, title: 'Salidas'),
    Transaction(id: 't4', type: 'expense', date: DateTime.now().subtract(Duration(days: 4)), amount: 600.00, title: 'Comida'),
    Transaction(id: 't4', type: 'income', date: DateTime.now().subtract(Duration(days: 4)), amount: 500.00, title: 'Salidas'),
    Transaction(id: 't5', type: 'income', date: DateTime.now().subtract(Duration(days: 5)), amount: 800.00, title: 'Comida'),
    Transaction(id: 't6', type: 'expense', date: DateTime.now().subtract(Duration(days: 6)), amount: 200.00, title: 'Comida'),
    Transaction(id: 't7', type: 'income', date: DateTime.now().subtract(Duration(days: 6)), amount: 200.00, title: 'Salidas'),
    Transaction(id: 't8', type: 'expense', date: DateTime.now().subtract(Duration(days: 6)), amount: 1200.00, title: 'Salidas'),
    Transaction(id: 't9', type: 'income', date: DateTime.now().subtract(Duration(days: 7)), amount: 300.50, title: 'Comida'),
    Transaction(id: 't10', type: 'income', date: DateTime.now().subtract(Duration(days: 7)), amount: 1500.00, title: 'Salidas'),
    Transaction(id: 't11', type: 'expense', date: DateTime.now().subtract(Duration(days: 7)), amount: 600.00, title: 'Salidas'),
    Transaction(id: 't12', type: 'expense', date: DateTime.now().subtract(Duration(days: 8)), amount: 500.00, title: 'Comida'),
    Transaction(id: 't13', type: 'income', date: DateTime.now().subtract(Duration(days: 8)), amount: 800.00, title: 'Ahorro'),
    Transaction(id: 't14', type: 'income', date: DateTime.now().subtract(Duration(days: 9)), amount: 200.00, title: 'Ahorro'),
    Transaction(id: 't15', type: 'expense', date: DateTime.now().subtract(Duration(days: 9)), amount: 200.00, title: 'Salidas'),
  ];

  List<Transaction> get transactions => _transactions;

  String get fillter => _fillter;

  void updateFillter(String fillter){
    _fillter = fillter;
    notifyListeners();
  }

  void addTransaction(Transaction transaction) {
    _transactions.add(transaction);
    notifyListeners();
  }

  void removeTransaction(String id) {
    _transactions.removeWhere((txn) => txn.id == id);
    notifyListeners();
  }

  List<Transaction> filterTransactions(String type) {
    return _transactions.where((txn) => txn.type == type).toList();
  }

  double getTotalIncome() {
    return _transactions
        .where((txn) => txn.type == 'income')
        .fold(0.0, (sum, item) => sum + item.amount);
  }

  double getTotalExpenses() {
    return _transactions
        .where((txn) => txn.type == 'expense')
        .fold(0.0, (sum, item) => sum + item.amount);
  }

  double getBalance() {
    return getTotalIncome() - getTotalExpenses();
  }
}
