import 'package:flutter/material.dart';
import 'package:genesis/App/app_colors.dart';
import 'package:genesis/App/app_sizes.dart';

// J'utilise cette fonction pour afficher un loading lorsque une action est en cours.
// elle prend en parametre le context de la page courrante
Future loading(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => Scaffold(
      body: Center(
        child: Container(
          height: 100,
          width: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                backgroundColor:
                    const Color.fromARGB(255, 241, 3, 83).withOpacity(0.4),
                valueColor:
                    const AlwaysStoppedAnimation<Color>(AppColors.primary),
              ),
              const SizedBox(width: 20),
              Text(
                "Chargement...",
                style: TextStyle(fontSize: AppSizes.title3),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
