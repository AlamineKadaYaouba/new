import 'package:genesis/App/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:genesis/infrastructure/theme/ThemeController.dart';
import 'package:get/get.dart';

// celle ci est utiliser pour les bouton circulaire, generalement utilisée pour les bouttons icones
class CircularBottom extends StatelessWidget {
  const CircularBottom({
    Key? key,
    this.color,
    this.onPressed,
    this.borderColor,
    this.height,
    this.width,
    this.border = false,
    this.elevation,
    required this.icon,
  }) : super(key: key);
  final Color? color;
  final VoidCallback? onPressed;
  final Color? borderColor;
  final double? height;
  final double? width;
  final bool border;
  final double? elevation;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    ThemeController themeContoller = Get.put(ThemeController());
    return Obx(
      () => themeContoller.currentTheme.value == AppThemes.lightTheme
          ? Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color ?? Colors.black.withOpacity(0.2),
              ),
              height: height ?? 50,
              width: width ?? 50,
              child: Center(
                child: IconButton(
                  onPressed: onPressed,
                  icon: icon,
                ),
              ),
            )
          : Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color ?? Colors.black.withOpacity(0.2),
              ),
              height: height ?? 50,
              width: width ?? 50,
              child: Center(
                child: IconButton(
                  onPressed: onPressed,
                  icon: icon,
                ),
              ),
            ),
    );
  }
}
