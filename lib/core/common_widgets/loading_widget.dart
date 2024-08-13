import 'package:one_link_wallet/core/app_constants/app_colors.dart';
import 'package:one_link_wallet/core/app_constants/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.size = 30});

  final double size;

  @override
  Widget build(BuildContext context) => Center(
        child: SpinKitFoldingCube(
          size: size,
          color: AppColors.primary,
        ),
      );
}

class LoadingHandler {
  const LoadingHandler._();

  static startLoading() {
    Get.closeAllSnackbars();
    Get.dialog(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: AppStyles.borderCircle()),
              child: const LoadingWidget()),
        ],
      ),
      barrierDismissible: false,
    );
  }

  static stopLoading() {
    Get.closeAllSnackbars();
    if (Get.isDialogOpen == true) {
      Get.back();
    }
  }
}
