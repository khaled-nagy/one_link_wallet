import 'package:one_link_wallet/core/app_constants/app_theme.dart';
import 'package:one_link_wallet/core/localization/localization_helper.dart';
import 'package:one_link_wallet/features/splash/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    MainBinding().dependencies(),
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          GetMaterialApp(
            localizationsDelegates: const [],
            supportedLocales: const [
              Locale('en'),
              Locale('ar'),
            ],
            debugShowCheckedModeBanner: false,
            translations: Languages(),
            locale: const Locale('en'),
            theme: lightTheme(),
            home: const SplashPage(),
          ),
          // if (kDebugMode || true) const TalkerFab(),
        ],
      ),
    );
  }
}
