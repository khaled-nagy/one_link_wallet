import 'package:flutter/material.dart';
import 'package:one_link_wallet/core/app_constants/app_colors.dart';
import 'package:one_link_wallet/core/app_constants/app_styles.dart';

class FavoretsWidget extends StatelessWidget {
  const FavoretsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Favorets',
          style: AppStyles.textStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.black),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 70,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: index == 0
                  ? const CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColors.greyIcon,
                      child: Center(
                        child: Icon(Icons.add),
                      ),
                    )
                  : const CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColors.primary,
                      child: Center(
                        child: Icon(Icons.person),
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
