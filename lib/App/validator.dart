import 'package:flutter/material.dart';
import 'package:get/get.dart';

typedef Validatorable = String? Function(String? value)?;
typedef Validators = List<Validatorable>;

class Validator {
  Validator._();
  static Validatorable required({String? msg}) {
    return (String? value) {
      return value!.isEmpty ? (msg ?? 'Ce champ est requis') : null;
    };
  }

  static Validatorable email({String? msg}) {
    return (String? value) {
      if (value!.trim().isEmpty) return null;
      return RegExp(
                  r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$")
              .hasMatch(value.trim())
          ? null
          : (msg ?? 'sign-errorEmail'.tr);
    };
  }

  static Validatorable confirmPassword(
      {String? msg, required TextEditingController controller}) {
    return (String? value) {
      if (value != controller.text) {
        return msg ?? 'Les mots de passes sont différents';
      }
      return null;
    };
  }

  static Validatorable password({String? msg}) {
    return (String? password) {
      // bool isPasswordContentLetter = RegExp(r'[a-zA-Z]').hasMatch(password!);
      // bool isPasswordContentNumber = RegExp(r'\d').hasMatch(password);
      // bool isPasswordContentSymbole = RegExp(r'[\W_]').hasMatch(password);
      return password!.length < 6
          // ||
          //     !isPasswordContentLetter ||
          //     !isPasswordContentNumber ||
          //     !isPasswordContentSymbole
          ? 'sign-mdpLenght'.tr
          : null;
    };
  }

  static String formatDate(DateTime date) {
    String day = date.day.toString().padLeft(2, '0');
    String month = date.month.toString().padLeft(2, '0');
    String year = date.year.toString();
    return '$day-$month-$year';
  }
}
