import 'package:app_movie_by_imdb_api/components/appcolors.dart';
import 'package:app_movie_by_imdb_api/components/my_componenets.dart';
import 'package:app_movie_by_imdb_api/controllers/main_controller.dart';
import 'package:app_movie_by_imdb_api/gen/assets.gen.dart';
import 'package:app_movie_by_imdb_api/views/single_movie_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({Key? key}) : super(key: key);
  final MainController mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [],
      ),
    );
  }
}
