import 'package:flutter/foundation.dart';

class AppEnvironment {
  const AppEnvironment._();

  static String get envName => kReleaseMode ? '.env.prod' : '.env.dev';

  static String baseUrl = 'BASE_URL';


}
