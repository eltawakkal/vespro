import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vespro/splash/splash_page_controller.dart';

class SplashPage extends StatelessWidget {
  SplashPage({super.key});

  final controller = Get.put(SplashPageController());

  @override
  Widget build(BuildContext context) {

    return Obx(() =>
      Scaffold(
        body: Center(
          child: Column(
             mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: MediaQuery.of(context).viewPadding.bottom + 10,),
              Spacer(),
              Image.asset(
                'assets/images/logo_transparent.png',
                width: 100,
                fit: BoxFit.cover,
              ),
              Text('Vespro', style: context.textTheme.titleLarge?.copyWith(
                color: Color(0xFF3fb0e0),
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),),
              Text(
                'Property Trading',
                style: context.textTheme.titleSmall?.copyWith(
                  fontSize: 10
                ),
              ),
              Spacer(),
              controller.isNoConnection()
                  ? Column(
                    children: [
                      Text('Ups, Anda Tidak Memiliki Koneksi..'),
                      SizedBox(height: 10,),
                      MaterialButton(
                          onPressed: () async {
                            // await controller.checkConnection();
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          color: Color(0xFF3fb0e0),
                          child: Text(
                            'Coba lagi',
                            style: context.textTheme.titleSmall?.copyWith(
                              color: Colors.white
                            ),
                          ),
                      ),
                    ],
                  )
                  : CircularProgressIndicator.adaptive(),
              Spacer(),
              Text(
                'Copyright © VESPRO',
                style: context.textTheme.titleSmall?.copyWith(
                  fontSize: 10,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).viewPadding.bottom + 10,)
            ],
          )
        ),
      ),
    );
  }
}
