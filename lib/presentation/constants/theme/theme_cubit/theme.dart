import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../app_text_styles.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.lightGreen,
      primary: AppColors.lightGreen,
      secondary: AppColors.black,
      background: AppColors.white,
      onBackground: AppColors.grey,
      onPrimary: AppColors.goldHighlight,
      onSurface: AppColors.darkRed),
  textTheme: TextTheme(
    displayLarge: AppTextStyles.text24Bold.copyWith(
      color: AppColors.black,
    ),
    displayMedium: AppTextStyles.text18Bold.copyWith(color: AppColors.black),
    displaySmall: AppTextStyles.text14Bold.copyWith(color: AppColors.black),
    bodyLarge: AppTextStyles.text12Bold.copyWith(
      color: AppColors.black,
    ),
    bodySmall: AppTextStyles.text12Semi.copyWith(color: AppColors.black),
    labelMedium: AppTextStyles.text10.copyWith(color: AppColors.black),
    labelSmall: AppTextStyles.text8Semi.copyWith(color: AppColors.black),
  ),
);
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  textTheme: TextTheme(
    displayLarge: AppTextStyles.text24Bold,
    displayMedium: AppTextStyles.text18Bold,
    displaySmall: AppTextStyles.text14Bold,
    bodyLarge: AppTextStyles.text12Bold,
    bodySmall: AppTextStyles.text12Semi,
    labelMedium: AppTextStyles.text10,
    labelSmall: AppTextStyles.text8Semi,
  ),
);
