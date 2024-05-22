import 'package:flutter/material.dart';
import 'package:genesis/models/daily_task/daily_task_model.dart';
import 'package:get/get.dart';

class DailyTaskController extends GetxController {
  //TODO: Implement DailyTaskController

// Task Form
  var taskFormKey = GlobalKey<FormState>().obs;
  final taskLenght = 1.obs;
  RxString taskValue = ''.obs;
  RxBool isNotOk = false.obs;

  RxDouble evolutionPercent = 1.0.obs;

  Rx<TimeOfDay> selectedTime = const TimeOfDay(hour: 0, minute: 0).obs;

  // var task = TextEditingController().obs;
  var description = TextEditingController().obs;
  var difficulty = TextEditingController().obs;
  var time = TextEditingController().obs;
  var state = TextEditingController().obs;
  RxList<DailyTask> taskList = RxList<DailyTask>.empty();

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

  void removeTaskInList(int index) {
    taskList.remove(taskList[index - 1]);
  }

  void showHorloge(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      selectedTime.value = pickedTime;
    }
  }

  addTask() {
    if (taskFormKey.value.currentState!.validate()) {
      taskList.add(
        DailyTask(
          task: taskValue.value,
          date: DateTime.now().toString(),
          description: description.value.text,
          difficulty: difficulty.value.text,
          evolution: evolutionPercent.value.toString(),
          time: "${selectedTime.value.hour}:${selectedTime.value.minute}",
        ),
      );
      description.value.clear();
      difficulty.value.clear();
      state.value.clear();
      time.value.clear();
      evolutionPercent.value = 1.0;
    }
  }

  editTask(int index, DailyTask task) {
    removeTaskInList(index);
    description.value.text = task.description ?? "";
    difficulty.value.text = task.difficulty ?? "";
    state.value.text = task.evolution ?? "";
    selectedTime.value = TimeOfDay(
      hour: int.parse(task.time!.split(":").first),
      minute: int.parse(task.time!.split(":").last),
    );
    evolutionPercent.value = double.parse(task.evolution!);
  }
}
