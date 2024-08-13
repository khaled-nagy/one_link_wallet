import 'package:one_link_wallet/core/app_constants/app_colors.dart';
import 'package:one_link_wallet/core/app_constants/app_icons.dart';
import 'package:one_link_wallet/core/app_constants/app_strings.dart';
import 'package:one_link_wallet/core/common_widgets/alerts_widgets/custom_string_message.dart';
import 'package:one_link_wallet/core/common_widgets/custom_app_bar.dart';
import 'package:one_link_wallet/core/common_widgets/custom_icon_widget.dart';
import 'package:one_link_wallet/core/exceptions/exception_handler.dart';
import 'package:one_link_wallet/features/cards/presentation/controller/cards_controller.dart';
import 'package:one_link_wallet/features/settings/presentation/controllers/settings_controller.dart';
import 'package:one_link_wallet/features/main_app/presentation/controller/main_app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainAppPage extends StatefulWidget {
  const MainAppPage({super.key, this.initialIndex = 0});

  final int initialIndex;

  @override
  State<MainAppPage> createState() => _MainAppPageState();
}

class _MainAppPageState extends State<MainAppPage> {
  @override
  void initState() {
    Get.find<MainAppController>().setInitIndex(widget.initialIndex);
    // Get.find<FcmNotificationHelper>().handleInitialMessage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainAppController>(
      builder: (mainAppController) => PopScope(
        canPop: false,
        onPopInvoked: (didPop) async {
          Get.back(id: mainAppController.bottomNavIndex);
        },
        child: Scaffold(
          appBar: const CustomAppBar(
            enableActions: true,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          body:
              mainAppController.mainPagesList[mainAppController.bottomNavIndex],
          bottomNavigationBar: BottomNavigationBar(
            unselectedFontSize: 0.0,
            selectedFontSize: 0.0,
            type: BottomNavigationBarType.fixed,
            currentIndex: mainAppController.bottomNavIndex,
            onTap: (index) => mainAppController.changeBottomNavIndex(index),
            items: const [
              BottomNavigationBarItem(
                label: '',
                activeIcon: CustomIconWidget(
                  AppIcons.home,
                  color: AppColors.primary,
                  size: 25,
                ),
                icon: CustomIconWidget(AppIcons.home,
                    color: AppColors.greyIcon, size: 25),
              ),
              BottomNavigationBarItem(
                label: '',
                activeIcon: CustomIconWidget(AppIcons.transactions,
                    color: AppColors.primary, size: 25),
                icon: CustomIconWidget(AppIcons.transactions,
                    color: AppColors.greyIcon, size: 25),
              ),
              BottomNavigationBarItem(
                label: '',
                activeIcon: CustomIconWidget(AppIcons.cards,
                    color: AppColors.primary, size: 25),
                icon: CustomIconWidget(AppIcons.cards,
                    color: AppColors.greyIcon, size: 25),
              ),
              BottomNavigationBarItem(
                label: '',
                activeIcon: CustomIconWidget(
                  AppIcons.settings,
                  color: AppColors.primary,
                  size: 25,
                ),
                icon: CustomIconWidget(AppIcons.settings,
                    color: AppColors.greyIcon, size: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
