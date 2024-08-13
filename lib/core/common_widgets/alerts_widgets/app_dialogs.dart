import 'package:one_link_wallet/core/app_constants/app_colors.dart';
import 'package:one_link_wallet/core/app_constants/app_icons.dart';
import 'package:one_link_wallet/core/app_constants/app_strings.dart';
import 'package:one_link_wallet/core/app_constants/app_styles.dart';
import 'package:one_link_wallet/core/common_widgets/custom_buttons.dart';
import 'package:one_link_wallet/core/common_widgets/custom_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.title,
    this.message,
    this.child,
    this.enableBack = true,
    this.action,
    this.actionName,
    this.insetPadding = 16,
  });

  final String title;
  final String? message;
  final Widget? child;
  final String? actionName;
  final void Function()? action;
  final bool enableBack;
  final double insetPadding;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding:
          EdgeInsets.symmetric(horizontal: insetPadding, vertical: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 6),
                Text(
                  title,
                  style: AppStyles.textStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: Get.back,
                  child: const CustomIconWidget(
                    AppIcons.close,
                    size: 12,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 32),
          if (message != null) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                message!,
                textAlign: TextAlign.center,
                style: AppStyles.textStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  isOverFlow: false,
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
          if (child != null)
            Flexible(child: SingleChildScrollView(child: child!)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                if (actionName != null) ...[
                  Expanded(
                    child: CustomFilledButton(
                      onPressed: action,
                      name: actionName ?? AppStrings.retry.tr,
                    ),
                  ),
                  if (enableBack) const SizedBox(width: 24),
                ],
                if (enableBack)
                  Expanded(
                    child: CustomTextButton(
                      name: AppStrings.back.tr,
                      onPressed: Get.back,
                      textColor: AppColors.black,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    super.key,
    required this.error,
  });

  final String error;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      insetPadding: 48,
      title: AppStrings.error.tr,
      message: error,
    );
  }
}

class ClosePaymentDialog<bool> extends StatelessWidget {
  const ClosePaymentDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: AppStrings.close.tr,
      message: AppStrings.closePaymentMessage.tr,
      actionName: AppStrings.close.tr,
      action: () => Get.back(result: true),
    );
  }
}
