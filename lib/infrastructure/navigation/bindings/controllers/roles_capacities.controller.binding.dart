import 'package:get/get.dart';

import '../../../../presentation/RolesCapacities/controllers/roles_capacities.controller.dart';

class RolesCapacitiesControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RolesCapacitiesController>(
      () => RolesCapacitiesController(),
    );
  }
}
