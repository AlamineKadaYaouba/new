import 'package:flutter/material.dart';
import 'package:genesis/App/app_sizes.dart';
import 'package:genesis/Widgets/CircularButtom.dart';
import 'package:genesis/Widgets/button.dart';
import 'package:genesis/presentation/dailyTask/daily_task_form.dart';

import 'package:get/get.dart';

import 'controllers/daily_task.controller.dart';

class DailyTaskScreen extends GetView<DailyTaskController> {
  const DailyTaskScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DailyTaskController taskController = Get.put(DailyTaskController());
    ScrollController scroll = ScrollController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Point Journalier'),
        centerTitle: true,
        actions: [
          CircularBottom(
            height: 43,
            width: 43,
            onPressed: () => taskController.decrementTaskLenght(),
            icon: const Icon(
              Icons.remove,
              size: 25,
            ),
          ),
          const SizedBox(width: 7),
          CircularBottom(
            height: 43,
            width: 43,
            onPressed: () => taskController.incrementTaskLenght(),
            icon: const Icon(
              Icons.add,
              size: 25,
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
      body: Center(
        child: SizedBox(
          height: Get.height,
          width: Get.width - 20,
          child: SingleChildScrollView(
            controller: scroll,
            child: Column(
              children: [
                Obx(
                  () => ListView.builder(
                    controller: scroll,
                    shrinkWrap: true,
                    itemCount: taskController.taskLenght.value,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          const SizedBox(height: 15),
                          DailyTaskForm(
                            taskController: taskController,
                            index: index + 1,
                          ),
                        ],
                      );
                    },
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
}
