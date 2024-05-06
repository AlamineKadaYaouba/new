// ignore_for_file: non_constant_identifier_names

import 'package:genesis/App/app_colors.dart';
import 'package:genesis/App/validator.dart';
import 'package:genesis/Widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';

// cette classe contient mes défferent boite de dialog.
// une pour les alert d'erreur, une pour les alertes de succes.
// chaque fonction prend en parametre le contexte de la page sur laquelle elle doit être affichée
class MyDialog {
  static GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  static void AlertErrorDialog(BuildContext context, String title, String msg) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          // icon: Icon(Icons.one_k),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline_sharp,
                color: Colors.red,
                size: 26,
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              const Icon(
                Icons.error_outline_sharp,
                color: Colors.red,
                size: 26,
              ),
            ],
          ),
          content: Text(msg),
          actions: [
            FButton(
              height: 40,
              width: 80,
              color: AppColors.primary,
              textColor: Colors.white,
              child: const Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  static void AlertSuccesDialog(
      BuildContext context, String title, String msg) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                IconlyBroken.tickSquare,
                color: Colors.green,
                size: 26,
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              const Icon(
                IconlyBroken.tickSquare,
                color: Colors.green,
                size: 26,
              ),
            ],
          ),
          content: Text(msg),
          actions: [
            FButton(
              height: 50,
              width: 80,
              color: AppColors.primary,
              textColor: Colors.white,
              child: const Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  static void EditEmailDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return SizedBox(
          width: MediaQuery.of(context).size.width - 30,
          child: AlertDialog(
            elevation: 6,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 10),
                Text(
                  'edit-email'.tr,
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            content: Form(
              key: emailKey,
              child: SizedBox(
                height: 55,
                child: TextFormField(
                  // controller: UserProfilController.emailEdit.value,
                  validator: Validator.email(),
                  decoration: InputDecoration(
                    filled: true,
                    label: Text('alert-enterValue'.tr),
                    fillColor: AppColors.background,
                    prefixIcon: const Icon(
                      IconlyLight.profile,
                      color: AppColors.primary,
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            actions: [
              FButton(
                  height: 50,
                  width: 80,
                  color: AppColors.primary,
                  textColor: Colors.white,
                  child: const Text('Ok'),
                  onPressed: () {}),
              FButton(
                height: 50,
                width: 100,
                color: AppColors.primary,
                textColor: Colors.white,
                child: const Text('Annuler'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      },
    );
  }
}
