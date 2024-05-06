import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:genesis/App/app_colors.dart';
import 'package:genesis/App/app_sizes.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'controllers/dashboard.controller.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width - 10,
          child: SingleChildScrollView(
            child: Center(
                child: Wrap(
              children: [
                Card(
                  child: Container(
                    height: 220,
                    width: 440,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 7,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Text(
                                        "Tâches",
                                        style: TextStyle(
                                          fontSize: AppSizes.title3,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    const Row(
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: Text("Tâches objectivées"),
                                        ),
                                        Expanded(flex: 1, child: Text("6")),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    const Row(
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: Text("Tâches Terminées"),
                                        ),
                                        Expanded(flex: 1, child: Text("4")),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    const Row(
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: Text("Tâches en cours"),
                                        ),
                                        Expanded(flex: 1, child: Text("11")),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    const Row(
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child:
                                              Text("Tâches en non objectivé"),
                                        ),
                                        Expanded(flex: 1, child: Text("11")),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: CircularPercentIndicator(
                                  radius: 20.5,
                                  lineWidth: 5.0,
                                  animation: true,
                                  percent: 0.76,
                                  center: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "76%",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  //footer text
                                  backgroundColor: Colors.grey,
                                  circularStrokeCap: CircularStrokeCap.butt,
                                  progressColor:
                                      Colors.green, //progress bar color
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Détails",
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontSize: AppSizes.title1,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Icon(Icons.arrow_forward_ios, size: 20)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    height: 220,
                    width: 440,
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "Incidents Signalés",
                            style: TextStyle(
                              fontSize: AppSizes.title3,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Expanded(
                          child: CarouselSlider(
                            options: CarouselOptions(
                              height: 400,
                              aspectRatio: 16 / 9,
                              viewportFraction: 0.8,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              enlargeFactor: 0.3,
                              scrollDirection: Axis.horizontal,
                            ),
                            items: [1, 2, 3, 4, 5].map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    padding: const EdgeInsets.all(7),
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Text(
                                      'text $i',
                                      style: const TextStyle(fontSize: 16.0),
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Détails",
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: AppSizes.title1,
                                ),
                              ),
                              const SizedBox(width: 5),
                              const Icon(Icons.arrow_forward_ios, size: 15)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    height: 220,
                    width: 440,
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "Tickets en instances",
                            style: TextStyle(
                              fontSize: AppSizes.title3,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Text("Permissions"),
                                ),
                                Expanded(flex: 1, child: Text("6")),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Text("Documents"),
                                ),
                                Expanded(flex: 1, child: Text("4")),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Text("Documents"),
                                ),
                                Expanded(flex: 1, child: Text("4")),
                              ],
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Détails",
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: AppSizes.title1,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Icon(Icons.arrow_forward_ios, size: 17)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    height: 220,
                    width: 440,
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "Analyse assiduité",
                            style: TextStyle(
                              fontSize: AppSizes.title3,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "02h\nRetards",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: AppSizes.title2,
                                color: AppColors.orange,
                              ),
                            ),
                            Text(
                              "09h\nAbcences",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: AppSizes.title2,
                                color: AppColors.red,
                              ),
                            ),
                            Text(
                              "472h\nPrésences",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: AppSizes.title2,
                                color: AppColors.green,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        TextButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Détails",
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: AppSizes.title1,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Icon(Icons.arrow_forward_ios, size: 20)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
