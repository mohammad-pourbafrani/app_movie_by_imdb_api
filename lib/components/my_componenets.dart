import 'package:app_movie_by_imdb_api/components/appcolors.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget loading() {
  return const SpinKitThreeBounce(
    color: AppColors.white,
    size: 30.0,
  );
}
