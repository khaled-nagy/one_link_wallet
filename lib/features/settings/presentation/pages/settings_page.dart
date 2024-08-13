import 'package:one_link_wallet/core/app_constants/app_images.dart';
import 'package:one_link_wallet/core/common_widgets/alerts_widgets/custom_message.dart';
import 'package:one_link_wallet/features/settings/presentation/controllers/settings_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
        builder: (controller) => const Scaffold(
                body: CustomMessage(
              image: AppImages.emptyCart,
              title: "No Settings Yet",
            )));
  }
}
