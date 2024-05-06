// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:genesis/App/app_colors.dart';
import 'package:genesis/App/app_images.dart';
import 'package:genesis/App/app_sizes.dart';
import 'package:genesis/App/validator.dart';
import 'package:genesis/Widgets/CListTile.dart';
import 'package:genesis/Widgets/button.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

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
      backgroundColor: AppColors.background,
      body: Center(
        child: SizedBox(
          height: height,
          width: width - 10,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FButton(
                        height: 50,
                        width: 160,
                        text: 'Liste des rôles',
                        onPressed: () {
                          showRoulesBottomSheet(context);
                        },
                      ),
                      FButton(
                        height: 50,
                        width: 160,
                        text: 'Liste des capacités',
                        onPressed: () {
                          showCapacityBottomSheet(context);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      SizedBox(
                        height: height / 2.2,
                        width: width < AppSizes.tablet1 ? width - 10 : 805,
                        child: Card(
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Text(
                                  'Liste des collaborateurs',
                                  style: TextStyle(
                                    fontSize: AppSizes.title4,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: 10,
                                    itemBuilder: (context, index) {
                                      return CListTile.userListTile();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 380,
                            width: width < AppSizes.tablet1 ? width - 10 : 400,
                            child: Card(
                              elevation: 4,
                              child: Form(
                                key: roleController.capacityForm.value,
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Ajouter un roles',
                                        style: TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      SizedBox(
                                        child: TextFormField(
                                          controller:
                                              roleController.roles.value,
                                          validator: Validator.required(),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
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
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          onChanged: (String? value) {
                                            roleController.rolesLevel.value =
                                                value.toString();
                                          },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
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
                          SizedBox(
                            height: 380,
                            width: width < AppSizes.tablet1 ? width - 10 : 400,
                            child: Card(
                              elevation: 4,
                              child: Form(
                                key: roleController.roulesForm.value,
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Ajouter une capacité',
                                        style: TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      SizedBox(
                                        child: TextFormField(
                                          controller:
                                              roleController.roles.value,
                                          validator: Validator.required(),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
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
                      SizedBox(
                        height: 760,
                        width: width < AppSizes.tablet1 ? width - 10 : 400,
                        child: Card(
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
                                  const SizedBox(height: 20),
                                  SizedBox(
                                    child: TextFormField(
                                      controller: roleController.lastName.value,
                                      validator: Validator.required(),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                  const SizedBox(height: 20),
                                  SizedBox(
                                    child: TextFormField(
                                      controller:
                                          roleController.firstName.value,
                                      validator: Validator.required(),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                  const SizedBox(height: 20),
                                  SizedBox(
                                    child: TextFormField(
                                      controller: roleController.roles.value,
                                      validator: Validator.required(),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (String? value) {
                                        roleController.superviseur.value.text =
                                            value.toString();
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            color: AppColors.red,
                                          ),
                                        ),
                                        label: const Text("Superviseur"),
                                        hintText: 'Superviseur',
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      FButton(
                                        color: AppColors.white,
                                        border: true,
                                        textColor: AppColors.black,
                                        borderColor: AppColors.primary,
                                        text: "Ajouter un role",
                                        onPressed: () => showListRoles(
                                            context, roleController),
                                      ),
                                      FButton(
                                        color: AppColors.white,
                                        border: true,
                                        borderColor: AppColors.primary,
                                        textColor: AppColors.black,
                                        text: "Ajouter une capacité",
                                        onPressed: () => showListCapacities(
                                            context, roleController),
                                      ),
                                    ],
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
                ],
              ),
            ),
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
          initialValue: roleController.rolesListSelected,
          onConfirm: (values) {
            roleController.rolesListSelected.clear();
            values.forEach((element) {
              roleController.rolesListSelected.add(element.toString());
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
          items: roleController.rolesList,
          initialValue: roleController.capacityListSelected,
          onConfirm: (values) {
            roleController.capacityListSelected.clear();
            values.forEach((element) {
              roleController.capacityListSelected.add(element.toString());
            });
          },
        );
      },
    );
  }

  showRoulesBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      context: context,
      builder: (context) {
        return SizedBox(
          height: 350,
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: ListTile(
                  title: Text("Role $index"),
                  trailing: const Icon(Icons.arrow_forward_ios_sharp),
                  onTap: () => null,
                ),
              );
            },
          ),
        );
      },
    );
  }

  showCapacityBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      context: context,
      builder: (context) {
        return SizedBox(
          height: 350,
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: ListTile(
                  title: Text("Capacité $index"),
                  trailing: const Icon(Icons.arrow_forward_ios_sharp),
                  onTap: () => null,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
