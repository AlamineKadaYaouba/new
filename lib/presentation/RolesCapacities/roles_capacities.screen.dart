// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:genesis/App/app_colors.dart';
import 'package:genesis/App/app_sizes.dart';
import 'package:genesis/Widgets/button.dart';
import 'package:genesis/models/capacity/capacity_model.dart';
import 'package:genesis/presentation/RolesCapacities/add_capacity_form.dart';
import 'package:genesis/presentation/RolesCapacities/add_department.dart';
import 'package:genesis/presentation/RolesCapacities/add_division_form.dart';
import 'package:genesis/presentation/RolesCapacities/add_role_form.dart';
import 'package:genesis/presentation/RolesCapacities/add_service_place.dart';
import 'package:genesis/presentation/RolesCapacities/add_user_form.dart';
import 'package:genesis/presentation/RolesCapacities/detail_capacity.dart';
import 'package:genesis/presentation/RolesCapacities/list_capacity.dart';
import 'package:genesis/presentation/RolesCapacities/list_role.dart';
import 'package:genesis/presentation/RolesCapacities/list_user.dart';

import 'package:get/get.dart';

import 'controllers/roles_capacities.controller.dart';

class RolesCapacitiesScreen extends GetView<RolesCapacitiesController> {
  const RolesCapacitiesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    RolesCapacitiesController roleController =
        Get.put(RolesCapacitiesController());
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor: AppColors.background,
      body: Center(
        child: SizedBox(
          height: height,
          width: width - 10,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Center(
                child: Wrap(
                  runSpacing: 10,
                  children: [
                    custumCard(
                      title: "Utilisateurs",
                      onAddTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddUserForm(),
                        ),
                      ),
                      onListTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ListUser(),
                        ),
                      ),
                    ),
                    custumCard(
                      title: "Rôles",
                      onAddTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddRoleForm(),
                        ),
                      ),
                      onListTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ListRoles(),
                        ),
                      ),
                    ),
                    custumCard(
                      title: "Capacités",
                      onAddTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddCapacityForm(),
                        ),
                      ),
                      onListTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ListCapacities(),
                        ),
                      ),
                    ),
                    custumCard(
                      title: "Lieux de service",
                      onAddTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddServicePlace(),
                        ),
                      ),
                      onListTap: () {},
                    ),
                    custumCard(
                      title: "Division",
                      onAddTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddDivision(),
                        ),
                      ),
                      onListTap: () {},
                    ),
                    custumCard(
                      title: "Département",
                      onAddTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddDepartment(),
                        ),
                      ),
                      onListTap: () {},
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //   children: [
                    //     FButton(
                    //       height: 50,
                    //       width: 160,
                    //       text: 'Liste des rôles',
                    //       onPressed: () {
                    //         // showRoulesBottomSheet(context);
                    //       },
                    //     ),
                    //     FButton(
                    //       height: 50,
                    //       width: 160,
                    //       text: 'Liste des capacités',
                    //       onPressed: () {
                    //         showCapacityBottomSheet(context);
                    //       },
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget custumCard({
    required String title,
    required VoidCallback onAddTap,
    required VoidCallback onListTap,
    Color? color,
  }) {
    return Card(
      color: color,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      borderOnForeground: true,
      child: SizedBox(
        height: Get.width <= AppSizes.tablet1 ? 100 : 120,
        width: Get.width <= AppSizes.tablet1
            ? 380
            : Get.width >= AppSizes.tablet1 && Get.width <= AppSizes.tablet2
                ? (Get.width - 30) / 2
                : (Get.width - 30) / 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: AppSizes.title4,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FButton(
                  border: true,
                  borderColor: AppColors.primary,
                  color: Colors.white,
                  textColor: AppColors.black,
                  elevation: 3,
                  height: 45,
                  width: 130,
                  text: "Ajouter",
                  onPressed: onAddTap,
                ),
                FButton(
                  border: true,
                  borderColor: AppColors.primary,
                  color: Colors.white,
                  textColor: AppColors.black,
                  elevation: 3,
                  height: 45,
                  width: 130,
                  text: "Liste",
                  onPressed: onListTap,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
