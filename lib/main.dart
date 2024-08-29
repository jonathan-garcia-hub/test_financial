import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/transaction_provider.dart';
import 'screens/dashboard_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TransactionProvider(),
      child: MaterialApp(
        title: 'Financial Dashboard',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: DashboardScreen(),
      ),
    );
  }
}
//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:test_financial/providers/transaction_provider.dart';
// import 'package:test_financial/widgets/%20transaction_list_widget.dart';
// import 'package:test_financial/widgets/line_chart.dart';
// import 'package:test_financial/widgets/summary_widget.dart';
//
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => TransactionProvider(),
//       child: MaterialApp(
//         home: DashboardScreen(),
//       ),
//     );
//   }
// }
//
// class DashboardScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Financial Dashboard')),
//       body: Column(
//         children: [
//           SummaryWidget(),
//
//           Expanded(child: TransactionListWidget()),
//           SizedBox(height: 20),
//           Container(
//             height: 200,
//             child: LineChartWidget(),
//           ),
//           // LineChartWidget,
//           // TransactionListWidget(),
//         ],
//       ),
//     );
//   }
// }
//
