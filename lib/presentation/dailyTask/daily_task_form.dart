// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:genesis/App/app_colors.dart';
import 'package:genesis/App/app_sizes.dart';
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
    return SizedBox(
      height: 430,
      width: Get.width < AppSizes.tablet1 ? Get.width - 10 : 500,
      child: Stack(
        children: [
          GlassmorphicContainer(
            width: Get.width < AppSizes.tablet1 ? Get.width - 10 : 500,
            height: 420,
            borderRadius: 20,
            blur: 120,
            alignment: Alignment.bottomCenter,
            border: 2,
            linearGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.black.withOpacity(0.1),
                  Color(0xFFFFFFFF).withOpacity(0.05),
                ],
                stops: [
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
            // decoration: BoxDecoration(
            //   color: Colors.transparent,
            //   border: Border.all(width: 1),
            //   borderRadius: BorderRadius.circular(25),
            // ),
          ),
          Form(
            // key: roleController.usersForm.value,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Column(
                children: [
                  Text(
                    'Point N°$index',
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     SizedBox(
                  //       width: Get.width < AppSizes.tablet1
                  //           ? Get.width / 2 - 20
                  //           : 240,
                  //       child: TextFormField(
                  //         // controller: roleController.lastName.value,
                  //         // validator: Validator.required(),
                  //         decoration: InputDecoration(
                  //           border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(10),
                  //             borderSide: const BorderSide(
                  //               color: AppColors.red,
                  //             ),
                  //           ),
                  //           label: const Text("Issue"),
                  //           // suffixIcon: const Icon(
                  //           //   IconlyLight.profile,
                  //           //   color: AppColors.primary,
                  //           // ),
                  //           hintText: 'Issue',
                  //         ),
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: Get.width < AppSizes.tablet1
                  //           ? Get.width / 2 - 20
                  //           : 240,
                  //       height: 55,
                  //       child: DropdownButtonFormField<String>(
                  //         // value: roleController.rolesLevel.value,
                  //         icon: const Icon(
                  //           IconlyLight.arrowDown2,
                  //           color: AppColors.primary,
                  //         ),
                  //         items: [
                  //           DropdownMenuItem<String>(
                  //             value: "Prévu",
                  //             child: Text(
                  //               "Prévu",
                  //               style: TextStyle(fontSize: AppSizes.title1),
                  //             ),
                  //           ),
                  //           DropdownMenuItem<String>(
                  //             value: "Imprévu",
                  //             child: Text(
                  //               "Imprévu",
                  //               style: TextStyle(fontSize: AppSizes.title1),
                  //             ),
                  //           ),
                  //         ],
                  //         onChanged: (String? value) {
                  //           // roleController.superviseur.value.text = value.toString();
                  //         },
                  //         decoration: InputDecoration(
                  //           border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(10),
                  //             borderSide: const BorderSide(
                  //               color: AppColors.red,
                  //             ),
                  //           ),
                  //           label: const Text("Prévision"),
                  //           hintText: 'Prévision',
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(
                    child: DropdownButtonFormField<String>(
                      // value: roleController.rolesLevel.value,
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
                        // roleController.superviseur.value.text = value.toString();
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: AppColors.red,
                          ),
                        ),
                        label: Text("Projet"),
                        hintText: 'Projet',
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    child: TextFormField(
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
                  const SizedBox(height: 10),
                  SizedBox(
                    child: TextFormField(
                      maxLines: 3,
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
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    child: TextFormField(
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: Get.width < AppSizes.tablet1
                            ? Get.width / 2 - 20
                            : 240,
                        height: 55,
                        child: DropdownButtonFormField<String>(
                          // value: roleController.rolesLevel.value,
                          icon: const Icon(
                            IconlyLight.arrowDown2,
                            color: AppColors.primary,
                          ),
                          items: [
                            DropdownMenuItem<String>(
                              value: "Teminer",
                              child: Text(
                                "Terminer",
                                style: TextStyle(fontSize: AppSizes.title1),
                              ),
                            ),
                            DropdownMenuItem<String>(
                              value: "En cours",
                              child: Text(
                                "En cours",
                                style: TextStyle(fontSize: AppSizes.title1),
                              ),
                            ),
                          ],
                          onChanged: (String? value) {
                            // roleController.superviseur.value.text = value.toString();
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: AppColors.red,
                              ),
                            ),
                            label: const Text("Etat"),
                            hintText: 'Etat',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Get.width < AppSizes.tablet1
                            ? Get.width / 2 - 20
                            : 240,
                        child: TextFormField(
                          // controller: roleController.lastName.value,
                          // validator: Validator.required(),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: AppColors.red,
                              ),
                            ),
                            label: const Text("Durée"),
                            hintText: 'Durée',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
