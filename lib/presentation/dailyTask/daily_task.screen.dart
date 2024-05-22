import 'package:flutter/material.dart';
import 'package:genesis/App/app_colors.dart';
import 'package:genesis/App/app_instances.dart';
import 'package:genesis/Widgets/daily_task_table.dart';
import 'package:genesis/models/daily_task/daily_task_model.dart';
import 'package:genesis/presentation/dailyTask/controllers/daily_task.controller.dart';
import 'package:get/get.dart';

class DailyTaskScreen extends GetView<DailyTaskController> {
  const DailyTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DailyTaskController taskController = Get.put(DailyTaskController());
    ScrollController scroll = ScrollController();
    return Center(
      child: SizedBox(
        height: Get.height,
        width: Get.width - 10,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  width: Get.width <= 1000 ? 1000 : Get.width,
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
                              flex: 2,
                              child: Center(
                                child: Text(
                                  "Collaborateurs",
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
                            // const Expanded(
                            //   flex: 1,
                            //   child: Center(
                            //     child: Text(
                            //       "N°",
                            //       style: TextStyle(
                            //         fontSize: 12,
                            //         color: AppColors.white,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            // Container(
                            //   height: 30,
                            //   width: 2,
                            //   color: AppColors.white,
                            // ),
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
                          ],
                        ),
                      ),
                      Container(
                        color: AppColors.white,
                        child: Obx(
                          () => taskController.isNotOk.value == false &&
                                  AppInstances.tasks.isEmpty
                              ? const Padding(
                                  padding: EdgeInsets.only(top: 15, bottom: 15),
                                  child: Center(
                                    child: Text(
                                      "Aucune tâches à enregistré",
                                    ),
                                  ),
                                )
                              : ListView.builder(
                                  controller: scroll,
                                  shrinkWrap: true,
                                  itemCount: AppInstances.tasks.length,
                                  itemBuilder: (context, index) {
                                    // DailyTask operation =
                                    //     taskController.taskList[index];
                                    return Column(
                                      children: [
                                        CustumListTile.ctaskListTile2(
                                            AppInstances.tasks, index + 1),
                                        Container(
                                          height: 2,
                                          color:
                                              AppColors.black.withOpacity(0.2),
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
            ],
          ),
        ),
      ),
    );
  }
}
