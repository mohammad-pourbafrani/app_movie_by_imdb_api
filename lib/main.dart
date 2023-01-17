import 'package:app_movie_by_imdb_api/components/lanqueages.dart';
import 'package:app_movie_by_imdb_api/components/theme.dart';
import 'package:app_movie_by_imdb_api/views/Authentication/login_screen.dart';
import 'package:app_movie_by_imdb_api/views/single_movie_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'components/appcolors.dart';
import 'views/main/main_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.statusBarColor,
    systemNavigationBarColor: AppColors.statusBarColor,
    statusBarBrightness: Brightness.light,
    systemNavigationBarIconBrightness: Brightness.light,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Languages(),
      locale: const Locale('en'),
      theme: Themes.appTheme,
      home: MainScreen(),
    );
  }
}
