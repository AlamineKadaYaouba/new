import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

class RolesCapacitiesController extends GetxController {
  //TODO: Implement RolesCapacitiesController

  Rx<GlobalKey<FormState>> capacityForm = GlobalKey<FormState>().obs;
  final Rx<TextEditingController> capacity = TextEditingController().obs;

  Rx<GlobalKey<FormState>> roulesForm = GlobalKey<FormState>().obs;
  final Rx<TextEditingController> roles = TextEditingController().obs;
  final RxString rolesLevel = "Aucune".obs;

  Rx<GlobalKey<FormState>> usersForm = GlobalKey<FormState>().obs;
  final Rx<TextEditingController> superviseur = TextEditingController().obs;
  final Rx<TextEditingController> lastName = TextEditingController().obs;
  final Rx<TextEditingController> firstName = TextEditingController().obs;
  final Rx<TextEditingController> userCapacities = TextEditingController().obs;
  final Rx<TextEditingController> userrRoles = TextEditingController().obs;

  List<String> levelList = ["N+0", "N+5", "N+15", "N+25", "N+35", "N+45"];
  List<String> rolesListSelected = [];
  List<String> capacityListSelected = [];
  List<MultiSelectItem> rolesList = List.generate(
    10,
    (index) => MultiSelectItem('Option $index', 'Option $index'),
  );
  List<String> superviseurList = [
    "Superviseur 1",
    "Superviseur 2",
    "Superviseur 3",
    "Superviseur 4",
    "Superviseur 5",
    "Superviseur 6"
  ];

  final count = 0.obs;
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

  void increment() => count.value++;
}
