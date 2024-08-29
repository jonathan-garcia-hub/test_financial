import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import '../providers/transaction_provider.dart';
import '../models/transaction.dart';

class LineChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final transactionProvider = Provider.of<TransactionProvider>(context);

    List<Transaction> transactions = transactionProvider.fillter == 'all'
        ? transactionProvider.transactions
        : transactionProvider.filterTransactions(transactionProvider.fillter);

    final data = _createChartData(transactions);

    final series = [
      charts.Series<Transaction, DateTime>(
        id: 'Income',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (Transaction txn, _) => txn.date,
        measureFn: (Transaction txn, _) => txn.amount,
        data: data['income']!,
      ),
      charts.Series<Transaction, DateTime>(
        id: 'Expenses',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (Transaction txn, _) => txn.date,
        measureFn: (Transaction txn, _) => txn.amount,
        data: data['expenses']!,
      ),
    ];

    return charts.TimeSeriesChart(
      series,
      animate: true,
      dateTimeFactory: const charts.LocalDateTimeFactory(),
    );
  }

  Map<String, List<Transaction>> _createChartData(List<Transaction> transactions) {
    List<Transaction> income = transactions
        .where((txn) => txn.type == 'income')
        .toList();
    List<Transaction> expenses = transactions
        .where((txn) => txn.type == 'expense')
        .toList();

    return {'income': income, 'expenses': expenses};
  }
}
