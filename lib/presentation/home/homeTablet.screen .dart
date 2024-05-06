import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:genesis/App/app_sizes.dart';
import 'package:genesis/infrastructure/theme/ThemeController.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:get/get.dart';

import 'controllers/home.controller.dart';

class HomeTabletScreen extends GetView<HomeController> {
  const HomeTabletScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            height: height,
            width: width - 20,
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  child: Row(
                    children: [
                      Expanded(
                        child: Card(
                          child: Obx(
                            () => CalendarDatePicker2(
                              config: CalendarDatePicker2Config(
                                dayTextStyle: TextStyle(
                                  color: ThemeController().isDark.value
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                selectedDayHighlightColor: Colors.blue,
                              ),
                              value: [
                                DateTime(2024, 4, 16),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          child: Container(
                            child: PieChart(
                              PieChartData(
                                sections: [
                                  PieChartSectionData(
                                    color: Colors.green,
                                    value: 40,
                                    title: "à l'heure \n 40%",
                                    radius: 100,
                                    titleStyle: const TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  PieChartSectionData(
                                    color: Colors.blue,
                                    value: 30,
                                    title: 'en retard \n 30%',
                                    radius: 100,
                                    titleStyle: const TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  PieChartSectionData(
                                    color: Colors.red,
                                    value: 30,
                                    title: 'absent \n 30%',
                                    radius: 100,
                                    titleStyle: const TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Card(
                              elevation: 1,
                              child: SizedBox(
                                height: 40,
                                width: width - 30,
                                child: const Center(
                                  child: Text('Heure d\'arriver : 08h06'),
                                ),
                              ),
                            ),
                            Card(
                              elevation: 1,
                              child: SizedBox(
                                height: 40,
                                width: width - 30,
                                child: const Center(
                                  child: Text('Début de pause : 12h42'),
                                ),
                              ),
                            ),
                            Card(
                              elevation: 1,
                              child: SizedBox(
                                height: 40,
                                width: width - 30,
                                child: const Center(
                                  child: Text('Fin de pause : 13h28'),
                                ),
                              ),
                            ),
                            Card(
                              elevation: 1,
                              child: SizedBox(
                                height: 40,
                                width: width - 30,
                                child: const Center(
                                  child: Text('Heure de départ : 18h12'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                // QrImageView(
                //   data: "Nous somme ici chez SygalinSAS",
                //   version: QrVersions.auto,
                //   size: 200,
                // )
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
