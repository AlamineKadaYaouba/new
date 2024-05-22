import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:genesis/App/app_colors.dart';
import 'package:genesis/App/app_images.dart';
import 'package:genesis/App/app_sizes.dart';
import 'package:genesis/infrastructure/navigation/routes.dart';
import 'package:genesis/infrastructure/theme/ThemeController.dart';

import 'package:get/get.dart';

import 'controllers/nav_bar.controller.dart';

class NavBarScreen extends GetView<NavBarController> {
  const NavBarScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    NavBarController navigationBarCotroller = Get.put(NavBarController());
    ThemeController themeController = Get.put(ThemeController());
    print(width);
    return Scaffold(
      drawer:
          width < AppSizes.tablet2 ? myDrawer(navigationBarCotroller) : null,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Genesis'),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.find<ThemeController>().changeTheme();
                  },
                  icon: Obx(() => Icon(themeController.isDark.value
                      ? Icons.light_mode_outlined
                      : Icons.dark_mode_outlined)),
                ),
                IconButton(
                  onPressed: () => null,
                  icon: const Icon(IconlyLight.notification),
                ),
              ],
            )
          ],
        ),
      ),
      body: Row(
        children: [
          Container(
              // flex: AppSizes.width < AppSizes.tablet2 ? 0 : 1,
              width: AppSizes.width < AppSizes.tablet1 ? 0 : 260,
              child: AppSizes.width < AppSizes.tablet2
                  ? Container()
                  : myDrawer(navigationBarCotroller)),
          Expanded(
            flex: AppSizes.width < AppSizes.tablet2 ? 1 : 3,
            child: Obx(
              () => navigationBarCotroller.showPage(width),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          animatedIconTheme: const IconThemeData(size: 22.0),
          closeManually: false,
          curve: Curves.bounceIn,
          overlayColor: Colors.black,
          overlayOpacity: 0.5,
          spacing: 12.0,
          spaceBetweenChildren: 12.0,
          children: [
            SpeedDialChild(
              child: const Icon(
                Icons.qr_code_scanner_rounded,
                color: AppColors.white,
              ),
              backgroundColor: Colors.blue,
              label: 'Scan',
              labelStyle: const TextStyle(fontSize: 16.0),
              onTap: () => navigationBarCotroller.scanQr(context),
            ),
            SpeedDialChild(
              child: const Icon(
                Icons.warning,
                color: AppColors.white,
              ),
              backgroundColor: Colors.red,
              label: 'Incident',
              labelStyle: const TextStyle(fontSize: 16.0),
              onTap: () => print('See Incident'),
            ),
            SpeedDialChild(
              child: const Icon(
                IconlyLight.ticket,
                color: AppColors.white,
              ),
              backgroundColor: Colors.green,
              label: 'Ticket',
              labelStyle: const TextStyle(fontSize: 16.0),
              onTap: () => print('See Ticket'),
            ),
            SpeedDialChild(
              child: const Icon(
                Icons.person_pin_circle_outlined,
                color: AppColors.white,
              ),
              backgroundColor: Colors.purple,
              label: 'Utilisateur',
              labelStyle: const TextStyle(fontSize: 16.0),
              onTap: () => Get.toNamed(Routes.USER_LIST),
            ),
            SpeedDialChild(
              child: const Icon(
                Icons.calendar_month_rounded,
                color: AppColors.white,
              ),
              backgroundColor: Colors.cyan,
              label: 'Faire le point',
              labelStyle: const TextStyle(fontSize: 16.0),
              onTap: () => Get.toNamed(Routes.DAILY_TASK),
            ),
          ],
        ),
        onPressed: () {},
      ),
    );
  }

  Widget myDrawer(NavBarController navigationBarCotroller) {
    return Drawer(
      elevation: 5,
      width: 300,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                const SizedBox(height: 20),
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColors.primary,
                  backgroundImage: AssetImage(AppImages.login),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Arnauld Meli Tikeng",
                  style: TextStyle(fontSize: 18),
                ),
                const Text(
                  "Le rôle ici",
                  style: TextStyle(fontSize: 16, color: AppColors.primary),
                ),
                const Divider(endIndent: 30, indent: 30),
                Obx(
                  () => Column(
                    children: [
                      Stack(
                        children: [
                          if (navigationBarCotroller.index.value == 1)
                            Container(
                              height: 55,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: const BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(25),
                                ),
                              ),
                            ),
                          ListTile(
                            textColor: navigationBarCotroller.index.value == 1
                                ? AppColors.white
                                : null,
                            iconColor: navigationBarCotroller.index.value == 1
                                ? AppColors.white
                                : null,
                            leading: const Icon(IconlyLight.activity),
                            title: Text(
                                style: TextStyle(fontSize: AppSizes.title2),
                                "Dashboard"),
                            onTap: () => navigationBarCotroller.setIndex(1),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          if (navigationBarCotroller.index.value == 2)
                            Container(
                              height: 55,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: const BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(25),
                                ),
                              ),
                            ),
                          ListTile(
                            textColor: navigationBarCotroller.index.value == 2
                                ? AppColors.white
                                : null,
                            iconColor: navigationBarCotroller.index.value == 2
                                ? AppColors.white
                                : null,
                            leading: const Icon(Icons.qr_code_2_rounded),
                            title: Text(
                                style: TextStyle(fontSize: AppSizes.title2),
                                "Gestion des présences"),
                            onTap: () => navigationBarCotroller.setIndex(2),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          if (navigationBarCotroller.index.value == 3)
                            Container(
                              height: 55,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: const BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(25),
                                ),
                              ),
                            ),
                          ListTile(
                            textColor: navigationBarCotroller.index.value == 3
                                ? AppColors.white
                                : null,
                            iconColor: navigationBarCotroller.index.value == 3
                                ? AppColors.white
                                : null,
                            leading: const Icon(IconlyLight.paper),
                            title: Text(
                                style: TextStyle(fontSize: AppSizes.title2),
                                "Point journalier"),
                            onTap: () => navigationBarCotroller.setIndex(3),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          if (navigationBarCotroller.index.value == 4)
                            Container(
                              height: 55,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: const BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(25),
                                ),
                              ),
                            ),
                          ListTile(
                            textColor: navigationBarCotroller.index.value == 4
                                ? AppColors.white
                                : null,
                            iconColor: navigationBarCotroller.index.value == 4
                                ? AppColors.white
                                : null,
                            leading:
                                const Icon(Icons.admin_panel_settings_outlined),
                            title: Text(
                                style: TextStyle(fontSize: AppSizes.title2),
                                "Roles et capacités"),
                            onTap: () => navigationBarCotroller.setIndex(4),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          if (navigationBarCotroller.index.value == 5)
                            Container(
                              height: 55,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: const BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(25),
                                ),
                              ),
                            ),
                          ListTile(
                            textColor: navigationBarCotroller.index.value == 5
                                ? AppColors.white
                                : null,
                            iconColor: navigationBarCotroller.index.value == 5
                                ? AppColors.white
                                : null,
                            leading: const Icon(Icons.checklist_rounded),
                            title: Text(
                                style: TextStyle(fontSize: AppSizes.title2),
                                "Gestion des objectifs"),
                            onTap: () => navigationBarCotroller.setIndex(5),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          if (navigationBarCotroller.index.value == 6)
                            Container(
                              height: 55,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: const BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(25),
                                ),
                              ),
                            ),
                          ListTile(
                            textColor: navigationBarCotroller.index.value == 6
                                ? AppColors.white
                                : null,
                            iconColor: navigationBarCotroller.index.value == 6
                                ? AppColors.white
                                : null,
                            leading: const Icon(IconlyLight.upload),
                            title: Text(
                                style: TextStyle(fontSize: AppSizes.title2),
                                "Mise en production"),
                            onTap: () => navigationBarCotroller.setIndex(6),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          if (navigationBarCotroller.index.value == 7)
                            Container(
                              height: 55,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: const BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(25),
                                ),
                              ),
                            ),
                          ListTile(
                            textColor: navigationBarCotroller.index.value == 7
                                ? AppColors.white
                                : null,
                            iconColor: navigationBarCotroller.index.value == 7
                                ? AppColors.white
                                : null,
                            leading: const Icon(IconlyLight.paperUpload),
                            title: Text(
                                style: TextStyle(fontSize: AppSizes.title2),
                                "Gestion des permission"),
                            onTap: () => navigationBarCotroller.setIndex(7),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          if (navigationBarCotroller.index.value == 8)
                            Container(
                              height: 55,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: const BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(25),
                                ),
                              ),
                            ),
                          ListTile(
                            textColor: navigationBarCotroller.index.value == 8
                                ? AppColors.white
                                : null,
                            iconColor: navigationBarCotroller.index.value == 8
                                ? AppColors.white
                                : null,
                            leading: const Icon(IconlyLight.closeSquare),
                            title: Text(
                                style: TextStyle(fontSize: AppSizes.title2),
                                "Gestion des Incidents"),
                            onTap: () => navigationBarCotroller.setIndex(8),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          if (navigationBarCotroller.index.value == 9)
                            Container(
                              height: 55,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: const BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(25),
                                ),
                              ),
                            ),
                          ListTile(
                            textColor: navigationBarCotroller.index.value == 9
                                ? AppColors.white
                                : null,
                            iconColor: navigationBarCotroller.index.value == 9
                                ? AppColors.white
                                : null,
                            leading: const Icon(Icons.task_alt_outlined),
                            title: Text(
                                style: TextStyle(fontSize: AppSizes.title2),
                                "Validation des procédures"),
                            onTap: () => navigationBarCotroller.setIndex(9),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          if (navigationBarCotroller.index.value == 10)
                            Container(
                              height: 55,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: const BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(25),
                                ),
                              ),
                            ),
                          ListTile(
                            textColor: navigationBarCotroller.index.value == 10
                                ? AppColors.white
                                : null,
                            iconColor: navigationBarCotroller.index.value == 10
                                ? AppColors.white
                                : null,
                            leading:
                                const Icon(Icons.thumb_down_off_alt_rounded),
                            title: Text(
                                style: TextStyle(fontSize: AppSizes.title2),
                                "Demande d'explication"),
                            onTap: () => navigationBarCotroller.setIndex(10),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
