import 'package:one_link_wallet/core/app_constants/app_colors.dart';
import 'package:one_link_wallet/core/app_constants/app_strings.dart';
import 'package:one_link_wallet/core/app_constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomStringMessage extends StatelessWidget {
  const CustomStringMessage({
    super.key,
    required this.action,
    required this.message,
    this.actionName,
    this.centerText = true,
  });
  final void Function() action;
  final String message;
  final String? actionName;
  final bool centerText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: Text.rich(
        textAlign: centerText ? TextAlign.center : null,
        TextSpan(
          children: [
            TextSpan(text: '$message '),
            TextSpan(
              text: actionName ?? AppStrings.retry.tr,
              style:
                  AppStyles.textStyle(color: AppColors.primary, fontSize: 12),
            ),
          ],
        ),
        style: AppStyles.textStyle(
            fontSize: 12, fontWeight: FontWeight.w600, isOverFlow: false),
      ),
    );
  }
}
