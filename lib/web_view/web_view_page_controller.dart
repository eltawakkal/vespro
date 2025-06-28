

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPageController extends GetxController {

  late WebViewController webController;
  final double swipeThreshold = 100;

  late BuildContext context;

  var navigationIndex = 0.obs;

  var isRequesting = false.obs;
  var isError = false.obs;

  @override
  void onInit() {
    webController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            isRequesting(true);
          },
          onPageFinished: (url) {
            isRequesting(false);
          },
          onHttpError: (HttpResponseError error) {
            isRequesting(false);
            print('http error: ${error.response?.statusCode}');
            isError(true);
          },
          onProgress: (progress) {

          },
          onWebResourceError: (WebResourceError error) {
            isRequesting(false);
            print('resource error: ${error.description.capitalize}');
            isError(true);
          },
          onNavigationRequest: (NavigationRequest request) async {
            if (request.url.contains('youtube')) {
              return NavigationDecision.prevent;
            }

            if (request.url.startsWith('https://api.whatsapp.com/send/')) {
              if (!await launchUrl(Uri.parse('https://api.whatsapp.com/send/?phone=6285234578920&text&type=phone_number&app_absent=0'))) {
                throw Exception('Could not launch');
              }
              return NavigationDecision.prevent;
            } else if (request.url.startsWith('mailto:')) {
              final Uri emailLaunchUri = Uri(
                scheme: 'mailto',
                path: 'layanan@vespro.id',
              );
              if (!await launchUrl(emailLaunchUri)) {
                throw Exception('Could not launch');
              }
              return NavigationDecision.prevent;
            }

            if (request.url == 'https://vespro.id/about_us') {
              navigationIndex(2);
            }

            if (request.url == 'https://vespro.id') {
              navigationIndex(0);
            }

            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://vespro.id'));

    super.onInit();
  }

  showModalDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: Text('Keluar'),
          content: Text('Apakah Anda Yakin Keluar?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text('Keluar'),
            ),
          ],
        )
    );
  }
}