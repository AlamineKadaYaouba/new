// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:genesis/App/app_colors.dart';
import 'package:genesis/App/app_sizes.dart';
import 'package:genesis/Widgets/CListTile.dart';
import 'package:genesis/Widgets/button.dart';
import 'package:genesis/models/capacity/capacity_model.dart';
import 'package:genesis/models/role/role_model.dart';
import 'package:genesis/presentation/RolesCapacities/controllers/roles_capacities.controller.dart';
import 'package:get/get.dart';

class ListCapacities extends GetView<RolesCapacitiesController> {
  const ListCapacities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RolesCapacitiesController roleController =
        Get.put(RolesCapacitiesController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Liste des capacités',
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
                            "Capacité $index",
                            style: TextStyle(fontSize: AppSizes.title2),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(
                                  IconlyLight.editSquare,
                                  color: AppColors.green,
                                ),
                                onPressed: () {},
                              ),
                              const SizedBox(width: 10),
                              IconButton(
                                icon: const Icon(
                                  Icons.lock,
                                  color: AppColors.red,
                                ),
                                onPressed: () => showDisableCapacityAlertDialog(
                                  context,
                                  Capacity(name: "Capacité $index"),
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

  showDisableCapacityAlertDialog(BuildContext context, Capacity capacity) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Bloquer la capcité",
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.red),
          ),
          content: Text(
            "Vous êtes sur le point de bloqué la capacité ${capacity.name}\n\nÊtes-vous sur de vouloir procéder a cette opération ?",
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
