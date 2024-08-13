import 'package:one_link_wallet/core/app_constants/app_colors.dart';
import 'package:one_link_wallet/core/app_constants/app_styles.dart';
import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    super.key,
    this.onPressed,
    this.name,
    this.width,
    this.height,
    this.color,
    this.radius,
    this.icon,
    this.textColor = AppColors.white,
    this.withZeroPadding = false,
    this.fontSize = 12,
  });

  final void Function()? onPressed;
  final String? name;
  final double? width;
  final double? height;
  final Color? color;
  final double? radius;
  final Widget? icon;
  final Color textColor;
  final bool withZeroPadding;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: FilledButton(
        style: FilledButton.styleFrom(
          padding: withZeroPadding ? EdgeInsets.zero : null,
          backgroundColor: color,
          shape: radius == null
              ? null
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius!),
                ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) icon!,
            if (icon != null && name != null) const SizedBox(width: 8),
            if (name != null)
              Text(
                name!,
                style: AppStyles.textStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w700,
                  color: textColor,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    this.onPressed,
    this.name,
    this.width,
    this.height,
    this.radius,
    this.icon,
    this.borderColor = AppColors.primary,
    this.textColor = AppColors.onboardingText,
    this.withZeroPadding = false,
    this.fontSize = 12,
  });

  final void Function()? onPressed;
  final String? name;
  final double? width;
  final double? height;
  final Color borderColor;
  final double? radius;
  final Widget? icon;
  final Color textColor;
  final bool withZeroPadding;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: withZeroPadding ? EdgeInsets.zero : null,
          side: BorderSide(color: borderColor),
          shape: radius == null
              ? null
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius!),
                ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) icon!,
            if (icon != null && name != null) const SizedBox(width: 8),
            if (name != null)
              Text(
                name!,
                style: AppStyles.textStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w700,
                  color: textColor,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    this.onPressed,
    this.name,
    this.icon,
    this.textColor = AppColors.primary,
    this.withZeroPadding = false,
    this.fontWeight = FontWeight.w700,
    this.fontSize = 12,
  });

  final void Function()? onPressed;
  final String? name;

  final Widget? icon;
  final Color textColor;
  final bool withZeroPadding;
  final FontWeight fontWeight;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: withZeroPadding ? EdgeInsets.zero : null,
        visualDensity: withZeroPadding ? VisualDensity.compact : null,
        minimumSize: withZeroPadding ? Size.zero : null,
        tapTargetSize:
            withZeroPadding ? MaterialTapTargetSize.shrinkWrap : null,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) icon!,
          if (icon != null && name != null) const SizedBox(width: 8),
          if (name != null)
            Text(
              name!,
              style: AppStyles.textStyle(
                fontSize: fontSize,
                fontWeight: fontWeight,
                color: textColor,
              ),
            ),
        ],
      ),
    );
  }
}
