import 'package:flutter/material.dart';
import 'package:one_link_wallet/core/app_constants/app_colors.dart';
import 'package:one_link_wallet/core/app_constants/app_styles.dart';

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          r'$76,862.04',
          style: AppStyles.textStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.black),
        ),
        const SizedBox(
          width: 50,
        ),
        Icon(
          Icons.keyboard_arrow_up,
          size: 20,
          color: AppColors.green,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          r'2.5 %',
          style: AppStyles.textStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.green),
        ),
      ],
    );
  }
}
