// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:genesis/App/app_colors.dart';
import 'package:genesis/App/app_sizes.dart';
import 'package:genesis/App/validator.dart';
import 'package:genesis/Widgets/button.dart';
import 'package:genesis/models/role/role_model.dart';
import 'package:genesis/presentation/RolesCapacities/controllers/roles_capacities.controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class DetailRole extends GetView<RolesCapacitiesController> {
  DetailRole({Key? key, required this.role}) : super(key: key);
  Role role;

  @override
  Widget build(BuildContext context) {
    RolesCapacitiesController roleController =
        Get.put(RolesCapacitiesController());
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 380,
          width: Get.width < AppSizes.tablet1 ? Get.width - 10 : 400,
          child: Card(
            elevation: 4,
            child: Form(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Modifier le roles',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: AppColors.red,
                            ),
                          ),
                          label: const Text("Role"),
                          suffixIcon: const Icon(
                            IconlyLight.category,
                            color: AppColors.primary,
                          ),
                          hintText: 'Intitulé du role',
                        ),
                        onChanged: (value) {
                          role.name = value;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      child: DropdownButtonFormField<String>(
                        value: role.level,
                        icon: const Icon(
                          IconlyLight.arrowDown2,
                          color: AppColors.primary,
                        ),
                        items: roleController.levelList.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          roleController.rolesLevel.value = value.toString();
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: AppColors.red,
                            ),
                          ),
                          label: const Text("Niveau"),
                          hintText: 'Niveau du role',
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    FButton(
                      stretch: true,
                      text: "Enregistrer",
                      onPressed: () => null,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
