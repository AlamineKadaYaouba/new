// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:genesis/App/app_colors.dart';
import 'package:genesis/App/app_sizes.dart';
import 'package:genesis/App/validator.dart';
import 'package:genesis/Widgets/CircularButtom.dart';
import 'package:genesis/Widgets/button.dart';
import 'package:genesis/presentation/dailyTask/controllers/daily_task.controller.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';

class DailyTaskForm extends GetView<DailyTaskController> {
  DailyTaskForm({Key? key, required this.taskController, required this.index})
      : super(key: key);
  DailyTaskController taskController = Get.put(DailyTaskController());
  int index;

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    // double size1 = (width - 30) / 2;

    return Obx(
      () => SizedBox(
        height: taskController.taskValue.value == "" ? 130 : 400,
        width: width <= AppSizes.tablet1 ? 380 : (width - 30) / 2,
        child: Stack(
          children: [
            GlassmorphicContainer(
              width: Get.width < AppSizes.tablet1
                  ? Get.width - 10
                  : ((width - 30) / 2) + 20,
              height: 450,
              borderRadius: 20,
              blur: 120,
              alignment: Alignment.bottomCenter,
              border: 2,
              linearGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.black.withOpacity(0.1),
                    const Color(0xFFFFFFFF).withOpacity(0.05),
                  ],
                  stops: const [
                    0.1,
                    1,
                  ]),
              borderGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primary.withOpacity(0.2),
                  AppColors.red.withOpacity(0.2),
                  AppColors.orange!.withOpacity(0.2),
                ],
              ),
              child: null,
            ),
            Form(
              key: taskController.taskFormKey.value,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 15, left: 6, right: 6, bottom: 6),
                child: Column(
                  children: [
                    Text(
                      'Rapport de la journée du ${DateTime.now().toString().split(" ").first}',
                      style: TextStyle(
                        fontSize: AppSizes.title2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      child: DropdownButtonFormField<String>(
                        value: taskController.taskValue.value == ""
                            ? null
                            : taskController.taskValue.value,
                        icon: const Icon(
                          IconlyLight.arrowDown2,
                          color: AppColors.primary,
                        ),
                        items: [
                          DropdownMenuItem<String>(
                            value: "Sygalin",
                            child: Text(
                              "Sygalin",
                              style: TextStyle(fontSize: AppSizes.title1),
                            ),
                          ),
                          DropdownMenuItem<String>(
                            value: "Sygalin_central",
                            child: Text(
                              "Sygalin_central",
                              style: TextStyle(fontSize: AppSizes.title1),
                            ),
                          ),
                        ],
                        onChanged: (String? value) {
                          taskController.taskValue.value = value.toString();
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: AppColors.red,
                            ),
                          ),
                          label: const Text("Tâche"),
                          hintText: 'Tâche',
                        ),
                      ),
                    ),
                    Obx(
                      () => taskController.taskValue.value.isNotEmpty
                          ? Column(
                              children: [
                                const SizedBox(height: 10),
                                SizedBox(
                                  child: TextFormField(
                                    maxLines: 4,
                                    controller:
                                        taskController.description.value,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: AppColors.red,
                                        ),
                                      ),
                                      label: const Text("Description"),
                                      hintText: 'Description',
                                    ),
                                    validator: Validator.required(),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  child: TextFormField(
                                    controller: taskController.difficulty.value,
                                    maxLines: 2,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: AppColors.red,
                                        ),
                                      ),
                                      label: const Text("Difficulté"),
                                      hintText: 'Difficulté',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // SizedBox(
                                    //   width: Get.width < AppSizes.tablet1
                                    //       ? Get.width / 2 - 20
                                    //       : (width - 60) / 4,
                                    //   height: 55,
                                    //   child: DropdownButtonFormField<String>(
                                    //     // value: roleController.rolesLevel.value,
                                    //     icon: const Icon(
                                    //       IconlyLight.arrowDown2,
                                    //       color: AppColors.primary,
                                    //     ),
                                    //     items: [
                                    //       DropdownMenuItem<String>(
                                    //         value: "Teminer",
                                    //         child: Text(
                                    //           "Terminer",
                                    //           style: TextStyle(
                                    //               fontSize: AppSizes.title1),
                                    //         ),
                                    //       ),
                                    //       DropdownMenuItem<String>(
                                    //         value: "En cours",
                                    //         child: Text(
                                    //           "En cours",
                                    //           style: TextStyle(
                                    //               fontSize: AppSizes.title1),
                                    //         ),
                                    //       ),
                                    //     ],
                                    //     onChanged: (String? value) {
                                    //       taskController.state.value.text =
                                    //           value.toString();
                                    //     },
                                    //     decoration: InputDecoration(
                                    //       border: OutlineInputBorder(
                                    //         borderRadius:
                                    //             BorderRadius.circular(10),
                                    //         borderSide: const BorderSide(
                                    //           color: AppColors.red,
                                    //         ),
                                    //       ),
                                    //       label: const Text("Etat"),
                                    //       hintText: 'Etat',
                                    //     ),
                                    //   ),
                                    // ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                            "Taux d'évolution : ${taskController.evolutionPercent.value.toStringAsFixed(0)} %",
                                            style:
                                                const TextStyle(fontSize: 14),
                                          ),
                                        ),
                                        Obx(
                                          () => SizedBox(
                                            height: 30,
                                            width: Get.width < AppSizes.tablet1
                                                ? Get.width / 2 - 20
                                                : (width - 60) / 3.2,
                                            child: Slider(
                                              value: taskController
                                                  .evolutionPercent.value,
                                              min: 1,
                                              max: 100,
                                              onChanged: (value) {
                                                taskController.evolutionPercent
                                                    .value = value;
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            const Text("Heure"),
                                            Container(
                                              height:
                                                  Get.width < AppSizes.tablet1
                                                      ? 30
                                                      : 40,
                                              width:
                                                  Get.width < AppSizes.tablet1
                                                      ? 40
                                                      : 50,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Center(
                                                child: Text(
                                                    "${taskController.selectedTime.value.hour <= 9 ? "0" : ""}${taskController.selectedTime.value.hour}"),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 5),
                                        const Text(
                                          ":",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        const SizedBox(width: 5),
                                        Column(
                                          children: [
                                            const Text("Minute"),
                                            Container(
                                              height:
                                                  Get.width < AppSizes.tablet1
                                                      ? 30
                                                      : 40,
                                              width:
                                                  Get.width < AppSizes.tablet1
                                                      ? 40
                                                      : 50,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Center(
                                                child: Text(
                                                    "${taskController.selectedTime.value.minute <= 9 ? "0" : ""}${taskController.selectedTime.value.minute}"),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 10),
                                        CircularBottom(
                                          radius: 10,
                                          height: 40,
                                          width: 40,
                                          color: AppColors.primary,
                                          icon: const Icon(
                                            Icons.access_time_sharp,
                                            color: AppColors.white,
                                          ),
                                          onPressed: () {
                                            taskController.showHorloge(context);
                                          },
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            )
                          : Container(),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
