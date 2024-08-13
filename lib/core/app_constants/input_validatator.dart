import 'package:one_link_wallet/core/app_constants/app_strings.dart';
import 'package:get/get.dart';

class InputValidator {
  const InputValidator._();

  static String? validateNotEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.requiredFiled.tr;
    }
    return null;
  }

  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.requiredFiled.tr;
    }
    if (!RegExp(r"^[a-zA-Zء-ي][a-zA-Zء-ي\d-_\.]+").hasMatch(value)) {
      return AppStrings.invalidName.tr;
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.requiredFiled.tr;
    }

    RegExp regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(value)) {
      return AppStrings.invalidEmail.tr;
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.requiredFiled.tr;
    }
    RegExp regExp = RegExp(r'^05[0-9]{8}$|^5[0-9]{8}$');
    if (!regExp.hasMatch(value)) {
      return AppStrings.invalidPhoneNumber.tr;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.requiredFiled.tr;
    }
    if (value.length < 8) {
      return AppStrings.invalidPassword.tr;
    }
    return null;
  }

  static String? validateConfirmPassword(
      String password, String confirmPassword) {
    if (password != confirmPassword) {
      return AppStrings.passwordMismatch.tr;
    }
    return null;
  }

  static String? validateNumber(String? value) {
    if (value == null ||
        value.isEmpty ||
        !RegExp(r'^[0-9]*$').hasMatch(value)) {
      return AppStrings.invalidNumber.tr;
    }
    return null;
  }
}
