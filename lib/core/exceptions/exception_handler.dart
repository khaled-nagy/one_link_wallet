import 'package:one_link_wallet/core/app_constants/app_strings.dart';
import 'package:one_link_wallet/core/app_datasources/local_datasource/shared_pref_helper/shared_pref_constants.dart';
import 'package:one_link_wallet/core/app_datasources/local_datasource/shared_pref_helper/shared_pref_helper.dart';
import 'package:one_link_wallet/core/common_widgets/alerts_widgets/app_snackbar.dart';
import 'package:one_link_wallet/features/cards/presentation/controller/cards_controller.dart';
import 'package:one_link_wallet/features/splash/presentation/pages/splash_page.dart';
import 'package:get/get.dart';

import 'app_exceptions.dart';

String exceptionHandler(Exception exception,
    {bool disableAuthExceptionHandle = false}) {
  if (exception is NetworkException) {
    return AppStrings.networkException.tr;
  } else if (exception is ExceptionWithMessage) {
    return _handleExceptionWithMessage(exception.message);
  } else if (exception is InternalServerException) {
    return AppStrings.internalServerException.tr;
  } else if (exception is TimeoutException) {
    return AppStrings.timeoutException.tr;
  } else if (exception is UnknownException) {
    return AppStrings.unknownException.tr;
  } else if (exception is PaymentException) {
    return AppStrings.paymentException.tr;
  } else if (exception is ParsingException) {
    return AppStrings.parsingException.tr;
  } else if (exception is FormatException) {
    return AppStrings.parsingException.tr;
  } else if (exception is ForbiddenException) {
    if (!disableAuthExceptionHandle) {
      _signOut();
    }
    return _handleExceptionWithMessage(
        exception.error ?? AppStrings.unauthorizedException.tr);
  } else if (exception is AuthException) {
    if (exception.error == 'Unauthorized Handshake' ||
        exception.error == 'Unauthorized') {
      _reloadApp();
    } else {
      if (!disableAuthExceptionHandle) {
        _signOut();
      }
      return _handleExceptionWithMessage(
          exception.error ?? AppStrings.unauthorizedException.tr);
    }
  } else if (exception is LocalDatabaseException) {
    return AppStrings.localDatabaseException.tr;
  } else if (exception is NotFoundException) {
    return AppStrings.notFoundException.tr;
  } else if (exception is InvalidCartException) {
    _handleInvalidCart();
  }

  return AppStrings.unknownException.tr;
}

_handleInvalidCart() async {
  await Get.find<SharedPrefHelper>().remove(SharedPrefConstants.cartId);
  Get.until((route) => route.isFirst);
  AppSnackbar.showSnackbar(message: AppStrings.invalidCartError.tr);
}

void _reloadApp() async {
  Get.reloadAll(force: true);
  Future.delayed(const Duration(milliseconds: 10)).then((value) {
    Get.offAll(() => const SplashPage());
    AppSnackbar.showSnackbar(message: AppStrings.sessionEnded.tr);
  });
}

_signOut() async {
  AppSnackbar.showSnackbar(message: AppStrings.sessionEnded.tr);
}

String _handleExceptionWithMessage(String message) {
  print('+++++++++++++++++ $message');
  final lang = Get.locale?.languageCode;
  if (message.contains('Product that you are') ||
      message.contains('qty exceeds') ||
      message.contains('qty is not available')) {
    return lang == 'ar'
        ? 'الكمية المطلوبة غير متاحة'
        : 'The requested amount is not available';
  }
  if (message.contains('The account sign-in was incorrect')) {
    return lang == 'ar'
        ? 'البريد أو كلمة المرور غير صحيح برجاء المحاوله مره أخرى'
        : 'Email or password is incorrect. Please try again';
  }
  if (message
      .contains('There is already an account registered with this email')) {
    return lang == 'ar'
        ? 'البريد الالكتروني الذي أدخلته مسجل مسبقا, برجاء تسجيل الدخول'
        : 'This email already registered, please login';
  }
  if (message.contains('This mobile number is already registered')) {
    return lang == 'ar'
        ? 'رقم الهاتف الذي أدخلته مسجل مسبقا, برجاء تسجيل الدخول'
        : 'This mobile number already registered, please login';
  }
  if (message.contains('No such entity')) {
    return lang == 'ar'
        ? 'البريد الالكتروني الذي أدخلته غير موجود'
        : 'This email not found';
  }
  if (message.contains('Cannot change the same email')) {
    return lang == 'ar'
        ? 'برجاء ادخال بريد مختلف عن البريد الحالي'
        : 'Please enter email different from current email';
  }
  if (message.contains("customer isn't authorized")) {
    return lang == 'ar'
        ? 'غير مصرح لك استخدام هذا المصدر'
        : 'You are not authorized to use this source';
  }
  if (message.contains("The coupon code isn't valid")) {
    return lang == 'ar'
        ? 'الكوبون الذي أدخلته غير صالح, برجاء التأكد من صحة الكوبون'
        : 'The coupon code is not valid, please check the coupon';
  }
  if (message.contains("required option(s) weren't entered")) {
    return lang == 'ar'
        ? 'هذا المنتج يحتوي على خيارات مطلوبة للتحديد، برجاء تحديد الخيارات المطلوبة'
        : 'This product require option(s) to be selected, please select';
  }

  if (message.contains("The password doesn't match this account")) {
    return lang == 'ar'
        ? "كلمة المرور القديمة التي أدخلتها غير صحيحة، يرجى كتابة كلمة المرور الصحيحة والمحاولة مرة أخرى."
        : 'The Old Password you entered is not correct, please write the correct password and try again';
  }
  if (message.contains("This mobile number is not registered")) {
    return lang == 'ar'
        ? 'رقم الهاتف الذي أدخلته غير مسجل، يرجى التحقق من الرقم المدخل.'
        : 'This mobile number is not registered, please check entered number';
  }
  if (message.contains("Invalid OTP")) {
    return lang == 'ar' ? 'رقم تحقق غير صحيح.' : 'Invalid OTP';
  }
  return message;
}
