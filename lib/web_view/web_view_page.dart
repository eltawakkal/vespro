import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vespro/web_view/web_view_page_controller.dart';
import 'package:vespro/widgets/shimmer_home.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  WebViewPage({super.key});

  final controller = Get.put(WebViewPageController());

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) async {
            if (didPop) {
              return;
            }
            if (await controller.webController.canGoBack() && !controller.isRequesting()) {
              controller.webController.goBack();
            } else {
              controller.showModalDialog();
            }
          },
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).viewPadding.top,
                  ),
                  width: double.infinity,
                  height: double.infinity,
                  child: WebViewWidget(
                    controller: controller.webController,
                  ),
                ),
                SizedBox(
                  // color: Colors.red.shade50,
                  height: double.infinity,
                  width: 10,
                  child: GestureDetector(
                    onHorizontalDragUpdate: (details) async {
                      // if (details.primaryVelocity! > 0) {
                      if (details.delta.dx > 0) {
                        if (await controller.webController.canGoBack() && !controller.isRequesting()) {
                          controller.webController.goBack();
                        } else {
                          controller.showModalDialog();
                        }
                      }
                    },
                  ),
                ),
                Visibility(
                  visible: controller.isRequesting(),
                  child: ShimmerHome(),
                ),
                Visibility(
                  visible: controller.isError(),
                  child: Container(
                    color: Colors.white,
                    height: double.infinity,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/no_connection.png',
                          width: 300,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 20,),
                        Text(
                          'Ups, Terjadi kesalahan Koneksi',
                          style: context.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        Text(
                          'Cek koneksi internet Anda dan coba lagi',
                          style: context.textTheme.bodySmall,
                        ),
                        SizedBox(height: 20,),
                        MaterialButton(
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          onPressed: () {
                            controller.isError(false);
                            controller.webController.reload();
                          },
                          child: Text('Coba Lagi', style: context.textTheme.titleSmall?.copyWith(
                              color: Colors.white
                          )),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // bottomNavigationBar: Obx(() =>
            //     NavigationBar(
            //       selectedIndex: controller.navigationIndex(),
            //       onDestinationSelected: (index) {
            //         if (index != 1) {
            //           controller.navigationIndex(index);
            //         } else {
            //           showModalBottomSheet(context: context, builder: (context) => Container(
            //             width: double.infinity,
            //             padding: EdgeInsets.all(30),
            //             decoration: BoxDecoration(
            //                 color: Colors.white,
            //                 borderRadius: BorderRadius.only(
            //                   topLeft: Radius.circular(30),
            //                   topRight: Radius.circular(30),
            //                 )
            //             ),
            //             child: ListView(
            //               children: [
            //                 Image.asset('assets/images/office.png', height: 200,),
            //                 Text('Hubungi Kami', textAlign: TextAlign.center, style: context.textTheme.labelLarge?.copyWith(
            //                   fontWeight: FontWeight.bold,
            //                 ),),
            //                 SizedBox(height: 10,),
            //                 Card(
            //                   child: ListTile(
            //                     onTap: () async {
            //                       if (!await launchUrl(Uri.parse('https://api.whatsapp.com/send/?phone=6285234578920&text&type=phone_number&app_absent=0'))) {
            //                         throw Exception('Could not launch');
            //                       }
            //                     },
            //                     leading: CircleAvatar(
            //                       backgroundColor: Colors.blue.shade50,
            //                       child: Icon(EvaIcons.messageCircle, color: Colors.blue,),
            //                     ),
            //                     title: Text('Whatsapp'),
            //                     trailing: Icon(EvaIcons.arrowIosForward),
            //                   ),
            //                 ),
            //                 Card(
            //                   child: ListTile(
            //                     onTap: () async {
            //                       final Uri emailLaunchUri = Uri(
            //                         scheme: 'mailto',
            //                         path: 'layanan@vespro.id',
            //                       );
            //                       if (!await launchUrl(emailLaunchUri)) {
            //                         throw Exception('Could not launch');
            //                       }
            //                     },
            //                     leading: CircleAvatar(
            //                       backgroundColor: Colors.blue.shade50,
            //                       child: Icon(EvaIcons.email, color: Colors.blue,),
            //                     ),
            //                     title: Text('Email'),
            //                     trailing: Icon(EvaIcons.arrowIosForward),
            //                   ),
            //                 ),
            //                 MaterialButton(
            //                   shape: RoundedRectangleBorder(
            //                       borderRadius: BorderRadius.circular(10)
            //                   ),
            //                   onPressed: () => Get.back(),
            //                   child: Text('Tutup', style: context.textTheme.labelLarge?.copyWith(
            //                       color: Colors.red
            //                   ),),
            //                 )
            //               ],
            //             ),
            //           ));
            //         }
            //
            //         if (index == 0) {
            //           controller.isError(false);
            //           controller.webController.loadRequest(Uri.parse('https://vespro.id/'));
            //         } else if (index == 1) {
            //
            //         } else if (index == 2) {
            //           controller.isError(false);
            //           controller.webController.loadRequest(Uri.parse('https://vespro.id/about_us/'));
            //         }
            //       },
            //       destinations: [
            //         NavigationDestination(
            //           icon: Icon(EvaIcons.gridOutline, color: Colors.blue,),
            //           selectedIcon: Icon(EvaIcons.grid, color: Colors.blue,),
            //           label: 'Beranda',
            //         ),
            //         NavigationDestination(
            //           icon: Icon(EvaIcons.messageCircleOutline, color: Colors.blue,),
            //           selectedIcon: Icon(EvaIcons.messageCircle, color: Colors.blue,),
            //           label: 'Kontak',
            //         ),
            //         NavigationDestination(
            //           icon: Icon(EvaIcons.infoOutline, color: Colors.blue,),
            //           selectedIcon: Icon(EvaIcons.info, color: Colors.blue,),
            //           label: 'Tentang',
            //         ),
            //       ],
            //     ),
            // ),
          ),
        ),
    );
  }

  Widget loadingContainer({
    double? width,
    double? height,
    double? borderRadius,
  }) => Container(
    width: width ?? 100,
    height: height ?? 100,
    decoration: BoxDecoration(
      color: Colors.black26,
      borderRadius: BorderRadius.circular(borderRadius ?? 10),
    ),
  );

}
