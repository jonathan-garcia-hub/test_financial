import 'package:flutter/material.dart';
import '../widgets/balance_summary.dart';
import '../widgets/line_chart.dart';
import '../widgets/transaction_list.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Financial Dashboard'),
      ),
      body: Column(
        children: [
          BalanceSummary(),
          Expanded(child: TransactionList()),
          Container(
            height: 200,
            child: LineChartWidget(),
          ),
        ],
      ),
    );
  }
}
