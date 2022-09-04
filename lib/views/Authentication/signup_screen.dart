import 'package:app_movie_by_imdb_api/components/appcolors.dart';
import 'package:app_movie_by_imdb_api/components/my_componenets.dart';
import 'package:app_movie_by_imdb_api/controllers/authentication_controller.dart';
import 'package:app_movie_by_imdb_api/controllers/main_controller.dart';
import 'package:app_movie_by_imdb_api/gen/assets.gen.dart';
import 'package:app_movie_by_imdb_api/views/Authentication/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
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
                height: Get.height / 8,
              ),
              //image login
              Image.asset(
                Assets.images.signUp.path,
                // height: Get.height / 4,
                // width: Get.width / 2,
                scale: 3,
              ),
              const SizedBox(
                height: 40,
              ),
              //email
              Obx(
                () => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: authenticationController.textEmailController,
                    style: Get.textTheme.headline1!.apply(
                      color: AppColors.white,
                    ),
                    onChanged: (value) {
                      authenticationController.cheackEmail.value =
                          GetUtils.isEmail(value);
                    },
                    decoration: InputDecoration(
                      suffix: authenticationController.cheackEmail.value
                          ? const Icon(
                              Icons.check_rounded,
                              color: Colors.green,
                            )
                          : const Icon(
                              Icons.close_rounded,
                              color: Colors.red,
                            ),
                      filled: true,
                      fillColor: AppColors.backgrandNavColor,
                      hintText: 'email'.tr,
                      hintStyle: Get.textTheme.headline1!.apply(
                        color: AppColors.white.withAlpha(100),
                      ),
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
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
              //log in
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      'login'.tr,
                      style: Get.textTheme.headline2!.apply(
                        color: AppColors.white.withAlpha(200),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width / 4,
                  ),
                  Obx(() => authenticationController.loadingSignUp.value
                      ? loading()
                      : const SizedBox.shrink()),
                ],
              ),
              // bottun log in
              costumiseElvatedButon(() {
                authenticationController.register();
              }, 'signup'.tr)
            ],
          ),
        ),
      ),
    );
  }
}
