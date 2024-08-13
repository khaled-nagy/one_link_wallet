
import 'package:one_link_wallet/core/app_datasources/local_datasource/shared_pref_helper/shared_pref_helper.dart';
import 'package:one_link_wallet/core/app_datasources/remote_datasource/network_layer.dart';
import 'package:one_link_wallet/features/cards/presentation/controller/cards_controller.dart';
import 'package:one_link_wallet/features/transactions/presentation/controllers/transactions_controller.dart';
import 'package:one_link_wallet/features/settings/presentation/controllers/settings_controller.dart';
import 'package:one_link_wallet/features/splash/presentation/controller/splash_controller.dart';
import 'package:one_link_wallet/features/main_app/presentation/controller/main_app_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/home/presentation/controllers/home_controller.dart';

class MainBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    _injectControllers();
    _injectUseCases();
    _injectRepositories();
    _injectDataSources();
    _injectCore();
    await _injectThirdParty();
  }
}

// here inject all app Controllers
void _injectControllers() {
  Get.lazyPut<MainAppController>(() => MainAppController(), fenix: true);

  Get.lazyPut<HomeController>(
    () => HomeController(),
    fenix: true,
  );

  Get.lazyPut<TransactionsController>(
    () => TransactionsController(),
    fenix: true,
  );

  Get.lazyPut<CardsController>(() => CardsController(), fenix: true);

  Get.lazyPut<SplashController>(() => SplashController(), fenix: true);

  Get.lazyPut<SettingsController>(() => SettingsController(), fenix: true);
}

// here inject all app UseCases
void _injectUseCases() {}
// here inject all app Repositories
void _injectRepositories() {}
// here inject all app DataSources
void _injectDataSources() {}
// here inject all app Core
void _injectCore() {
  Get.lazyPut<SharedPrefHelper>(() => SharedPrefHelperImpl(Get.find()),
      fenix: true);
  Get.lazyPut<MyClient>(() => MyClientImpl(), fenix: true);
}

// here inject all app ThirdParty
Future _injectThirdParty() async {
  final sharedPref = await SharedPreferences.getInstance();
  Get.lazyPut<SharedPreferences>(() => sharedPref, fenix: true);

}
