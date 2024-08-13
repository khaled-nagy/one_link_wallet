import 'package:one_link_wallet/core/app_constants/app_images.dart';
import 'package:one_link_wallet/core/common_widgets/alerts_widgets/custom_string_message.dart';
import 'package:one_link_wallet/core/common_widgets/loading_widget.dart';
import 'package:one_link_wallet/core/exceptions/exception_handler.dart';
import 'package:one_link_wallet/features/splash/presentation/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Get.find<SplashController>().initApp();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) => Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'app_logo',
                  child: Image.asset(
                    AppImages.logo,
                    height: 150,
                  ),
                ),
                const SizedBox(height: 50),
                controller.initAppStatus.fold(
                  () => const LoadingWidget(),
                  (a) => CustomStringMessage(
                    action: () => controller.initApp(),
                    message: exceptionHandler(a),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
