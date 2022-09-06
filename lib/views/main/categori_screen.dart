import 'package:app_movie_by_imdb_api/components/appcolors.dart';
import 'package:app_movie_by_imdb_api/components/my_componenets.dart';
import 'package:app_movie_by_imdb_api/controllers/main_controller.dart';
import 'package:app_movie_by_imdb_api/views/single_categori_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CtegoriScreen extends StatelessWidget {
  CtegoriScreen({Key? key}) : super(key: key);
  final MainController mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //back icon
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.arrow_back_rounded,
            color: AppColors.white,
            size: 32,
          ),
        ),
        //header
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            'discover'.tr,
            style: Get.textTheme.subtitle2!.apply(
              color: AppColors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        //
        category(),

        const SizedBox(
          height: 90,
        ),
      ],
    );
  }

  Widget category() {
    return Expanded(
      child: Obx(
        () => mainController.loadingcategory.value
            ? loading()
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: mainController.categoryList.length,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      mainController.getMovieCategory(
                          mainController.categoryList[index].id!);
                      Get.to(() => SinglCtegoriScreen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                mainController.categoryList[index].name!,
                                style: Get.textTheme.headline3!.apply(
                                  color: AppColors.white.withAlpha(200),
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_right_rounded,
                                color: AppColors.white.withAlpha(200),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Divider(
                            color: AppColors.white.withAlpha(150),
                            indent: Get.width * 0.05,
                            endIndent: Get.width * 0.05,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
      ),
    );
  }
}
