import 'package:app_movie_by_imdb_api/components/appcolors.dart';
import 'package:app_movie_by_imdb_api/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

import 'home_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final MainController mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Stack(
            children: [
              IndexedStack(
                index: mainController.selectedNavBar.value,
                children: [HomeScreen()],
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.0),
                    color: Colors.red,
                  ),
                  child: Obx(
                    () => WaterDropNavBar(
                        bottomPadding: 16,
                        backgroundColor: AppColors.backgrandNavColor,
                        inactiveIconColor: AppColors.white,
                        waterDropColor: AppColors.white,
                        barItems: [
                          BarItem(
                            filledIcon: Icons.bookmark_rounded,
                            outlinedIcon: Icons.bookmark_border_rounded,
                          ),
                          BarItem(
                              filledIcon: Icons.favorite_rounded,
                              outlinedIcon: Icons.favorite_border_rounded),
                          BarItem(
                            filledIcon: Icons.email_rounded,
                            outlinedIcon: Icons.email_outlined,
                          ),
                          BarItem(
                            filledIcon: Icons.folder_rounded,
                            outlinedIcon: Icons.folder_outlined,
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
      ),
    );
  }
}
