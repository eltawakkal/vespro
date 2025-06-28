import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vespro/main/main_page.dart';
import 'package:vespro/web_view/web_view_page.dart';
import 'package:vespro/welcome/welcome_page.dart';

class SplashPageController extends GetxController {

  final box = GetStorage();
  var isNoConnection = false.obs;


  @override
  void onInit() {
    checkFirstOpen();

    super.onInit();
  }

  checkFirstOpen() async {
    bool isFirstLogin = box.read('isFirstLogin') ?? true;

    // await controller.checkConnection();

    try {
      final result = await Dio().get('https://dpp.hidayatullah.app/v1/product/list').then((value) {
        if (isFirstLogin) {
          Get.offAll(WelcomePage());
          return;
        } else {
          Get.offAll(MainPage());
        }
      });
    } catch(e) {
      if (isFirstLogin) {
        Get.offAll(WelcomePage());
        return;
      } else {
        Get.offAll(WebViewPage());
      }
    }
  }

  // checkConnection() async {
  //   final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
  //
  //   if (connectivityResult.contains(ConnectivityResult.mobile) || connectivityResult.contains(ConnectivityResult.wifi)) {
  //     Get.offAll(MainPage());
  //   } else {
  //     listenConnectionChange();
  //     isNoConnection(true);
  //   }
  // }

  // listenConnectionChange() {
  //   Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> result) {
  //     if (result.contains(ConnectivityResult.mobile) || result.contains(ConnectivityResult.wifi)) {
  //       Get.offAll(MainPage());
  //     }
  //   });
  // }

}