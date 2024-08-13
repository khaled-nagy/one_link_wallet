import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:one_link_wallet/features/main_app/presentation/pages/main_app_page.dart';

class SplashController extends GetxController {
  SplashController();

  Option<Exception> initAppStatus = const None();

  void initApp() async {
    Timer(const Duration(seconds: 2), () {
      Get.off(() => const MainAppPage());
    });
    update();
  }
}
