import 'dart:async';
import 'package:one_link_wallet/core/app_constants/app_enums.dart';
import 'package:one_link_wallet/core/app_datasources/local_datasource/shared_pref_helper/shared_pref_constants.dart';
import 'package:one_link_wallet/core/app_datasources/local_datasource/shared_pref_helper/shared_pref_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AppFunctions {
  const AppFunctions._();





  static Future<double> getImageInfo(
      ImageInfoType infoType, String imageUrl) async {
    final Completer<double> completer = Completer<double>();
    Image image = Image.network(imageUrl);
    final imageStream = image.image.resolve(const ImageConfiguration());
    imageStream.addListener(
      ImageStreamListener(
        (ImageInfo info, bool isSync) {
          if (infoType == ImageInfoType.width) {
            completer.complete(info.image.width.toDouble());
          }
          if (infoType == ImageInfoType.height) {
            completer.complete(info.image.height.toDouble());
          }
          completer.complete(info.image.width / info.image.height);
        },
      ),
    );
    return completer.future;
  }






  static String handlePhoneNumber(String phoneNumber) {
    if (phoneNumber.startsWith('+966')) {
      return phoneNumber;
    }
    if (phoneNumber.startsWith('0')) {
      return '+966${phoneNumber.replaceFirst('0', '')}';
    }
    return '+966$phoneNumber';
  }

  static bool isGuest() =>
      Get.find<SharedPrefHelper>()
          .get<String>(SharedPrefConstants.accessToken) ==
      null;




}
