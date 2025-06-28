import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vespro/main/main_page.dart';

class WelcomePageController extends GetxController {

  var showButton = false.obs;
  var isLocationEnabled = false.obs;

  final box = GetStorage();

  final PageController pageController = PageController();
  final List<Color> colors = [Colors.orange, Colors.cyan, Colors.purple];

  checkLocation(context) async {
    // var status = await Permission.locationWhenInUse.request();
    //
    // if (status.isGranted) {
    //   box.write('isFirstLogin', false);
    //   Get.offAll(MainPage());
    // } else if (status.isDenied) {
    //   isLocationEnabled(false);
    //
    //   showErrorDialog(context);
    // } else if (status.isPermanentlyDenied) {
    //   // Open settings
    //   await openAppSettings();
    //
    //   showErrorDialog(context);
      box.write('isFirstLogin', false);
      Get.offAll(MainPage());
    // }
  }

  showErrorDialog(context) {
    showDialog(context: context, barrierDismissible: false, builder: (context) => AlertDialog(
      title: Text('Permintaan Izin'),
      content: Text('Kami membutuhkan akses lokasi untuk menyajikan konten'),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text('tutup', style: context.textTheme.labelLarge?.copyWith(
            color: Colors.red
          ),),
        ),
        TextButton(
          onPressed: () {
            Get.back();
            checkLocation(context);
          },
          child: Text('beri izin'),
        ),
      ],
    ));
  }

}