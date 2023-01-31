import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData appThemeData = ThemeData(
    fontFamily: 'Nunito',
    primaryColor: AppColors.primary,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.primary,
      secondary: AppColors.primary,
    ),
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.primary),
      backgroundColor: AppColors.white,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.primary,
      selectedIconTheme: IconThemeData(color: AppColors.primary),
      selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w400,
        color: AppColors.primary,
      ),
      unselectedItemColor: AppColors.gray,
      unselectedIconTheme: IconThemeData(color: AppColors.gray),
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w400,
        color: AppColors.gray,
      ),
    ),
  );
}
