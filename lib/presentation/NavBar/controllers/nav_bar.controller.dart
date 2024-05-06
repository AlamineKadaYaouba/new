import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:genesis/presentation/home/home.screen.dart';
import 'package:genesis/presentation/home/homeTablet.screen%20.dart';
import 'package:genesis/presentation/screens.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class NavBarController extends GetxController {
  //TODO: Implement NavBarController

  final index = 1.obs;
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
      return width < 700 ? const HomeScreen() : const HomeTabletScreen();
    } else if (index.value == 4) {
      return const RolesCapacitiesScreen();
    } else {
      return const ProfileScreen();
    }
  }

  Future<Position?> getLocation() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      return position;
    }
    return null;
  }

  scanQr() async {
    Position? userLocation = await getLocation();
    try {
      var scannedQrcode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );
      if (scannedQrcode != null) {
        print(scannedQrcode);
        var ddd = jsonDecode(scannedQrcode);
      }
    } on PlatformException {
      Get.snackbar(
        'Error',
        'Something went wrong',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }
}
