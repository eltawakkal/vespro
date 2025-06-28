import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vespro/main/pages/calculator/calculator_page.dart';

class CalculatorPageController extends GetxController {

  final teAsset = TextEditingController();
  final teDownPayment = TextEditingController();

  var tenor = Tenor.ENAM.obs;
  var maxTenor = 6.0.obs;
  var jangkaWaktu = 1.0.obs;
  var percentage = 0.obs;
  var imbalHasil = 0.0.obs;
  var totalAsset = 0.0.obs;
  var showAlert = false.obs;

  var propertyList = [
    'AS', 'Properti Digital', 'Rumah Type 42/84'
  ];

  @override
  void onInit() {
    teAsset.addListener(() => calculate());
    teDownPayment.addListener(() => calculate());
    super.onInit();
  }

  calculate() {
    if (teAsset.text == propertyList[0] && tenor() == Tenor.ENAM) {
      percentage(1);
    } else if (teAsset.text == propertyList[0] && tenor() == Tenor.DUA_BELAS) {
      percentage(2);
    } else if (teAsset.text == propertyList[1] && tenor() == Tenor.ENAM) {
      percentage(8);
    } else if (teAsset.text == propertyList[1] && tenor() == Tenor.DUA_BELAS) {
      percentage(15);
    } else if (teAsset.text == propertyList[2] && tenor() == Tenor.ENAM) {
      percentage(10);
    } else if (teAsset.text == propertyList[2] && tenor() == Tenor.DUA_BELAS) {
      percentage(20);
    }

    //(2.000.000 × 15) ÷ 100) ÷ 12 × 14
    //Imbal Hasil + Harga Pembelian Awal

    final hargaBeli = int.parse(teDownPayment.text);
    final ery = percentage();
    final periode = tenor() == Tenor.ENAM ? 6 : 12;
    final waktu = jangkaWaktu();

    imbalHasil((hargaBeli * ery) / periode.toInt()*waktu.toInt());
    totalAsset(imbalHasil() + hargaBeli);
  }

  String numberToCurrency(int number) {
    final currencyFormatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    String formattedNumber = currencyFormatter.format(number);
    return formattedNumber;
  }

}