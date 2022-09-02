import 'dart:developer';

import 'package:app_movie_by_imdb_api/models/cooming_soon_model.dart';
import 'package:app_movie_by_imdb_api/models/most_popular_movie_model.dart';
import 'package:app_movie_by_imdb_api/services/api_constan.dart';
import 'package:app_movie_by_imdb_api/services/dio_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  //variable
  RxInt selectedNavBar = RxInt(0);
  RxBool loadingMostPopular = RxBool(false);
  RxBool loadingComingSoon = RxBool(false);

  //list
  RxList<MostPopularMovieModel> mostPopularMovieList = RxList();
  RxList<ComingSoonModel> comingSoonMoviesList = RxList();

  //controller

  TextEditingController textSearchController = TextEditingController();

  //method
  @override
  onInit() {
    super.onInit();
    getMostPopular();
    getComingSoon();
  }

  getMostPopular() async {
    loadingMostPopular.value = true;
    var responseMostPopular =
        await DioService().getMethod(ApiConstan.getMostPopularMovies);

    if (responseMostPopular.statusCode == 200) {
      responseMostPopular.data['items'].forEach((element) {
        mostPopularMovieList.add(MostPopularMovieModel.fromJson(element));
      });
    }
    loadingMostPopular.value = false;
  }

  getComingSoon() async {
    loadingComingSoon.value = true;
    var responseComingSoon =
        await DioService().getMethod(ApiConstan.getComingSoonMovies);

    if (responseComingSoon.statusCode == 200) {
      responseComingSoon.data['items'].forEach((element) {
        comingSoonMoviesList.add(ComingSoonModel.fromJson(element));
      });
    }
    loadingComingSoon.value = false;
  }
}
