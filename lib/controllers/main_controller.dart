import 'dart:developer';

import 'package:app_movie_by_imdb_api/models/most_popular_movie_model.dart';
import 'package:app_movie_by_imdb_api/services/api_constan.dart';
import 'package:app_movie_by_imdb_api/services/dio_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  //variable
  RxInt selectedNavBar = RxInt(0);

  //list
  RxList<MostPopularMovieModel> mostPopularMovieList = RxList();

  //controller

  TextEditingController textSearchController = TextEditingController();

  //method
  @override
  onInit() {
    super.onInit();
    getMostPopularMovies();
  }

  getMostPopularMovies() async {
    var response =
        await DioService().getMethod(ApiConstan.getMostPopularMovies);
    if (response.statusCode == 200) {
      response.data['items'].forEach((element) {
        mostPopularMovieList.add(MostPopularMovieModel.fromJson(element));
      });
    }
  }
}
