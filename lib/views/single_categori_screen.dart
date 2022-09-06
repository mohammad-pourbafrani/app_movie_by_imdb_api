import 'package:app_movie_by_imdb_api/components/appcolors.dart';
import 'package:app_movie_by_imdb_api/components/my_componenets.dart';
import 'package:app_movie_by_imdb_api/controllers/main_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SinglCtegoriScreen extends StatelessWidget {
  SinglCtegoriScreen({Key? key}) : super(key: key);
  final MainController mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
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
          ],
        ),
      ),
    );
  }

  Widget category() {
    return Expanded(
      child: Obx(
        () => mainController.loadingCategoryMovie.value
            ? loading()
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: mainController.categoryItemList.length,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              //image
                              Center(
                                child: CachedNetworkImage(
                                  imageUrl: mainController
                                      .categoryItemList[index].poster!,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    width: Get.width * 0.20,
                                    height: Get.height * 0.11,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                  placeholder: (context, url) => loading(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(
                                    Icons.image_not_supported_outlined,
                                    color: AppColors.imageNotFoundColor,
                                    size: 50,
                                  ),
                                ),
                              ),
                              //texts
                              Column(
                                children: [
                                  Text(
                                    mainController
                                        .categoryItemList[index].title!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Get.textTheme.headline3!.apply(
                                      color: AppColors.white.withAlpha(200),
                                    ),
                                  ),
                                  Text(
                                    mainController
                                        .categoryItemList[index].imdbRating!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Get.textTheme.headline3!.apply(
                                      color: AppColors.white.withAlpha(200),
                                    ),
                                  ),
                                ],
                              ),
                              //icon
                              const Expanded(child: SizedBox()),
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
