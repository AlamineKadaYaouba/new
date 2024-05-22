import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genesis/App/app_colors.dart';
import 'package:genesis/Widgets/showProgress.dart';
import 'package:genesis/presentation/dailyTask/daily_task.screen.dart';
import 'package:genesis/presentation/home/home.screen.dart';
import 'package:genesis/presentation/screens.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class NavBarController extends GetxController {
  //TODO: Implement NavBarController

  final index = 1.obs;
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  RxDouble altitude = 0.0.obs;

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

  void setIndex(int value) => index.value = value;
// cette fonction retourne une vue en fonction de l'index de la barre de navigation
  Widget showPage(double width) {
    if (index.value == 1) {
      // return const HomeScreen();
      return const DashboardScreen();
    } else if (index.value == 2) {
      return const HomeScreen();
    } else if (index.value == 3) {
      return const DailyTaskScreen();
    } else if (index.value == 4) {
      return const RolesCapacitiesScreen();
    } else {
      return const ProfileScreen();
    }
  }

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
    print(permission.toString());
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
    // try {
    Position position = await Geolocator.getCurrentPosition();

    latitude.value = position.latitude;
    longitude.value = position.longitude;
    altitude.value = position.altitude;
    // } catch (e) {}
    return;
  }

  scanQr(BuildContext context) async {
    showProgress(context);
    await getLocation();
    try {
      var scannedQrcode = await FlutterBarcodeScanner.scanBarcode(
        '#f0f0f0',
        'Cancel',
        true,
        ScanMode.QR,
      );
      if (scannedQrcode != null) {
        print(scannedQrcode);
        var ddd = scannedQrcode;
      }
      Get.back();
    } on PlatformException {
      Get.snackbar(
        'Error',
        'Something went wrong',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.back();
    }
  }
}
