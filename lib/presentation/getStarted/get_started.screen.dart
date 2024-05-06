import 'package:flutter/material.dart';
import 'package:genesis/App/app_colors.dart';
import 'package:genesis/App/app_images.dart';
import 'package:genesis/App/app_sizes.dart';
import 'package:genesis/Widgets/button.dart';
import 'package:genesis/infrastructure/navigation/routes.dart';

import 'package:get/get.dart';

import 'controllers/get_started.controller.dart';

class GetStartedScreen extends GetView<GetStartedController> {
  const GetStartedScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print("largeur : ${AppSizes.width}");
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: AppSizes.height,
          width: AppSizes.width > 400 ? 400 : AppSizes.width - 30,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Center(
                  child: Container(
                    height: AppSizes.height - 50,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppImages.getStarted),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: AppSizes.width > 400 ? 400 : AppSizes.width - 30,
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Bienvenue sur Génésis',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Rejoignez-nous pour profiter de nos services',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: FButton(
                    width: AppSizes.width > 400 ? 400 : AppSizes.width - 30,
                    text: "Commencer",
                    textColor: AppColors.white,
                    color: AppColors.primary,
                    onPressed: () => Get.toNamed(Routes.LOGIN),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
