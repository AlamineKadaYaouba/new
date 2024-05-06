import 'package:flutter/material.dart';
import 'package:genesis/App/app_sizes.dart';
import 'package:genesis/infrastructure/theme/ThemeController.dart';

import 'package:get/get.dart';

import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';

void main() async {
  var initialRoute = await Routes.initialRoute;
  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;
  Main(this.initialRoute);

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.put(ThemeController());
    AppSizes.height = MediaQuery.of(context).size.height;
    AppSizes.width = MediaQuery.of(context).size.width;
    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Genesis',
        theme: themeController.currentTheme.value,
        initialRoute: initialRoute,
        getPages: Nav.routes,
      ),
    );
  }
}
