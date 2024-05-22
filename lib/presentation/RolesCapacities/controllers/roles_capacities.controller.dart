import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genesis/App/app_colors.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:permission_handler/permission_handler.dart';

class RolesCapacitiesController extends GetxController {
  //TODO: Implement RolesCapacitiesController

//  Variable pour l'ajout d'une capacité
  Rx<GlobalKey<FormState>> capacityForm = GlobalKey<FormState>().obs;
  Rx<TextEditingController> capacity = TextEditingController().obs;
  Rx<TextEditingController> capacityDescription = TextEditingController().obs;

//Variable pour l'enregristrement d'un Rôle
  Rx<GlobalKey<FormState>> roulesForm = GlobalKey<FormState>().obs;
  Rx<TextEditingController> roles = TextEditingController().obs;
  List<String> roleCapacities = [];
  RxString rolesLevel = "Aucune".obs;

//Variable pour l'enregristrement d'un utilisateur
  Rx<GlobalKey<FormState>> usersForm = GlobalKey<FormState>().obs;
  Rx<TextEditingController> phone = TextEditingController().obs;
  Rx<TextEditingController> workspace = TextEditingController().obs;
  Rx<TextEditingController> email = TextEditingController().obs;
  Rx<TextEditingController> division = TextEditingController().obs;
  Rx<TextEditingController> lastName = TextEditingController().obs;
  Rx<TextEditingController> firstName = TextEditingController().obs;
  List<String> userRoules = [];
  List<String> userCapacities = [];

  //Variable pour l'enregristrement d'un lieu de services
  Rx<GlobalKey<FormState>> workplaceForm = GlobalKey<FormState>().obs;
  Rx<TextEditingController> workplaceTitle = TextEditingController().obs;
  Rx<TextEditingController> workplaceDepartment = TextEditingController().obs;
  Rx<TextEditingController> workplaceDistrict = TextEditingController().obs;
  Rx<TextEditingController> workplaceCity = TextEditingController().obs;
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  RxDouble altitude = 0.0.obs;

//  Variable pour l'ajout d'une division
  Rx<GlobalKey<FormState>> divisionForm = GlobalKey<FormState>().obs;
  Rx<TextEditingController> divisionName = TextEditingController().obs;
  Rx<TextEditingController> divisionDescription = TextEditingController().obs;

//  Variable pour l'ajout d'une division
  Rx<GlobalKey<FormState>> departmentForm = GlobalKey<FormState>().obs;
  Rx<TextEditingController> departmentName = TextEditingController().obs;

// Liste des éléments a recupéré pour coté bd
  List<String> levelList = ["N+0", "N+5", "N+15", "N+25", "N+35", "N+45"];
  List<MultiSelectItem> rolesList = List.generate(
    10,
    (index) => MultiSelectItem('Role $index', 'Role $index'),
  );
  List<MultiSelectItem> capacitiesList = List.generate(
    10,
    (index) => MultiSelectItem('Capacité $index', 'Capacité $index'),
  );
  List<String> superviseurList = [" 1", " 2", " 3", " 4", " 5", " 6"];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  Future getLocation() async {
    await Geolocator.requestPermission();

    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(
        msg: "Veuillez activer votre localisation et reéssayer",
        backgroundColor: AppColors.error,
        textColor: AppColors.white,
      );
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(
          msg: "Permission refusée",
          backgroundColor: AppColors.error,
          textColor: AppColors.white,
        );
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(
        msg: "Permission refusée",
        backgroundColor: AppColors.error,
        textColor: AppColors.white,
      );
      return;
    }
    try {
      Position position = await Geolocator.getCurrentPosition();

      latitude.value = position.latitude;
      longitude.value = position.longitude;
      altitude.value = position.altitude;
    } catch (e) {}
    return;
  }
}
