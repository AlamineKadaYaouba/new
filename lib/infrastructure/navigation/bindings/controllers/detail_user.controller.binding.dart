import 'package:get/get.dart';

import '../../../../presentation/detailUser/controllers/detail_user.controller.dart';

class DetailUserControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailUserController>(
      () => DetailUserController(),
    );
  }
}
