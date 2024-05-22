import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:genesis/App/app_colors.dart';
import 'package:genesis/App/app_images.dart';
import 'package:genesis/App/app_sizes.dart';

class CListTile {
  static Widget userListTile() {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: ListTile(
            leading: const CircleAvatar(
              radius: 22,
              backgroundImage: AssetImage(AppImages.login),
            ),
            title: Text(
              "Maurel Meli Tikeng",
              style: TextStyle(fontSize: AppSizes.title1),
            ),
            subtitle: Text(
              "Stagriaire Pro",
              style: TextStyle(
                fontSize: AppSizes.bodyText + 2,
                color: AppColors.primary,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20,
            ),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
