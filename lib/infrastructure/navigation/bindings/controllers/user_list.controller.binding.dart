import 'package:get/get.dart';

import '../../../../presentation/userList/controllers/user_list.controller.dart';

class UserListControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserListController>(
      () => UserListController(),
    );
  }
}
