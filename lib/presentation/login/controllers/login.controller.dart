import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  Rx<GlobalKey<FormState>> key = GlobalKey<FormState>().obs;
  static RxBool isPasswordVisible = true.obs;
  final Rx<TextEditingController> login = TextEditingController().obs;
  final Rx<TextEditingController> password = TextEditingController().obs;

  final index = 0.obs;
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

  void changePasswordVisibility() =>
      isPasswordVisible.value = !isPasswordVisible.value;
}
