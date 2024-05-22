import 'package:flutter/material.dart';
import 'package:genesis/presentation/dailyTask/daily_task.screen.dart';

import 'package:get/get.dart';

import '../../config.dart';
import '../../presentation/screens.dart';
import 'bindings/controllers/controllers_bindings.dart';
import 'routes.dart';

class EnvironmentsBadge extends StatelessWidget {
  final Widget child;
  EnvironmentsBadge({required this.child});
  @override
  Widget build(BuildContext context) {
    var env = ConfigEnvironments.getEnvironments()['env'];
    return env != Environments.PRODUCTION
        ? Banner(
            location: BannerLocation.topStart,
            message: env!,
            color: env == Environments.QAS ? Colors.blue : Colors.purple,
            child: child,
          )
        : SizedBox(child: child);
  }
}

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
      binding: HomeControllerBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginScreen(),
      binding: LoginControllerBinding(),
    ),
    GetPage(
      name: Routes.GET_STARTED,
      page: () => const GetStartedScreen(),
      binding: GetStartedControllerBinding(),
    ),
    GetPage(
      name: Routes.NAV_BAR,
      page: () => const NavBarScreen(),
      binding: NavBarControllerBinding(),
    ),
    GetPage(
      name: Routes.SPLASH,
      page: () => const SpashScreen(),
      binding: SplashControllerBinding(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => const ProfileScreen(),
      binding: ProfileControllerBinding(),
    ),
    GetPage(
      name: Routes.ROLES_CAPACITIES,
      page: () => const RolesCapacitiesScreen(),
      binding: RolesCapacitiesControllerBinding(),
    ),
    GetPage(
      name: Routes.DASHBOARD,
      page: () => const DashboardScreen(),
      binding: DashboardControllerBinding(),
    ),
    GetPage(
      name: Routes.USER_LIST,
      page: () => const UserListScreen(),
      binding: UserListControllerBinding(),
    ),
    GetPage(
      name: Routes.DETAIL_USER,
      page: () => const DetailUserScreen(),
      binding: DetailUserControllerBinding(),
    ),
    GetPage(
      name: Routes.DAILY_TASK,
      page: () => const DailyTaskScreen(),
      binding: DailyTaskControllerBinding(),
    ),
  ];
}
