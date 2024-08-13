import 'package:one_link_wallet/core/app_constants/app_colors.dart';
import 'package:one_link_wallet/core/app_constants/app_enums.dart';
import 'package:one_link_wallet/core/app_constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSnackbar {
  const AppSnackbar._();

  static void showSnackbar({
    SnackbarType type = SnackbarType.error,
    required String message,
  }) =>
      Get.showSnackbar(
        GetSnackBar(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          snackPosition: SnackPosition.TOP,
          snackStyle: SnackStyle.FLOATING,
          duration: const Duration(milliseconds: 2500),
          messageText: Text(
            message,
            style: AppStyles.textStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: AppColors.white,
              isOverFlow: false,
            ),
          ),
          backgroundColor: type == SnackbarType.error
              ? AppColors.error
              : type == SnackbarType.warning
                  ? AppColors.yellow
                  : AppColors.green,
          icon: Icon(
            type == SnackbarType.error
                ? Icons.error_rounded
                : type == SnackbarType.warning
                    ? Icons.warning_rounded
                    : type == SnackbarType.notification
                        ? Icons.notifications
                        : Icons.check_circle_rounded,
            color: AppColors.white,
          ),
        ),
      );
}
