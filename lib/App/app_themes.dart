import 'package:genesis/App/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    listTileTheme: const ListTileThemeData(
      textColor: Colors.black,
      iconColor: Colors.black,
    ),
    shadowColor: AppColors.grey,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      // backgroundColor: AppColors.background,
      selectedItemColor: AppColors.primary,
      elevation: 5,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: AppColors.black,
      unselectedLabelStyle: TextStyle(
        color: AppColors.black,
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.primary,
      linearTrackColor: AppColors.secondary,
    ),
    fontFamily: 'circularStd',
    primaryColor: AppColors.primary,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: AppColors.white,
      ),
      // backgroundColor: AppColors.primary,
      elevation: 5,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
        color: AppColors.white,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
      ),
      hintStyle: TextStyle(
        fontSize: 14,
        color: AppColors.black,
      ),
      labelStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      errorStyle: TextStyle(
        fontSize: 12,
        color: AppColors.red,
      ),
      helperStyle: TextStyle(
        fontSize: 14,
      ),
    ),
    scaffoldBackgroundColor: AppColors.background,
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primary,
    ),
    textTheme: const TextTheme(
      bodySmall: TextStyle(
          color: AppColors.textBlack,
          fontSize: 12,
          fontWeight: FontWeight.normal),
      bodyMedium: TextStyle(
          color: AppColors.textBlack,
          fontSize: 14,
          fontWeight: FontWeight.normal),
      bodyLarge: TextStyle(
        color: AppColors.textBlack,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
      titleMedium: TextStyle(
        color: AppColors.textBlack,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
      titleLarge: TextStyle(
        color: AppColors.textBlack,
        fontWeight: FontWeight.w700,
        fontSize: 22,
      ),
    ),
  );

  static InputBorder get _defaultBorder => OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: AppColors.textBlack,
      ));

  static ThemeData darkTheme = ThemeData(
    useMaterial3: false,
    drawerTheme:
        const DrawerThemeData(backgroundColor: AppColors.backgroundDark),
    cardTheme: const CardTheme(
      elevation: 4,
      color: AppColors.backgroundDark,
    ),
    listTileTheme: const ListTileThemeData(
      textColor: Colors.white,
      iconColor: Colors.white,
    ),
    shadowColor: AppColors.background,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.backgroundDark,
      selectedItemColor: AppColors.white,
      elevation: 20,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: AppColors.darkButtom,
      unselectedLabelStyle: TextStyle(
        color: AppColors.darkButtom,
      ),
    ),
    fontFamily: 'circularStd',
    primaryColor: AppColors.primary,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: AppColors.white,
      ),
      backgroundColor: AppColors.backgroundDark,
      elevation: 5,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
        color: AppColors.white,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.background,
      border: _defaultBorder,
      enabledBorder: _defaultBorder,
      focusedBorder: _defaultBorder.copyWith(
        borderSide: const BorderSide(
          color: AppColors.primary,
          width: 2,
        ),
      ),
      errorBorder: _defaultBorder.copyWith(
        borderSide: const BorderSide(
          color: AppColors.error,
        ),
      ),
      focusedErrorBorder: _defaultBorder.copyWith(
        borderSide: const BorderSide(
          color: AppColors.error,
        ),
      ),
      isDense: false,
      hintStyle: const TextStyle(
        fontSize: 16,
        color: AppColors.black,
      ),
      labelStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      errorStyle: const TextStyle(
        fontSize: 12,
        color: AppColors.red,
      ),
      helperStyle: const TextStyle(
        fontSize: 14,
      ),
    ),
    scaffoldBackgroundColor: AppColors.backgroundDark,
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.darkButtom,
    ),
    colorScheme: ThemeData().colorScheme.copyWith(
          primary: AppColors.primary,
        ),
    textTheme: const TextTheme(
      bodySmall: TextStyle(
          color: AppColors.textWhite,
          fontSize: 12,
          fontWeight: FontWeight.normal),
      bodyMedium: TextStyle(
          color: AppColors.textWhite,
          fontSize: 14,
          fontWeight: FontWeight.normal),
      bodyLarge: TextStyle(
        color: AppColors.textWhite,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
      titleMedium: TextStyle(
        color: AppColors.textWhite,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
      titleLarge: TextStyle(
        color: AppColors.textWhite,
        fontWeight: FontWeight.w700,
        fontSize: 22,
      ),
    ),
  );
}
