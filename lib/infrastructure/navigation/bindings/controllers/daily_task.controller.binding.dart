import 'package:get/get.dart';

import '../../../../presentation/dailyTask/controllers/daily_task.controller.dart';

class DailyTaskControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DailyTaskController>(
      () => DailyTaskController(),
    );
  }
}
