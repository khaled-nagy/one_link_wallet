import 'package:flutter/material.dart';
import 'package:one_link_wallet/core/app_constants/app_colors.dart';
import 'package:one_link_wallet/core/app_constants/app_styles.dart';

class TransactionsWidget extends StatelessWidget {
  final int listCount;
  const TransactionsWidget({super.key, required this.listCount});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Transactions',
          style: AppStyles.textStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.black),
        ),
        const SizedBox(
          height: 8,
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: listCount,
            itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(4),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                r"$5,934",
                                style: AppStyles.textStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.black),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Send By",
                                    style: AppStyles.textStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.greyText),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    index == 1 ? "Apple pay" : "Cash App",
                                    style: AppStyles.textStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: index == 1
                                            ? AppColors.blue
                                            : AppColors.green),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: AppColors.lightGrey,
                                  child: Center(
                                    child: Icon(
                                      Icons.downloading_sharp,
                                      color: AppColors.greyText,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: AppColors.lightGrey,
                                  child: Center(
                                    child: Icon(Icons.article_outlined,
                                        color: AppColors.greyText),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Divider(
                        color: AppColors.greyIcon,
                      ),
                    ],
                  ),
                ))),
      ],
    );
  }
}
