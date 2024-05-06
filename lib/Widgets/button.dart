import 'package:genesis/App/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:genesis/infrastructure/theme/ThemeController.dart';
import 'package:get/get.dart';

import '../App/app_colors.dart';

class FButton extends StatelessWidget {
  const FButton({
    Key? key,
    this.child,
    this.color,
    this.text,
    this.onPressed,
    this.style,
    this.textColor,
    this.borderColor,
    this.height,
    this.width,
    this.border = false,
    this.elevation,
    this.radius,
    this.stretch = false,
    this.textSize,
    this.icon,
    this.loading = false,
  }) : super(key: key);
  final Color? color;
  final String? text;
  final Widget? child;
  final VoidCallback? onPressed;
  final TextStyle? style;
  final Color? textColor;
  final Color? borderColor;
  final double? height;
  final double? width;
  final bool border;
  final double? elevation;
  final double? radius;
  final double? textSize;
  final bool stretch;
  final Widget? icon;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    ThemeController themeContoller = Get.put(ThemeController());
    return Obx(
      () => themeContoller.currentTheme.value == AppThemes.lightTheme
          ? SizedBox(
              height: height ?? 50,
              width: stretch ? Get.width : width,
              child: MaterialButton(
                animationDuration: const Duration(milliseconds: 500),
                disabledColor: AppColors.grey,
                color: color ?? AppColors.primary,
                elevation: elevation ?? 5,
                highlightElevation: color == Colors.transparent ? 0 : null,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius ?? 10),
                  side: border
                      ? BorderSide(
                          color: borderColor ?? AppColors.grey,
                        )
                      : BorderSide.none,
                ),
                onPressed: onPressed,
                child: _bodyButton(),
              ),
            )
          : SizedBox(
              height: height ?? 50,
              width: stretch ? Get.width : width,
              child: MaterialButton(
                animationDuration: const Duration(milliseconds: 500),
                disabledColor: AppColors.grey,
                color: color ?? AppColors.darkButtom,
                elevation: elevation ?? 5,
                highlightElevation: color == Colors.transparent ? 0 : null,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius ?? 10),
                  side: border
                      ? BorderSide(
                          color: borderColor ?? AppColors.grey,
                        )
                      : BorderSide.none,
                ),
                onPressed: onPressed,
                child: _bodyButton(),
              ),
            ),
    );
  }

  DefaultTextStyle _bodyButton() {
    return DefaultTextStyle(
      style: style ??
          Get.textTheme.bodyMedium!.copyWith(
              color: onPressed == null
                  ? Colors.white
                  : (textColor ?? Colors.white),
              fontSize: textSize),
      child: child ??
          (icon != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      icon!,
                      const SizedBox(
                        width: 18,
                      ),
                      Expanded(
                          child: Text(
                        text ?? '',
                        textAlign: TextAlign.center,
                      ))
                    ],
                  ),
                )
              : Text(text ?? '')),
    );
  }
}

class HCircleButton extends StatelessWidget {
  const HCircleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
