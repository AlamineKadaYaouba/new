// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:genesis/App/app_colors.dart';
import 'package:genesis/App/app_sizes.dart';
import 'package:genesis/App/validator.dart';
import 'package:genesis/Widgets/CircularButtom.dart';
import 'package:genesis/Widgets/button.dart';
import 'package:genesis/models/role/role_model.dart';
import 'package:genesis/presentation/RolesCapacities/controllers/roles_capacities.controller.dart';
import 'package:get/get.dart';

class AddServicePlace extends GetView<RolesCapacitiesController> {
  AddServicePlace({super.key, this.role});
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
                height: 500,
                width: Get.width < AppSizes.tablet1 ? Get.width - 10 : 450,
                child: Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  elevation: 4,
                  child: Form(
                    key: roleController.workplaceForm.value,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Ajouter un lieu de service',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            child: TextFormField(
                              controller: roleController.workplaceTitle.value,
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
                                  IconlyLight.profile,
                                  color: AppColors.primary,
                                ),
                                hintText: 'NOm',
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
                                  value: "Département $value",
                                  child: Text(
                                    "Département $value",
                                    style: TextStyle(fontSize: AppSizes.title1),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                roleController.workplaceDepartment.value.text =
                                    value.toString();
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: AppColors.red,
                                  ),
                                ),
                                label: const Text("Département"),
                                hintText: 'Département',
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            child: TextFormField(
                              controller: roleController.workplaceCity.value,
                              keyboardType: TextInputType.phone,
                              validator: Validator.required(),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: AppColors.red,
                                  ),
                                ),
                                label: const Text("Ville"),
                                suffixIcon: const Icon(
                                  Icons.location_city,
                                  color: AppColors.primary,
                                ),
                                hintText: 'Ville',
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            child: TextFormField(
                              controller:
                                  roleController.workplaceDistrict.value,
                              validator: Validator.required(),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: AppColors.red,
                                  ),
                                ),
                                label: const Text("Quartier"),
                                suffixIcon: const Icon(
                                  Icons.location_city,
                                  color: AppColors.primary,
                                ),
                                hintText: 'Quartier',
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              CircularBottom(
                                radius: 10,
                                color: AppColors.primary,
                                height: 50,
                                width: 50,
                                icon: const Icon(
                                  Icons.location_on_rounded,
                                  color: AppColors.white,
                                  size: 30,
                                ),
                                onPressed: () => roleController.getLocation(),
                              ),
                              const SizedBox(width: 20),
                              Obx(
                                () => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Obx(
                                      () => Text(
                                          "Latitude : ${roleController.latitude.value}"),
                                    ),
                                    Text(
                                        "Longitude : ${roleController.longitude.value}"),
                                    Text(
                                        "Altitude : ${roleController.altitude.value}"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
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
