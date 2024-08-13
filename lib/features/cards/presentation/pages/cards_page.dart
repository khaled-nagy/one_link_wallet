import 'package:one_link_wallet/core/app_constants/app_images.dart';
import 'package:one_link_wallet/core/common_widgets/alerts_widgets/custom_message.dart';
import 'package:one_link_wallet/features/cards/presentation/controller/cards_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CardsController>(
      builder: (controller) {
        return const Scaffold(
          body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CustomMessage(
                image: AppImages.emptyCart,
                title: "No Cards Yet",
              )),
        );
      },
    );
  }
}
