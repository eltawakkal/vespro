
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vespro/main/main_page_controller.dart';
import 'package:vespro/main/pages/calculator/calculator_page.dart';
import 'package:vespro/main/pages/home/home_page.dart';
import 'package:vespro/main/pages/info/info_page.dart';
import 'package:vespro/main/pages/property/property_page.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final controller = Get.put(MainPageController());

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
      Scaffold(
        body: IndexedStack(
          index: controller.navIndex(),
          children: [
            HomePage(),
            CalculatorPage(),
            PropertyPage(),
            InfoPage(),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: controller.navIndex(),
          onDestinationSelected: (newIndex) => controller.navIndex(newIndex),
          destinations: [
            NavigationDestination(
              label: 'Beranda',
              icon: Icon(EvaIcons.gridOutline),
              selectedIcon: Icon(EvaIcons.grid),
            ),
            NavigationDestination(
              label: 'Kalkulator',
              icon: Icon(Icons.calculate_outlined),
              selectedIcon: Icon(Icons.calculate_rounded),
            ),
            NavigationDestination(
              label: 'Properti',
              icon: Icon(EvaIcons.giftOutline),
              selectedIcon: Icon(EvaIcons.gift),
            ),
            NavigationDestination(
              label: 'Informasi',
              icon: Icon(EvaIcons.infoOutline),
              selectedIcon: Icon(EvaIcons.info),
            ),
          ],
        ),
      ),
    );
  }

}
