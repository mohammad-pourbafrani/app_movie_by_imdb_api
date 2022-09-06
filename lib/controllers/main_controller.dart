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
  RxMap<String, dynamic> dataPageMostPopular = RxMap();
  RxMap<String, dynamic> dataPageComingSoon = RxMap();
  int pageMostPopular = 1;
  int pageComingSoon = 4;

  //list
  RxList<MostPopularMovieModel> mostPopularMovieList = RxList();
  RxList<MostPopularMovieModel> comingSoonMoviesList = RxList();

  //controller

  TextEditingController textSearchController = TextEditingController();
  ScrollController? scrollControllerMostMovie;
  ScrollController? scrollControllerComingMovie;

  //method

  scrollListenerMostMovie() {
    if (scrollControllerMostMovie!.offset >=
            scrollControllerMostMovie!.position.maxScrollExtent &&
        !scrollControllerMostMovie!.position.outOfRange) {
      if (pageMostPopular < dataPageMostPopular["page_count"]) {
        mostPopularMovieList.clear();
        pageMostPopular++;

        getMostPopular();
      }
    }
    if (scrollControllerMostMovie!.offset <=
            scrollControllerMostMovie!.position.minScrollExtent &&
        !scrollControllerMostMovie!.position.outOfRange) {
      if (pageMostPopular > 1) {
        mostPopularMovieList.clear();
        pageMostPopular--;
        getMostPopular();
      }
    }
  }

  scrollListenerComingMovie() {
    if (scrollControllerComingMovie!.offset >=
            scrollControllerComingMovie!.position.maxScrollExtent &&
        !scrollControllerComingMovie!.position.outOfRange) {
      if (pageComingSoon < dataPageComingSoon["page_count"]) {
        comingSoonMoviesList.clear();
        pageComingSoon++;

        getComingSoon();
      }
    }
    if (scrollControllerComingMovie!.offset <=
            scrollControllerComingMovie!.position.minScrollExtent &&
        !scrollControllerComingMovie!.position.outOfRange) {
      if (pageComingSoon > 4) {
        comingSoonMoviesList.clear();
        pageComingSoon--;
        getComingSoon();
      }
    }
  }

  @override
  onInit() {
    scrollControllerMostMovie = ScrollController();
    scrollControllerComingMovie = ScrollController();
    scrollControllerComingMovie!.addListener(scrollListenerComingMovie);
    scrollControllerMostMovie!.addListener(scrollListenerMostMovie);

    getMostPopular();
    getComingSoon();
    super.onInit();
  }

  getMostPopular() async {
    loadingMostPopular.value = true;

    Map<String, dynamic> parametr = {'page': pageMostPopular};
    var responseMostPopular =
        await DioService().getMethod(ApiConstan.getMostPopularMovies, parametr);

    if (responseMostPopular.statusCode == 200) {
      responseMostPopular.data['data'].forEach((element) {
        mostPopularMovieList.add(MostPopularMovieModel.fromJson(element));
      });

      dataPageMostPopular.value = responseMostPopular.data['metadata'];
    }

    log(responseMostPopular.toString());
    loadingMostPopular.value = false;
  }

  getComingSoon() async {
    loadingComingSoon.value = true;
    Map<String, dynamic> parametr = {'page': pageComingSoon};
    var responseComingSoon =
        await DioService().getMethod(ApiConstan.getComingSoonMovies, parametr);

    if (responseComingSoon.statusCode == 200) {
      responseComingSoon.data['data'].forEach((element) {
        comingSoonMoviesList.add(MostPopularMovieModel.fromJson(element));
      });
      dataPageComingSoon.value = responseComingSoon.data['metadata'];
    }
    loadingComingSoon.value = false;
  }
}
