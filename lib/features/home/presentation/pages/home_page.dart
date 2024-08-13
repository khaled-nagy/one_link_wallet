import 'package:one_link_wallet/features/home/presentation/widgets/actions_widget.dart';
import 'package:one_link_wallet/features/home/presentation/widgets/balance_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_link_wallet/features/home/presentation/widgets/favorets_widget.dart';
import 'package:one_link_wallet/features/home/presentation/widgets/transactions_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: const Padding(
        padding: EdgeInsets.only(top: 32, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BalanceWidget(),
              SizedBox(
                height: 32,
              ),
              ActionsWidget(),
              SizedBox(
                height: 32,
              ),
              FavoretsWidget(),
              SizedBox(
                height: 32,
              ),
              TransactionsWidget(
                listCount: 6,
              )
            ],
          ),
        ),
      ),
    );
  }
}
