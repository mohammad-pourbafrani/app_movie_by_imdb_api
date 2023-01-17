import 'dart:developer';

import 'package:app_movie_by_imdb_api/services/api_constan.dart';
import 'package:app_movie_by_imdb_api/services/dio_service.dart';
import 'package:app_movie_by_imdb_api/views/Authentication/login_screen.dart';
import 'package:app_movie_by_imdb_api/views/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  //variable
  RxBool cheackEmail = RxBool(false);
  RxBool loadingSignUp = RxBool(false);
  RxBool loadingLogIn = RxBool(false);

  //list

  //storage
  final storage = new FlutterSecureStorage();

  //controller

  TextEditingController textEmailController = TextEditingController();
  TextEditingController textPasswordController = TextEditingController();
  TextEditingController textUserNameController = TextEditingController();

  //method

  @override
  InternalFinalCallback<void> get onDelete => super.onDelete;

  void clearEditeText() {
    textUserNameController.clear();
    textPasswordController.clear();
    textEmailController.clear();
  }

  register() async {
    loadingSignUp.value = true;
    if (GetUtils.isEmail(textEmailController.value.text) &&
        GetUtils.isLengthGreaterThan(textPasswordController.text, 6) &&
        GetUtils.isUsername(textUserNameController.text)) {
      Map<String, String> data = {
        'email': textEmailController.value.text,
        'password': textPasswordController.text,
        'name': textUserNameController.text,
      };
      var response =
          await DioService().postMethod(ApiConstan.postUserInfoSignUp, data);
      if (response.statusCode == 201) {
        Get.snackbar("sign up", " sucsessful");
        clearEditeText();
        Future.delayed(const Duration(seconds: 3)).then((value) {
          Get.to(() => LoginScreen());
        });
      } else {
        Get.snackbar("dont sign up", "no sucsessful");
        clearEditeText();
      }
    }
    loadingSignUp.value = false;
  }

  logIn() async {
    loadingLogIn.value = true;
    if (GetUtils.isLengthGreaterThan(textPasswordController.text, 1) &&
        GetUtils.isEmail(textUserNameController.text)) {
      Map<String, String> data = {
        'grant_type': "password",
        'username': textUserNameController.text,
        'password': textPasswordController.text,
      };
      var response =
          await DioService().postLogIn(ApiConstan.postUserInfoLogIn, data);
      if (response.statusCode == 200) {
        clearEditeText();

        await storage.write(
            key: 'token_type', value: response.data["token_type"]);
        await storage.write(
            key: 'access_token', value: response.data["access_token"]);
        await storage.write(
            key: 'refresh_token', value: response.data["refresh_token"]);
        log(response.toString());
        getrRefreshToken();
        getUserInfo();
        // Get.delete<AuthenticationController>();
        // Get.off(() => MainScreen())?.then((value) => null);
      } else {
        clearEditeText();
        Get.snackbar("dont Log in", "no sucsessful");
      }
    }
    loadingLogIn.value = false;
  }

  getUserInfo() async {
    Map<String, dynamic> parametr = {
      'authorization': await storage.read(key: "access_token").then((value) {
        return "Bearer${value.toString()}";
      })
    };
    print(await storage.read(key: "access_token").then((value) {
      return "Bearer${value.toString()}";
    }));
    var responseUserInfo = await DioService().postUserInfo(
        ApiConstan.getUserInfo,
        await storage.read(key: "access_token").then((value) {
          return "Bearer${value.toString()}";
        }));
    log(responseUserInfo.toString());
    if (responseUserInfo.statusCode == 200) {
      await storage.write(
          key: 'username', value: responseUserInfo.data["name"]);
      await storage.write(
          key: 'email', value: responseUserInfo.data["access_token"]);
    }
    log(responseUserInfo.toString());
  }

  getrRefreshToken() async {
    Map<String, dynamic> data = {
      'grant_type': 'refresh_token',
      'refresh_token': await storage.read(key: "refresh_token").then((value) {
        return value.toString();
      })
    };

    var responseUserInfo =
        await DioService().postLogIn(ApiConstan.postUserInfoLogIn, data);
    log(responseUserInfo.toString());
    if (responseUserInfo.statusCode == 200) {
      await storage.write(
          key: 'access_token', value: responseUserInfo.data["access_token"]);
    }
    log(responseUserInfo.toString());
  }

  logOut() async {
    String ali = await storage.readAll().then((value) {
      return value.toString();
    });
    print(ali);
  }
}
