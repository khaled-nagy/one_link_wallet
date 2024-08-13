import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_link_wallet/features/home/presentation/widgets/transactions_widget.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Padding(
      padding: EdgeInsets.only(top: 50, left: 16, right: 16),
      child: SingleChildScrollView(
        child: TransactionsWidget(
          listCount: 15,
        ),
      ),
    ));
  }
}
