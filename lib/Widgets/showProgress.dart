import 'package:flutter/material.dart';
import 'package:genesis/App/app_colors.dart';

showProgress(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return const AlertDialog(
        content: Row(
          children: [
            SizedBox(
              height: 45,
              width: 45,
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            ),
            SizedBox(width: 15),
            Text("Chargement..."),
          ],
        ),
      );
    },
  );
}
