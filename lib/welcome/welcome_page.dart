import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vespro/welcome/welcome_page_controller.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({super.key});

  final controller = Get.put(WelcomePageController());

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
      Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            PageView(
              onPageChanged: (index) {
                if (index == controller.colors.length - 1) {
                  controller.showButton(true);
                } else {
                  controller.showButton(false);
                }
              },
              controller: controller.pageController,
              children: [
                buildPage(
                  context: context,
                  image: 'grid',
                  title: 'Jadilah Terupdate',
                  description: 'Dapatkan item terupdate setiap harinya hanya'
                      ' dalam genggaman anda',
                ),
                buildPage(
                  context: context,
                  image: 'calculate',
                  title: 'Kalkulator Imbal Hasil',
                  description: 'Hitung estimasi potensi imbal hasil pembelian '
                      'asset propertimu',
                ),
                buildPage(
                  context: context,
                  image: 'rocket',
                  title: "Let's Start",
                  description: 'Ayo jelajahi dunia property dan jadilah terupdate',
                ),
              ]
            ),
            Positioned(
              bottom: MediaQuery.of(context).viewPadding.bottom + 25,
              child: SmoothPageIndicator(
                controller: controller.pageController,
                effect: WormEffect(
                  dotColor: Colors.black12,
                  activeDotColor: Colors.black54
                ),
                count: controller.colors.length,
              ),
            ),
            controller.showButton() ? Positioned(
              bottom: MediaQuery.of(context).viewPadding.bottom + 10,
              // left: 30,
              // right: 30,
              child: SizedBox(
                width: 200,
                child: Material(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 5,
                  shadowColor: Colors.black,
                  color: Colors.cyan,
                  child: ClipRRect(
                    child: ListTile(
                      leading: Icon(Icons.rocket, color: Colors.white, size: 18,),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onTap: () => controller.checkLocation(context),
                      title: Text(
                        'Mulai Sekarang',
                        style: context.textTheme.labelLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      // trailing: Icon(Icons.arrow_forward, color: Colors.white,),
                    ),
                  ),
                ),
              ),
            ) : SizedBox(),
            SizedBox(
              height: MediaQuery.of(context).viewPadding.bottom + 10,
            )
          ],
        ),
      ),
    );
  }

  Widget buildPage({required BuildContext context, required image, required title, required description, showButton = false}) => Container(
    padding: EdgeInsets.all(20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Spacer(),
        Image.asset(
          'assets/images/$image.png',
          height: 180,
        ),
        Text(
          title,
          style: context.textTheme.titleMedium?.copyWith(
              color: Colors.blue,
              fontWeight: FontWeight.bold
          ),
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: context.textTheme.labelMedium?.copyWith(
            // color: Colors.cyan,
          ),
        ),
        Spacer(),
      ],
    ),
  );
}
