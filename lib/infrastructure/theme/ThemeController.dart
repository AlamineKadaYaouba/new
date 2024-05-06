import 'package:genesis/App/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  var currentTheme = AppThemes.lightTheme.obs;
  var isDark = false.obs;
  void changeTheme() {
    if (currentTheme.value == AppThemes.lightTheme) {
      currentTheme.value = AppThemes.darkTheme;
      Get.changeThemeMode(ThemeMode.dark);
      isDark.value = true;
    } else {
      currentTheme.value = AppThemes.lightTheme;
      Get.changeThemeMode(ThemeMode.light);
      isDark.value = false;
    }
  }
}
