import 'package:flutter/material.dart';
import 'package:one_link_wallet/core/app_constants/app_colors.dart';
import 'package:one_link_wallet/core/app_constants/app_images.dart';
import 'package:one_link_wallet/core/app_constants/app_styles.dart';

class ActionsWidget extends StatelessWidget {
  const ActionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _actionWidget(
            AppColors.blue.withOpacity(0.5), AppImages.sendMony, 'Send'),
        _actionWidget(
            AppColors.blue.withOpacity(0.2), AppImages.reciveMony, 'Recive'),
        _actionWidget(
            AppColors.green.withOpacity(0.2), AppImages.history, 'History')
      ],
    );
  }
}

Widget _actionWidget(Color contanerColor, String image, String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: Container(
      height: 85,
      width: 85,
      decoration: BoxDecoration(
          borderRadius: AppStyles.borderCircle(), color: contanerColor),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 30,
              height: 30,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              text,
              style: AppStyles.textStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black),
            ),
          ],
        ),
      ),
    ),
  );
}
