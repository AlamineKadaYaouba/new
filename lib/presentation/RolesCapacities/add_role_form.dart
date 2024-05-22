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
import 'package:multi_select_flutter/dialog/mult_select_dialog.dart';

class AddRoleForm extends GetView<RolesCapacitiesController> {
  AddRoleForm({super.key, this.role});
  Role? role;

  @override
  Widget build(BuildContext context) {
    RolesCapacitiesController roleController =
        Get.put(RolesCapacitiesController());
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 380,
                width: Get.width < AppSizes.tablet1 ? Get.width - 10 : 450,
                child: Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  elevation: 4,
                  child: Form(
                    key: roleController.roulesForm.value,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: role == null
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Ajouter un role',
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                SizedBox(
                                  child: TextFormField(
                                    controller: roleController.roles.value,
                                    validator: Validator.required(),
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
                                  ),
                                ),
                                const SizedBox(height: 20),
                                SizedBox(
                                  child: DropdownButtonFormField<String>(
                                    // value: roleController.rolesLevel.value,
                                    icon: const Icon(
                                      IconlyLight.arrowDown2,
                                      color: AppColors.primary,
                                    ),
                                    items: roleController.levelList
                                        .map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: TextStyle(
                                              fontSize: AppSizes.title1),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? value) {
                                      roleController.rolesLevel.value =
                                          value.toString();
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
                                SizedBox(
                                  child: DropdownButtonFormField<String>(
                                    // value: roleController.rolesLevel.value,
                                    icon: const Icon(
                                      IconlyLight.arrowDown2,
                                      color: AppColors.primary,
                                    ),
                                    items: roleController.superviseurList
                                        .map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: "Capacité $value",
                                        child: Text(
                                          "Capacité $value",
                                          style: TextStyle(
                                              fontSize: AppSizes.title1),
                                        ),
                                      );
                                    }).toList(),
                                    onTap: () => showListCapacities(
                                        context, roleController),
                                    onChanged: (value) {},
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: AppColors.red,
                                        ),
                                      ),
                                      label: const Text("Capacité"),
                                      hintText: 'Capcité du role',
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
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Modifier un role',
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                SizedBox(
                                  child: TextFormField(
                                    initialValue: role!.name,
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
                                    onChanged: (value) => role!.name = value,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                SizedBox(
                                  child: DropdownButtonFormField<String>(
                                    value: role!.name,
                                    icon: const Icon(
                                      IconlyLight.arrowDown2,
                                      color: AppColors.primary,
                                    ),
                                    items: roleController.levelList
                                        .map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: TextStyle(
                                              fontSize: AppSizes.title1),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? value) {
                                      role!.level = value.toString();
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
                                SizedBox(
                                  child: DropdownButtonFormField<String>(
                                    // value: role!.name,
                                    icon: const Icon(
                                      IconlyLight.arrowDown2,
                                      color: AppColors.primary,
                                    ),
                                    items: roleController.superviseurList
                                        .map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: "Capacité $value",
                                        child: Text(
                                          "Capacité $value",
                                          style: TextStyle(
                                              fontSize: AppSizes.title1),
                                        ),
                                      );
                                    }).toList(),
                                    onTap: () => showListCapacities(
                                        context, roleController),
                                    onChanged: (value) {},
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: AppColors.red,
                                        ),
                                      ),
                                      label: const Text("Capacité"),
                                      hintText: 'Capcité du role',
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
            ],
          ),
        ),
      ),
    );
  }

  void showListCapacities(
      BuildContext context, RolesCapacitiesController roleController) async {
    await showDialog(
      context: context,
      builder: (ctx) {
        return MultiSelectDialog(
          items: roleController.capacitiesList,
          initialValue: roleController.roleCapacities,
          onConfirm: (values) {
            roleController.roleCapacities.clear();
            values.forEach((element) {
              roleController.roleCapacities.add(element.toString());
            });
          },
        );
      },
    );
  }

  void showListCapacitiesForEdit(
      BuildContext context, RolesCapacitiesController roleController) async {
    await showDialog(
      context: context,
      builder: (ctx) {
        return MultiSelectDialog(
          items: roleController.capacitiesList,
          initialValue: roleController.roleCapacities,
          onConfirm: (values) {
            role!.capacities!.clear();
            values.forEach((element) {
              role!.capacities!.add(element.toString());
            });
          },
        );
      },
    );
  }
}
