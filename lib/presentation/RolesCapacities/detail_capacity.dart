import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:genesis/App/app_colors.dart';
import 'package:genesis/App/app_sizes.dart';
import 'package:genesis/Widgets/button.dart';
import 'package:genesis/models/capacity/capacity_model.dart';
import 'package:genesis/presentation/RolesCapacities/controllers/roles_capacities.controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class DetailCapacity extends GetView<RolesCapacitiesController> {
  DetailCapacity({Key? key, required this.capacity}) : super(key: key);
  Capacity capacity;

  @override
  Widget build(BuildContext context) {
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
                      'Modifier la capacité',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      child: TextFormField(
                        initialValue: capacity.name,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: AppColors.red,
                            ),
                          ),
                          label: const Text("Capacité"),
                          suffixIcon: const Icon(
                            IconlyLight.profile,
                            color: AppColors.primary,
                          ),
                          hintText: 'Intitulé de la capacité',
                        ),
                        onChanged: (value) {
                          capacity.name = value;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      child: TextFormField(
                        initialValue: capacity.description,
                        maxLines: 4,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: AppColors.red,
                            ),
                          ),
                          label: const Text("Capacité"),
                          hintText: 'Intitulé de la capacité',
                        ),
                        onChanged: (value) {
                          capacity.description = value;
                        },
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
