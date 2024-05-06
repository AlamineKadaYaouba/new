import 'package:flutter/material.dart';
import 'package:genesis/App/app_images.dart';
import 'package:genesis/App/app_sizes.dart';
import 'package:genesis/Widgets/CListTile.dart';

import 'package:get/get.dart';

import 'controllers/user_list.controller.dart';

class UserListScreen extends GetView<UserListController> {
  const UserListScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = Get.height;
    double width = Get.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste d\'utilisateur'),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          height: height,
          width: width,
          child: Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const CircleAvatar(
                    radius: 26,
                    backgroundImage: AssetImage(AppImages.login),
                  ),
                  title: Text(
                    "Maurel Meli Tikeng",
                    style: TextStyle(fontSize: AppSizes.title2),
                  ),
                  subtitle: const Text("Stagriaire Proffessionnel"),
                  trailing: Text(
                    index % 2 == 0
                        ? "En poste"
                        : index % 3 == 0
                            ? "En pause"
                            : "Rentré",
                    style: TextStyle(
                      color: index % 2 == 0
                          ? Colors.green
                          : index % 3 == 0
                              ? Colors.orange
                              : Colors.red,
                    ),
                  ),
                  onTap: () => null,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
