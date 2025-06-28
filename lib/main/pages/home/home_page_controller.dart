import 'package:get/get.dart';

class HomePageController extends GetxController {

  var isLoading = false.obs;

  @override
  void onInit() {

    initPage();

    super.onInit();
  }

  initPage() async {
    isLoading(true);

    await Future.delayed(Duration(seconds: 1));

    isLoading(false);
  }

}