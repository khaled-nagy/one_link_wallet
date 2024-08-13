import 'package:one_link_wallet/features/cards/presentation/pages/cards_page.dart';
import 'package:one_link_wallet/features/transactions/presentation/pages/transactions_page.dart';
import 'package:one_link_wallet/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../settings/presentation/pages/settings_page.dart';

class MainAppController extends GetxController implements GetxService {
  int bottomNavIndex = 0;

  List<Widget> mainPagesList = [
    Navigator(
      key: Get.nestedKey(0),
      onGenerateRoute: (routeSettings) => MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    ),
    Navigator(
      key: Get.nestedKey(1),
      onGenerateRoute: (routeSettings) => MaterialPageRoute(
        builder: (context) => const TransactionsPage(),
      ),
    ),
    Navigator(
      key: Get.nestedKey(2),
      onGenerateRoute: (routeSettings) => MaterialPageRoute(
        builder: (context) => const CardsPage(),
      ),
    ),
    Navigator(
      key: Get.nestedKey(3),
      onGenerateRoute: (routeSettings) => MaterialPageRoute(
        builder: (context) => const SettingsPage(),
      ),
    ),
  ];

  changeBottomNavIndex(int index) {
    if (index != bottomNavIndex) {
      bottomNavIndex = index;
      Future.delayed(const Duration(milliseconds: 2)).then((value) => update());
    } else {
      Get.until((route) => route.isFirst, id: bottomNavIndex);
    }
  }

  setInitIndex(int index) async {
    if (index == 0) {
      return;
    }
    await Future.delayed(Duration(milliseconds: index == 2 ? 800 : 200));
    bottomNavIndex = index;
    update();
    Get.forceAppUpdate();
  }
}
