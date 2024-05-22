import 'package:flutter/material.dart';
import 'package:genesis/App/app_colors.dart';
import 'package:genesis/App/app_sizes.dart';
import 'package:genesis/Widgets/CircularButtom.dart';
import 'package:genesis/Widgets/button.dart';
import 'package:genesis/Widgets/daily_task_table.dart';
import 'package:genesis/models/daily_task/daily_task_model.dart';
import 'package:genesis/presentation/dailyTask/daily_task_form.dart';

import 'package:get/get.dart';

import 'controllers/daily_task.controller.dart';

class AddDailyTask extends GetView<DailyTaskController> {
  const AddDailyTask({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    DailyTaskController taskController = Get.put(DailyTaskController());
    ScrollController scroll = ScrollController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Point Journalier'),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          height: Get.height,
          width: Get.width - 20,
          child: SingleChildScrollView(
            controller: scroll,
            child: Column(
              children: [
                const SizedBox(height: 10),
                DailyTaskForm(
                  taskController: taskController,
                  index: 1,
                ),
                const SizedBox(height: 20),
                FButton(
                  width: Get.width < AppSizes.tablet1 ? null : Get.width / 3,
                  stretch: Get.width < AppSizes.tablet1 ? true : false,
                  text: "valider",
                  onPressed: () => taskController.addTask(),
                ),
                const SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    width: Get.width <= 800 ? 800 : Get.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      color: AppColors.secondary,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                          child: Row(
                            children: [
                              const Expanded(
                                flex: 1,
                                child: Center(
                                  child: Text(
                                    "N°",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 2,
                                color: AppColors.white,
                              ),
                              const Expanded(
                                flex: 2,
                                child: Center(
                                  child: Text(
                                    "Tâche",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 2,
                                color: AppColors.white,
                              ),
                              const Expanded(
                                flex: 4,
                                child: Center(
                                  child: Text(
                                    "Description",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 2,
                                color: AppColors.white,
                              ),
                              const Expanded(
                                flex: 1,
                                child: Center(
                                  child: Text(
                                    "Durée",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 2,
                                color: AppColors.white,
                              ),
                              const Expanded(
                                flex: 1,
                                child: Center(
                                  child: Text(
                                    "Evolution",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 2,
                                color: AppColors.white,
                              ),
                              const Expanded(
                                flex: 3,
                                child: Center(
                                  child: Text(
                                    "Difficulté",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 2,
                                color: AppColors.white,
                              ),
                              const Expanded(
                                flex: 1,
                                child: Center(
                                  child: Text(
                                    "Modifier",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 2,
                                color: AppColors.white,
                              ),
                              const Expanded(
                                flex: 1,
                                child: Center(
                                  child: Text(
                                    "Supprimer",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: AppColors.white,
                          child: Obx(
                            () => taskController.isNotOk.value == false &&
                                    taskController.taskList.isEmpty
                                ? const Padding(
                                    padding:
                                        EdgeInsets.only(top: 15, bottom: 15),
                                    child: Center(
                                      child: Text(
                                        "Aucune tâches à enregistré",
                                      ),
                                    ),
                                  )
                                : ListView.builder(
                                    controller: scroll,
                                    shrinkWrap: true,
                                    itemCount: taskController.taskList.length,
                                    itemBuilder: (context, index) {
                                      DailyTask operation =
                                          taskController.taskList[index];
                                      return Column(
                                        children: [
                                          CustumListTile.ctaskListTile(
                                              operation, index + 1),
                                          Container(
                                            height: 2,
                                            color: AppColors.black
                                                .withOpacity(0.2),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                FButton(
                  width: Get.width < AppSizes.tablet1 ? null : 500,
                  stretch: Get.width < AppSizes.tablet1 ? true : false,
                  text: "Enregistrer",
                  onPressed: () => null,
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget cDivider(
      {required double heigth, required double width, required Color color}) {
    return Container(
      height: heigth,
      width: width,
      color: color,
    );
  }
}
