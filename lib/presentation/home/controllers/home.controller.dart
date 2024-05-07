import 'dart:convert';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

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

  RxList<DateTime?> selectedDate = [
    DateTime.now(),
  ].obs;

  void increment() => count.value++;

  showCalendar(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Card(
          margin: EdgeInsets.only(top: 200, bottom: 200, left: 10, right: 10),
          child: SizedBox(
            height: 400,
            width: 350,
            child: CalendarDatePicker2(
              config: CalendarDatePicker2Config(
                calendarType: CalendarDatePicker2Type.multi,
              ),
              value: selectedDate,
            ),
          ),
        );
      },
    );
  }

  Future<Position?> getLocation() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      return position;
    }
  }

  bool isInBatiment(Position position) {
    // Les limites du bâtiment (à titre d'exemple)
    double latitudeMin = 7.321458;
    double latitudeMax = 7.321639;
    double longitudeMin = 13.579270;
    double longitudeMax = 13.579477;

    // Vérifier si les coordonnées de l'utilisateur se trouvent à l'intérieur des limites du bâtiment
    if (position.latitude >= latitudeMin &&
        position.latitude <= latitudeMax &&
        position.longitude >= longitudeMin &&
        position.longitude <= longitudeMax) {
      return true; // L'utilisateur est à l'intérieur du bâtiment
    } else {
      return false; // L'utilisateur n'est pas à l'intérieur du bâtiment
    }
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
