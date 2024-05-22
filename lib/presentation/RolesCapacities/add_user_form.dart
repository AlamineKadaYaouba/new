// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:genesis/App/app_colors.dart';
import 'package:genesis/App/app_sizes.dart';
import 'package:genesis/App/validator.dart';
import 'package:genesis/Widgets/button.dart';
import 'package:genesis/Widgets/loading.dart';
import 'package:genesis/Widgets/showProgress.dart';
import 'package:genesis/models/users/users_model.dart';
import 'package:genesis/presentation/RolesCapacities/controllers/roles_capacities.controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:multi_select_flutter/dialog/mult_select_dialog.dart';

class AddUserForm extends GetView<RolesCapacitiesController> {
  AddUserForm({Key? key, this.user}) : super(key: key);
  Users? user;

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
                height: 660,
                width: Get.width < AppSizes.tablet1 ? Get.width - 10 : 450,
                child: Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  elevation: 4,
                  child: Form(
                    key: roleController.usersForm.value,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Ajouter un collaborateur',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            child: TextFormField(
                              controller: roleController.lastName.value,
                              validator: Validator.required(),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: AppColors.red,
                                  ),
                                ),
                                label: const Text("Nom(s)"),
                                suffixIcon: const Icon(
                                  IconlyLight.profile,
                                  color: AppColors.primary,
                                ),
                                hintText: 'Nom(s)',
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            child: TextFormField(
                              controller: roleController.firstName.value,
                              validator: Validator.required(),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: AppColors.red,
                                  ),
                                ),
                                label: const Text("prénom(s)"),
                                suffixIcon: const Icon(
                                  IconlyLight.profile,
                                  color: AppColors.primary,
                                ),
                                hintText: 'prénom(s)',
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            child: TextFormField(
                              controller: roleController.phone.value,
                              keyboardType: TextInputType.phone,
                              validator: Validator.required(),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: AppColors.red,
                                  ),
                                ),
                                label: const Text("Numéro de téléphone"),
                                suffixIcon: const Icon(
                                  IconlyLight.call,
                                  color: AppColors.primary,
                                ),
                                hintText: 'Téléphone',
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            child: TextFormField(
                              controller: roleController.email.value,
                              keyboardType: TextInputType.emailAddress,
                              validator: Validator.required(),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: AppColors.red,
                                  ),
                                ),
                                label: const Text("Email"),
                                suffixIcon: const Icon(
                                  IconlyLight.message,
                                  color: AppColors.primary,
                                ),
                                hintText: 'Email',
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            child: DropdownButtonFormField<String>(
                              icon: const Icon(
                                IconlyLight.arrowDown2,
                                color: AppColors.primary,
                              ),
                              items: roleController.superviseurList
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: "Division $value",
                                  child: Text(
                                    "Division $value",
                                    style: TextStyle(fontSize: AppSizes.title1),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                roleController.division.value.text =
                                    value.toString();
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: AppColors.red,
                                  ),
                                ),
                                label: const Text("Division"),
                                hintText: 'Division',
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            child: DropdownButtonFormField<String>(
                              icon: const Icon(
                                IconlyLight.arrowDown2,
                                color: AppColors.primary,
                              ),
                              items: roleController.superviseurList
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: "Service $value",
                                  child: Text(
                                    "Service $value",
                                    style: TextStyle(fontSize: AppSizes.title1),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                roleController.workspace.value.text =
                                    value.toString();
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: AppColors.red,
                                  ),
                                ),
                                label: const Text("Lieu de service"),
                                hintText: 'Lieu de service',
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FButton(
                                color: AppColors.white,
                                border: true,
                                textColor: AppColors.black,
                                borderColor: AppColors.primary,
                                text: "Ajouter un role",
                                onPressed: () =>
                                    showListRoles(context, roleController),
                              ),
                              FButton(
                                color: AppColors.white,
                                border: true,
                                borderColor: AppColors.primary,
                                textColor: AppColors.black,
                                text: "Ajouter une capacité",
                                onPressed: () =>
                                    showListCapacities(context, roleController),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          FButton(
                            stretch: true,
                            text: "Enregistrer",
                            onPressed: () => showProgress(context),
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

  void showListRoles(
      BuildContext context, RolesCapacitiesController roleController) async {
    await showDialog(
      context: context,
      builder: (ctx) {
        return MultiSelectDialog(
          items: roleController.rolesList,
          initialValue: roleController.userRoules,
          onConfirm: (values) {
            roleController.userRoules.clear();
            values.forEach((element) {
              roleController.userRoules.add(element.toString());
            });
          },
        );
      },
    );
  }

  void showListCapacities(
      BuildContext context, RolesCapacitiesController roleController) async {
    await showDialog(
      context: context,
      builder: (ctx) {
        return MultiSelectDialog(
          items: roleController.capacitiesList,
          initialValue: roleController.userCapacities,
          onConfirm: (values) {
            roleController.userCapacities.clear();
            values.forEach((element) {
              roleController.userCapacities.add(element.toString());
            });
          },
        );
      },
    );
  }
}
