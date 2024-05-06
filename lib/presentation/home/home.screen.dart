import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:genesis/App/app_sizes.dart';
import 'package:genesis/infrastructure/theme/ThemeController.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: AppSizes.width - 20,
            child: Column(
              children: [
                const SizedBox(height: 10),
                Obx(
                  () => CalendarDatePicker2(
                    config: CalendarDatePicker2Config(
                      dayTextStyle: TextStyle(
                        color: ThemeController().isDark.value
                            ? Colors.white
                            : Colors.black,
                      ),
                      selectedDayHighlightColor: Colors.red,
                    ),
                    value: [
                      DateTime(2024, 4, 16),
                    ],
                  ),
                ),
                Card(
                  elevation: 1,
                  child: SizedBox(
                    height: 50,
                    width: AppSizes.width - 30,
                    child: const Center(
                      child: Text('Heure d\'arriver : 08h06'),
                    ),
                  ),
                ),
                Card(
                  elevation: 1,
                  child: SizedBox(
                    height: 50,
                    width: AppSizes.width - 30,
                    child: const Center(
                      child: Text('Début de pause : 12h42'),
                    ),
                  ),
                ),
                Card(
                  elevation: 1,
                  child: SizedBox(
                    height: 50,
                    width: AppSizes.width - 30,
                    child: const Center(
                      child: Text('Fin de pause : 13h28'),
                    ),
                  ),
                ),
                Card(
                  elevation: 1,
                  child: SizedBox(
                    height: 50,
                    width: AppSizes.width - 30,
                    child: const Center(
                      child: Text('Heure de départ : 18h12'),
                    ),
                  ),
                ),
                // QrImageView(
                //   data: "Nous somme ici chez SygalinSAS",
                //   version: QrVersions.auto,
                //   size: 200,
                // )
                Container(
                  child: SfSignaturePad(
                    minimumStrokeWidth: 1,
                    maximumStrokeWidth: 3,
                    strokeColor: Colors.blue,
                    backgroundColor: Colors.white,
                  ),
                  height: 200,
                  width: 300,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.qr_code_2,
          size: 28,
        ),
        onPressed: () => homeController.scanQr(),
      ),
    );
  }
}
