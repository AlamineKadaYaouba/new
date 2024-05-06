import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:genesis/App/app_colors.dart';
import 'package:genesis/App/app_images.dart';
import 'package:genesis/App/validator.dart';
import 'package:genesis/Widgets/button.dart';
import 'package:genesis/infrastructure/navigation/routes.dart';

import 'package:get/get.dart';

import 'controllers/login.controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    LoginController loginController = Get.put(LoginController());
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: width > 400 ? 400 : width - 50,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  // width: width - 30,
                  margin: const EdgeInsets.only(top: 15),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.login),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Form(
                  key: loginController.key.value,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Center(
                      //   child: Image.asset(
                      //     AppImages.logo,
                      //     height: 80,
                      //   ),
                      // ),
                      const Text(
                        'Connectez-vous',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        child: TextFormField(
                          controller: loginController.login.value,
                          validator: Validator.required(),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: AppColors.red,
                              ),
                            ),
                            label: const Text("Login"),
                            suffixIcon: const Icon(
                              IconlyLight.profile,
                              color: AppColors.primary,
                            ),
                            hintText: 'Entrez votre login',
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Obx(
                        () => SizedBox(
                          child: TextFormField(
                            controller: loginController.password.value,
                            obscureText:
                                LoginController.isPasswordVisible.value,
                            validator: Validator.required(),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              label: const Text('Mot de passe'),
                              hintText: 'Mot de passe',
                              suffixIcon: IconButton(
                                onPressed: () =>
                                    loginController.changePasswordVisibility(),
                                icon: const Icon(
                                  IconlyLight.lock,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text("Mot de passe oublier"),
                      ),
                      const SizedBox(height: 10),
                      FButton(
                        height: 60,
                        stretch: true,
                        onPressed: () {
                          if (loginController.key.value.currentState!
                              .validate()) {
                            Get.offAllNamed(Routes.NAV_BAR);
                          }
                        },
                        child: const Text("Connexion"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
