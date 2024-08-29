import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/transaction_provider.dart';
import '../models/transaction.dart';

class TransactionList extends StatefulWidget {
  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  String _filterType = 'all';

  @override
  Widget build(BuildContext context) {
    final transactionProvider = Provider.of<TransactionProvider>(context);

    List<Transaction> transactions = _filterType == 'all'
        ? transactionProvider.transactions
        : transactionProvider.filterTransactions(_filterType);

    return Column(
      children: [
        DropdownButton<String>(
          value: _filterType,
          onChanged: (value) {
            setState(() {
              _filterType = value!;
              transactionProvider.updateFillter(_filterType);
            });
          },
          items: [
            DropdownMenuItem(value: 'all', child: Text('All')),
            DropdownMenuItem(value: 'income', child: Text('Income')),
            DropdownMenuItem(value: 'expense', child: Text('Expenses')),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final txn = transactions[index];
              final isIncome = txn.type == 'income'; // Suponiendo que `type` es una propiedad de `Transaction`.

              // Formatear la fecha
              final formattedDate = DateFormat('dd/MM/yyyy hh:mm a').format(txn.date);

              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                elevation: 5,
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 14),
                  title: Text(
                    txn.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(formattedDate),
                  trailing: Text(
                    '\$${txn.amount.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: isIncome ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
