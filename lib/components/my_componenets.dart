import 'package:app_movie_by_imdb_api/components/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

Widget loading() {
  return const SpinKitThreeBounce(
    color: AppColors.white,
    size: 30.0,
  );
}

Widget costumiseInput(
    {required TextEditingController controller,
    required String hintText,
    required IconData icon}) {
  return TextField(
    controller: controller,
    style: Get.textTheme.headline1!.apply(
      color: AppColors.white,
    ),
    decoration: InputDecoration(
      filled: true,
      fillColor: AppColors.backgrandNavColor,
      hintText: hintText,
      hintStyle: Get.textTheme.headline1!.apply(
        color: AppColors.white.withAlpha(100),
      ),
      prefixIcon: Icon(
        icon,
        color: AppColors.white,
      ),
    ),
  );
}
