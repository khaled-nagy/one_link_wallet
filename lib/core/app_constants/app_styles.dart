import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppStyles {
  const AppStyles._();
  static TextStyle textStyle({
    double fontSize = 16,
    Color? color,
    double? height,
    String? fontFamily,
    TextDecoration? decoration,
    Color? decorationColor,
    FontWeight? fontWeight = FontWeight.w400,
    bool isOverFlow = true,
  }) =>
      TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? AppColors.black,
        height: height,
        overflow: isOverFlow ? TextOverflow.ellipsis : TextOverflow.visible,
        decorationColor: decorationColor ?? color,
        fontFamily: "Cairo",
        decoration: decoration,
      );

  static BorderRadius borderCircle({double radius = 16}) =>
      BorderRadius.circular(radius);

  static BorderRadius borderTopCircle({double radius = 8}) =>
      BorderRadius.vertical(top: Radius.circular(radius));

  static BorderRadiusGeometry borderStartCircle({double radius = 8}) =>
      BorderRadiusDirectional.horizontal(start: Radius.circular(radius));

  static BorderRadiusGeometry borderEndCircle({double radius = 8}) =>
      BorderRadiusDirectional.horizontal(end: Radius.circular(radius));

  static BorderRadius borderBottomCircle({double radius = 8}) =>
      BorderRadius.vertical(bottom: Radius.circular(radius));

  static BorderSide borderSide({double? radius = 8, Color? color}) =>
      BorderSide(
        color: color ?? AppColors.border,
        width: 1,
      );

  static BoxBorder borderAll(
          {double? radius = 8, Color? color, double? width = 1}) =>
      Border.all(
        color: color ?? AppColors.border,
        width: width!,
      );

  static InputBorder inputBorder({double radius = 8, Color? color}) {
    return OutlineInputBorder(
      borderRadius: borderCircle(radius: radius),
      borderSide: borderSide(
        color: color ?? AppColors.border,
        radius: radius,
      ),
    );
  }
}
