import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:toast/toast.dart';

class ToastHelper {
  static void showToast(String msg, int time, Color bgColor, Color tColor) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      //timeInSecForIosWeb: time,
      backgroundColor: bgColor,
      textColor: tColor,
      fontSize: 16.0,
      //webPosition: 'left',
    );
  }
}
