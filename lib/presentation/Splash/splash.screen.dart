import 'package:genesis/App/app_images.dart';
import 'package:flutter/material.dart';
import 'package:genesis/App/app_sizes.dart';
import 'package:genesis/infrastructure/navigation/routes.dart';
import 'package:get/get.dart';

class SpashScreen extends StatefulWidget {
  const SpashScreen({super.key});

  @override
  State<SpashScreen> createState() => _SpashScreenState();
}

class _SpashScreenState extends State<SpashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..forward().whenComplete(() => Get.offAndToNamed(Routes.GET_STARTED));
  }

  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return controller != null
        ? Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.logo,
                    height: 130,
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: AppSizes.width > 400 ? 400 : AppSizes.height - 50,
                    child: AnimatedBuilder(
                      animation: controller!,
                      builder: (context, child) {
                        return LinearProgressIndicator(
                          borderRadius: BorderRadius.circular(20),
                          minHeight: 15,
                          value: controller!.value,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        : Container();
  }
}
