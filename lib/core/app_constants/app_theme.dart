import 'package:one_link_wallet/core/app_constants/app_styles.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData lightTheme() => ThemeData(
      fontFamily: 'Cairo',
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
      ),
      dividerTheme: _dividerThemeData(),
      appBarTheme: _appBarTheme(),
      dialogTheme: _dialogTheme(),
      filledButtonTheme: _filledButtonThemeData(),
      outlinedButtonTheme: _outlinedButtonThemeData(),
      textButtonTheme: _textButtonThemeData(),
      inputDecorationTheme: _inputDecorationTheme(),
      checkboxTheme: _checkboxThemeData(),
      listTileTheme: _listTileThemeData(),
      datePickerTheme: _datePickerTheme(),
      timePickerTheme: _timePickerTheme(),
      tabBarTheme: _tabBarTheme(),
    );

TabBarTheme _tabBarTheme() => const TabBarTheme(dividerHeight: 0.0);

TimePickerThemeData _timePickerTheme() => TimePickerThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    );

DatePickerThemeData _datePickerTheme() => DatePickerThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      surfaceTintColor: AppColors.white,
    );

ListTileThemeData _listTileThemeData() => ListTileThemeData(
      titleTextStyle:
          AppStyles.textStyle(fontSize: 13, fontWeight: FontWeight.w600),
    );

CheckboxThemeData _checkboxThemeData() => const CheckboxThemeData(
      side: BorderSide(color: AppColors.darkGreyText),
    );

DividerThemeData _dividerThemeData() => const DividerThemeData(
      color: AppColors.border,
    );

InputDecorationTheme _inputDecorationTheme() => InputDecorationTheme(
      hintStyle: AppStyles.textStyle(color: AppColors.greyText),
      labelStyle: AppStyles.textStyle(color: AppColors.greyText),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      isCollapsed: true,
      disabledBorder: OutlineInputBorder(
        gapPadding: 0.0,
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(color: AppColors.primaryLight),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(color: AppColors.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(color: AppColors.error),
      ),
    );

AppBarTheme _appBarTheme() => AppBarTheme(
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.white,
      centerTitle: false,
      titleTextStyle: AppStyles.textStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: AppColors.white,
      ),
    );

DialogTheme _dialogTheme() => DialogTheme(
      backgroundColor: AppColors.white,
      surfaceTintColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: AppStyles.borderCircle(radius: 4),
      ),
    );

FilledButtonThemeData _filledButtonThemeData() => FilledButtonThemeData(
      style: FilledButton.styleFrom(
        disabledBackgroundColor: AppColors.greyText,
        textStyle: AppStyles.textStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AppStyles.borderCircle(radius: 6),
        ),
      ),
    );

OutlinedButtonThemeData _outlinedButtonThemeData() => OutlinedButtonThemeData(
      style: FilledButton.styleFrom(
        foregroundColor: AppColors.onboardingText,
        side: const BorderSide(color: AppColors.primary),
        textStyle: AppStyles.textStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AppStyles.borderCircle(radius: 6),
        ),
      ),
    );

TextButtonThemeData _textButtonThemeData() => TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: AppStyles.textStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
    );
