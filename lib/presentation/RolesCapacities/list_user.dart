// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:genesis/App/app_sizes.dart';
import 'package:genesis/Widgets/CListTile.dart';
import 'package:genesis/presentation/RolesCapacities/controllers/roles_capacities.controller.dart';
import 'package:get/get.dart';

class ListUser extends GetView<RolesCapacitiesController> {
  const ListUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RolesCapacitiesController roleController =
        Get.put(RolesCapacitiesController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Liste des collaborateurs',
          style: TextStyle(
            fontSize: AppSizes.title4,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: Get.width < AppSizes.tablet1 ? Get.width - 10 : 600,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return CListTile.userListTile();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
