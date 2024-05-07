import 'package:get/get.dart';

class DailyTaskController extends GetxController {
  //TODO: Implement DailyTaskController

  final taskLenght = 1.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void incrementTaskLenght() => taskLenght.value++;
  void decrementTaskLenght() {
    if (taskLenght.value > 0) taskLenght.value--;
  }
}
