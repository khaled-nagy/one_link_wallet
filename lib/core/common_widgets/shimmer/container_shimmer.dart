import 'package:one_link_wallet/core/app_constants/app_colors.dart';
import 'package:one_link_wallet/core/app_constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerShimmer extends StatelessWidget {
  const ContainerShimmer(
      {super.key, this.height, this.width, this.radius = 0, this.margin = 0});
  final double? height;
  final double? width;
  final double radius;
  final double margin;

  @override
  Widget build(BuildContext context) {
    final maxH = Get.width;
    return Container(
      height: height ?? maxH * .12,
      width: width,
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
        borderRadius: AppStyles.borderCircle(radius: radius),
        color: AppColors.lightGrey,
      ),
    );
  }
}
