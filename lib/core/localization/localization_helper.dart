import 'package:get/get_navigation/src/root/internacionalization.dart';

import 'ar.dart';
import 'en.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': englishLanguage,
        'ar': arabicLanguage,
      };
}
