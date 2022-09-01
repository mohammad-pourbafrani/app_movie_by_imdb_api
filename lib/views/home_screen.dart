import 'package:app_movie_by_imdb_api/components/appcolors.dart';
import 'package:app_movie_by_imdb_api/components/my_componenets.dart';
import 'package:app_movie_by_imdb_api/controllers/main_controller.dart';
import 'package:app_movie_by_imdb_api/gen/assets.gen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final MainController mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 8,
          ),
          //header
          Row(
            children: [
              const SizedBox(
                width: 8,
              ),
              Text(
                // ignore: todo
                //TODO: inja name karbar ra az database migirim
                "Mohhamad",
                style: Get.textTheme.headline4!.apply(
                  color: AppColors.white,
                ),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              CircleAvatar(
                backgroundImage: AssetImage(Assets.images.avatar.path),
              ),
              const SizedBox(
                width: 8,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          //search bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: mainController.textSearchController,
              style: Get.textTheme.headline1!.apply(
                color: AppColors.white,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.backgrandNavColor,
                hintText: 'search'.tr,
                hintStyle: Get.textTheme.headline1!.apply(
                  color: AppColors.white.withAlpha(100),
                ),
                prefixIcon: IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: AppColors.white,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          // most popular movies
          const SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 10,
              ),
              Text(
                'most_popular'.tr,
                style: Get.textTheme.subtitle2!.apply(
                  color: AppColors.white,
                ),
              ),
              const Expanded(child: SizedBox()),
              TextButton(
                onPressed: () {},
                child: Text(
                  'see_all'.tr,
                  style: Get.textTheme.headline2!.apply(
                    color: AppColors.white.withAlpha(150),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          mostPopularMoviesList(),
        ],
      ),
    );
  }

  Widget mostPopularMoviesList() {
    return SizedBox(
      height: Get.height / 2.7,
      child: Obx(
        () => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: mainController.mostPopularMovieList.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                width: Get.width / 2.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.backgrandNavColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: CachedNetworkImage(
                          imageUrl:
                              mainController.mostPopularMovieList[index].image!,
                          imageBuilder: (context, imageProvider) => Image(
                            image: imageProvider,
                            fit: BoxFit.fill,
                          ),
                          placeholder: (context, url) => loading(),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.image_not_supported_outlined,
                            color: AppColors.imageNotFoundColor,
                            size: 50,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              mainController.mostPopularMovieList[index].title!,
                              style: Get.textTheme.headline2!.apply(
                                color: AppColors.white.withAlpha(155),
                              ),
                            ),
                            Text(
                              mainController
                                  .mostPopularMovieList[index].imDbRatingCount!,
                              style: Get.textTheme.headline2!.apply(
                                color: AppColors.white.withAlpha(155),
                              ),
                            ),
                            RatingBarIndicator(
                              rating: double.parse(mainController
                                  .mostPopularMovieList[index].imDbRating!),
                              itemBuilder: (context, index) => const Icon(
                                Icons.star_rate_rounded,
                                color: Colors.amber,
                              ),
                              itemCount: 10,
                              itemSize: 16.0,
                              direction: Axis.horizontal,
                            ),
                          ],
                        ),
                      ),
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
