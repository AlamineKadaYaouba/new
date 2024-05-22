import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:genesis/App/app_sizes.dart';

import 'package:get/get.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    double height = Get.height;
    double width = Get.width;
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: Get.width - 10,
          height: Get.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "  Statistique du mois en cours",
                    style: TextStyle(
                      fontSize: AppSizes.title4,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  children: [
                    Card(
                      child: Container(
                        height: 240,
                        width: width <= AppSizes.tablet1
                            ? 380
                            : width >= AppSizes.tablet1 &&
                                    width <= AppSizes.tablet2
                                ? (width - 30) / 2
                                : (width - 30) / 3,
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        child: PieChart(
                          PieChartData(
                            sections: [
                              PieChartSectionData(
                                color: Colors.green,
                                value: 40,
                                title: "Présence \n 40%",
                                radius: 100,
                                titleStyle: const TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              PieChartSectionData(
                                color: Colors.blue,
                                value: 30,
                                title: 'retard \n 30%',
                                radius: 100,
                                titleStyle: const TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              PieChartSectionData(
                                color: Colors.red,
                                value: 30,
                                title: 'absences \n 30%',
                                radius: 100,
                                titleStyle: const TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Obx(
                    //   () =>
                    Card(
                      child: SizedBox(
                        width: width <= AppSizes.tablet1
                            ? 380
                            : width >= AppSizes.tablet1 &&
                                    width <= AppSizes.tablet2
                                ? (width - 30) / 2
                                : (width - 30) / 3,
                        height: 260,
                        child: CalendarDatePicker2(
                          config: CalendarDatePicker2Config(
                            currentDate: DateTime.now(),
                            calendarType: CalendarDatePicker2Type.multi,
                          ),
                          value: homeController.selectedDate,
                        ),
                      ),
                    ),
                  ],
                ),
                // ),
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "  Différents états de la journée",
                    style: TextStyle(
                      fontSize: AppSizes.title4,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const Wrap(
                  children: [
                    Card(
                      elevation: 1,
                      child: SizedBox(
                        height: 50,
                        width: 160,
                        child: Center(
                          child: Text('Arriver : 08h06'),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 1,
                      child: SizedBox(
                        height: 50,
                        width: 160,
                        child: Center(
                          child: Text('Pause : 12h42'),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 1,
                      child: SizedBox(
                        height: 50,
                        width: 160,
                        child: Center(
                          child: Text('Fin de pause : 13h28'),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 1,
                      child: SizedBox(
                        height: 50,
                        width: 160,
                        child: Center(
                          child: Text('Départ : 18h12'),
                        ),
                      ),
                    ),
                  ],
                ),
                // Container(
                //   child: SfSignaturePad(
                //     minimumStrokeWidth: 1,
                //     maximumStrokeWidth: 3,
                //     strokeColor: Colors.blue,
                //     backgroundColor: Colors.white,
                //   ),
                //   height: 200,
                //   width: 300,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
