import 'package:app_movie_by_imdb_api/components/appcolors.dart';
import 'package:app_movie_by_imdb_api/components/my_componenets.dart';
import 'package:app_movie_by_imdb_api/controllers/authentication_controller.dart';
import 'package:app_movie_by_imdb_api/gen/assets.gen.dart';
import 'package:app_movie_by_imdb_api/views/Authentication/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final AuthenticationController authenticationController =
      Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    authenticationController.clearEditeText();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Get.height / 6,
              ),
              //image login
              Image.asset(
                Assets.images.login.path,
                // height: Get.height / 4,
                // width: Get.width / 2,
                scale: 3,
              ),
              const SizedBox(
                height: 40,
              ),
              //user name
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: costumiseInput(
                  controller: authenticationController.textUserNameController,
                  hintText: 'user_name'.tr,
                  icon: Icons.supervised_user_circle,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: costumiseInput(
                  controller: authenticationController.textPasswordController,
                  hintText: 'password'.tr,
                  icon: Icons.password_rounded,
                ),
              ),
              //sign up
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => SignUpScreen());
                    },
                    child: Text(
                      'signup'.tr,
                      style: Get.textTheme.headline2!.apply(
                        color: AppColors.white.withAlpha(200),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width / 4,
                  ),
                  Obx(() => authenticationController.loadingLogIn.value
                      ? loading()
                      : const SizedBox.shrink()),
                ],
              ),
              // bottun log in
              costumiseElvatedButon(() {
                authenticationController.logIn();
              }, 'login'.tr)
            ],
          ),
        ),
      ),
    );
  }
}
