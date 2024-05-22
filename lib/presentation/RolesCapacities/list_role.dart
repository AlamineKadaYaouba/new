// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:genesis/App/app_colors.dart';
import 'package:genesis/App/app_sizes.dart';
import 'package:genesis/Widgets/CListTile.dart';
import 'package:genesis/Widgets/button.dart';
import 'package:genesis/models/role/role_model.dart';
import 'package:genesis/presentation/RolesCapacities/controllers/roles_capacities.controller.dart';
import 'package:get/get.dart';

class ListRoles extends GetView<RolesCapacitiesController> {
  const ListRoles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RolesCapacitiesController roleController =
        Get.put(RolesCapacitiesController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Liste des Rôles',
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
                  return Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Role $index",
                            style: TextStyle(fontSize: AppSizes.title2),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(
                                  IconlyLight.editSquare,
                                  color: AppColors.green,
                                ),
                                onPressed: () => showDisableRoleAlertDialog(
                                  context,
                                  Role(name: "Role $index", capacities: []),
                                ),
                              ),
                              const SizedBox(width: 10),
                              IconButton(
                                icon: const Icon(
                                  Icons.lock,
                                  color: AppColors.red,
                                ),
                                onPressed: () => showDisableRoleAlertDialog(
                                  context,
                                  Role(name: "Role $index", capacities: []),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  showDisableRoleAlertDialog(BuildContext context, Role role) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Bloquer le rôle",
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.red),
          ),
          content: Text(
            "Vous êtes sur le point de bloqué le rôle ${role.name}\n\nÊtes-vous sur de vouloir procéder a cette opération ?",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: AppSizes.title1),
          ),
          actions: [
            FButton(
              height: 40,
              text: "Oui",
              color: AppColors.red,
              onPressed: () {},
            ),
            FButton(
              height: 40,
              text: "Nom",
              onPressed: () => Get.back(),
            ),
          ],
        );
      },
    );
  }
}
