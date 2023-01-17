import 'package:app_movie_by_imdb_api/components/appcolors.dart';
import 'package:app_movie_by_imdb_api/components/my_componenets.dart';
import 'package:app_movie_by_imdb_api/controllers/main_controller.dart';
import 'package:app_movie_by_imdb_api/gen/assets.gen.dart';
import 'package:app_movie_by_imdb_api/views/Authentication/login_screen.dart';
import 'package:app_movie_by_imdb_api/views/Authentication/signup_screen.dart';
import 'package:app_movie_by_imdb_api/views/single_movie_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final MainController mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Get.height * 0.20,
        ),
        CircleAvatar(
          backgroundImage: AssetImage(
            Assets.images.avatar.path,
          ),
          minRadius: 50.0,
          maxRadius: 50.0,
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          // ignore: todo
          //TODO: inja name karbar ra az database migirim
          mainController.userName.value,
          style: Get.textTheme.headline4!.apply(
            color: AppColors.white,
          ),
        ),
        Divider(
          color: AppColors.white.withAlpha(100),
          indent: Get.width * .10,
          endIndent: Get.width * .10,
        ),
        Visibility(
          visible: mainController.userName.value == "guest" ? true : false,
          replacement: Text(
            // ignore: todo
            //TODO: inja name karbar ra az database migirim
            'logout'.tr,
            style: Get.textTheme.headline4!.apply(
              color: AppColors.white,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(LoginScreen());
                },
                child: Text(
                  // ignore: todo
                  //TODO: inja name karbar ra az database migirim
                  'login'.tr,
                  style: Get.textTheme.headline4!.apply(
                    color: AppColors.white,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(SignUpScreen());
                },
                child: Text(
                  // ignore: todo
                  //TODO: inja name karbar ra az database migirim
                  'signup'.tr,
                  style: Get.textTheme.headline4!.apply(
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
