import 'package:flutter/material.dart';
import 'package:genesis/App/app_colors.dart';

// J'utilise cette fonction pour afficher un loading lorsque une action est en cours.
// elle prend en parametre le context de la page courrante
Widget loading(BuildContext context) {
  return Container(
    color: AppColors.secondary.withOpacity(0.3),
    child: Center(
      child: CircularProgressIndicator(
        backgroundColor: const Color.fromARGB(255, 241, 3, 83).withOpacity(0.4),
        valueColor:
            AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
      ),
    ),
  );
}
