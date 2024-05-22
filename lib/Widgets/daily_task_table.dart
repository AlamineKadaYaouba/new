import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:genesis/App/app_colors.dart';
import 'package:genesis/App/app_images.dart';
import 'package:genesis/models/daily_task/daily_task_model.dart';
import 'package:genesis/presentation/dailyTask/controllers/daily_task.controller.dart';
import 'package:get/get.dart';

class CustumListTile {
  static Widget ctaskListTile(DailyTask task, int index) {
    DailyTaskController taskController = Get.put(DailyTaskController());
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Center(
            child: Text(
              index.toString(),
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.black,
              ),
            ),
          ),
        ),
        Container(
          height: 60,
          width: 2,
          color: AppColors.black.withOpacity(0.2),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Center(
              child: Text(
                task.task ?? "Cargement",
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.black,
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 60,
          width: 2,
          color: AppColors.black.withOpacity(0.2),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Center(
              child: Text(
                task.description ?? "Cargement",
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.black,
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 60,
          width: 2,
          color: AppColors.black.withOpacity(0.2),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Center(
              child: Text(
                task.time ?? "Cargement",
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.black,
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 60,
          width: 2,
          color: AppColors.black.withOpacity(0.2),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Center(
              child: Text(
                "${task.evolution?.replaceRange(3, null, "") ?? "1"}%",
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.black,
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 60,
          width: 2,
          color: AppColors.black.withOpacity(0.2),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Center(
              child: Text(
                "+ ${task.difficulty ?? "Cargement"}",
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.black,
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 60,
          width: 2,
          color: AppColors.black.withOpacity(0.2),
        ),
        Expanded(
          flex: 1,
          child: Center(
            child: IconButton(
              icon: const Icon(
                IconlyLight.editSquare,
                color: AppColors.green,
              ),
              onPressed: () => taskController.editTask(index, task),
            ),
          ),
        ),
        Container(
          height: 60,
          width: 2,
          color: AppColors.black.withOpacity(0.2),
        ),
        Expanded(
          flex: 1,
          child: Center(
            child: IconButton(
              icon: const Icon(
                IconlyLight.delete,
                color: AppColors.red,
              ),
              onPressed: () => taskController.removeTaskInList(index),
            ),
          ),
        ),
      ],
    );
  }

  static Widget ctaskListTile2(List<DailyTask> tasks, int index) {
    DailyTaskController taskController = Get.put(DailyTaskController());
    return Row(
      children: [
        const Expanded(
          flex: 2,
          child: Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(AppImages.getStarted),
                ),
                SizedBox(height: 10),
                Text("Maurel Meli Tikeng"),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 11,
          child: Column(
            children: tasks
                .map((task) => Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 90,
                              width: 2,
                              color: AppColors.black.withOpacity(0.2),
                            ),
                            // Expanded(
                            //   flex: 1,
                            //   child: Center(
                            //     child: Text(
                            //       index.toString(),
                            //       style: const TextStyle(
                            //         fontSize: 13,
                            //         color: AppColors.black,
                            //       ),
                            //     ),
                            //   ),
                            // ),

                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Center(
                                  child: Text(
                                    task.task ?? "Cargement",
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 90,
                              width: 2,
                              color: AppColors.black.withOpacity(0.2),
                            ),
                            Expanded(
                              flex: 4,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Center(
                                  child: Text(
                                    task.description ?? "Cargement",
                                    maxLines: 10,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 90,
                              width: 2,
                              color: AppColors.black.withOpacity(0.2),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Center(
                                  child: Text(
                                    task.time ?? "Cargement",
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 90,
                              width: 2,
                              color: AppColors.black.withOpacity(0.2),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Center(
                                  child: Text(
                                    "${task.evolution?.replaceRange(3, null, "") ?? "1"}%",
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 90,
                              width: 2,
                              color: AppColors.black.withOpacity(0.2),
                            ),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Center(
                                  child: Text(
                                    "+ ${task.difficulty ?? "Cargement"}",
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 2,
                          color: AppColors.black.withOpacity(0.2),
                        ),
                      ],
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
