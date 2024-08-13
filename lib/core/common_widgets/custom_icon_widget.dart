import 'package:one_link_wallet/core/app_constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomIconWidget extends StatelessWidget {
  const CustomIconWidget(
    this.iconPath, {
    super.key,
    this.size = 18,
    this.color = AppColors.black,
  });

  final String iconPath;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      iconPath,
      width: size,
      height: size,
      color: color,
    );
  }
}
