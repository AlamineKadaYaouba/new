import 'package:get/get.dart';

import '../../../../presentation/NavBar/controllers/nav_bar.controller.dart';

class NavBarControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavBarController>(
      () => NavBarController(),
    );
  }
}
