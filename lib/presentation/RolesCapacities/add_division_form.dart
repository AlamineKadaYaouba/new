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

class AddDivision extends GetView<RolesCapacitiesController> {
  AddDivision({super.key, this.role});
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
                    key: roleController.divisionForm.value,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Ajouter une division',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            child: TextFormField(
                              controller: roleController.divisionName.value,
                              validator: Validator.required(),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: AppColors.red,
                                  ),
                                ),
                                label: const Text("Nom"),
                                suffixIcon: const Icon(
                                  Icons.short_text_rounded,
                                  color: AppColors.primary,
                                ),
                                hintText: 'Intitulé de la division',
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            child: TextFormField(
                              maxLines: 4,
                              controller:
                                  roleController.divisionDescription.value,
                              validator: Validator.required(),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: AppColors.red,
                                  ),
                                ),
                                label: const Text("Description"),
                                hintText: 'Descriptin de la division',
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
}
