import 'package:one_link_wallet/core/app_constants/app_strings.dart';
import 'package:one_link_wallet/core/common_widgets/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_constants/app_colors.dart';
import '../../app_constants/app_styles.dart';

class CustomMessage extends StatelessWidget {
  const CustomMessage({
    super.key,
    required this.image,
    required this.title,
    this.subtitle = '',
    this.action,
  });

  final String image, title, subtitle;
  final void Function()? action;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 170,
          ),
          const SizedBox(height: 12),
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppStyles.textStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: Get.width * .9,
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: AppStyles.textStyle(
                fontSize: 15,
                color: AppColors.black,
                isOverFlow: false,
              ),
            ),
          ),
          if (action != null) ...[
            const SizedBox(height: 16),
            CustomFilledButton(
              onPressed: action,
              name: AppStrings.retry.tr,
            ),
          ],
        ],
      ),
    );
  }
}
