import 'package:one_link_wallet/core/app_constants/app_colors.dart';
import 'package:one_link_wallet/core/app_constants/app_features.dart';
import 'package:one_link_wallet/core/app_constants/app_icons.dart';
import 'package:one_link_wallet/core/common_widgets/custom_icon_widget.dart';
import 'package:one_link_wallet/features/main_app/presentation/controller/main_app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationIconButton extends StatelessWidget {
  const NotificationIconButton({super.key, this.color = AppColors.black});

  final Color color;

  @override
  Widget build(BuildContext context) {
    if (!AppFeatures.enableNotifications) return const SizedBox();
    return IconButton(
      padding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
      onPressed: () {},
      icon: CustomIconWidget(
        AppIcons.notification,
        size: 25,
        color: color,
      ),
    );
  }
}
