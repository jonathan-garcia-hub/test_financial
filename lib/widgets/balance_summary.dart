import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/transaction_provider.dart';

class BalanceSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final transactionProvider = Provider.of<TransactionProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text('Total Balance: \$${transactionProvider.getBalance().toStringAsFixed(2)}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Income: \$${transactionProvider.getTotalIncome().toStringAsFixed(2)}'),
              Text('Expenses: \$${transactionProvider.getTotalExpenses().toStringAsFixed(2)}'),
            ],
          ),
        ],
      ),
    );
  }
}
