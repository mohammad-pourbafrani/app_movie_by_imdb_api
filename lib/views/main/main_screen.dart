import 'package:app_movie_by_imdb_api/components/appcolors.dart';
import 'package:app_movie_by_imdb_api/controllers/main_controller.dart';
import 'package:app_movie_by_imdb_api/views/single_categori_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

import 'categori_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final MainController mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Obx(
                () => IndexedStack(
                  index: mainController.selectedNavBar.value,
                  children: [
                    HomeScreen(),
                    CtegoriScreen(),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.0),
                ),
                child: Obx(
                  () => WaterDropNavBar(
                      bottomPadding: 16,
                      backgroundColor: AppColors.backgrandNavColor,
                      inactiveIconColor: AppColors.white,
                      waterDropColor: AppColors.white,
                      iconSize: 32,
                      barItems: [
                        BarItem(
                          filledIcon: Icons.home_sharp,
                          outlinedIcon: Icons.home_outlined,
                        ),
                        BarItem(
                            filledIcon: Icons.category_sharp,
                            outlinedIcon: Icons.category_outlined),
                        BarItem(
                          filledIcon: Icons.favorite_rounded,
                          outlinedIcon: Icons.favorite_border_rounded,
                        ),
                        BarItem(
                          filledIcon: Icons.person,
                          outlinedIcon: Icons.person_outline_outlined,
                        ),
                      ],
                      selectedIndex: mainController.selectedNavBar.value,
                      onItemSelected: (index) {
                        mainController.selectedNavBar.value = index;
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
