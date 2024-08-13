import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_link_wallet/core/app_constants/app_colors.dart';
import 'package:one_link_wallet/core/app_constants/app_images.dart';
import 'package:one_link_wallet/core/app_constants/app_styles.dart';
import 'package:one_link_wallet/core/common_widgets/notification_icon_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.enableActions = true,
  });

  final String? title;
  final bool enableActions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 40,
      title: title == null
          ? Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 27,
                    backgroundColor: AppColors.blue,
                    backgroundImage: AssetImage(AppImages.avatar),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    children: [
                      Text(
                        'Khaled Nagy',
                        style: AppStyles.textStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.black),
                      ),
                      Text(
                        'Good Evening',
                        style: AppStyles.textStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const NotificationIconButton(
                    color: AppColors.black,
                  )
                ],
              ),
            )
          : Text(title ?? ''),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
