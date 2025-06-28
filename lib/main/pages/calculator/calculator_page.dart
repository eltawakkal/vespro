import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vespro/widgets/vespro_bottom_sheet.dart';

import 'calculator_page_controller.dart';

enum Tenor {ENAM, DUA_BELAS}

class CalculatorPage extends StatelessWidget {
  CalculatorPage({super.key});
  
  final controller = Get.put(CalculatorPageController());

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
      Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/logo_transparent.png'),
          ),
          title: Text('Kalkulator'),
        ),
        body: ListView(
            padding: EdgeInsets.all(30),
            children: [
              Card(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Pilih Properti', style: GoogleFonts.lato().copyWith(
                        fontWeight: FontWeight.bold,
                      )),
                      SizedBox(height: 5,),
                      TextField(
                        controller: controller.teAsset,
                        onTap: () => showModalBottomSheet(
                          context: context,
                          builder: (context) => VesproBottomSheet(
                            title: 'Pilih Propert',
                            children: controller.propertyList.map((e) => ListTile(
                              trailing: Icon(e == controller.teAsset.text ? Icons.radio_button_checked : Icons.radio_button_off),
                              title: Text(e),
                              onTap: () {
                                controller.teAsset.text = e;
                                Get.back();
                              },
                            )).toList(),
                          ),
                        ),
                        readOnly: true,
                        decoration: InputDecoration(
                          filled: true,
                          hintText: 'Pilih Property',
                        ),
                      ),
                      SizedBox(height: 10,),
                      Center(
                        child: SegmentedButton<Tenor>(
                          selectedIcon: Icon(EvaIcons.checkmarkCircle2),
                          segments: [
                            ButtonSegment<Tenor>(
                              value: Tenor.ENAM,
                              icon: Icon(EvaIcons.radioButtonOff),
                              label: Text('6 Bulan'),
                            ),
                            ButtonSegment<Tenor>(
                              value: Tenor.DUA_BELAS,
                              icon: Icon(EvaIcons.radioButtonOff),
                              label: Text('12 Bulan'),
                            ),
                          ],
                          selected: <Tenor>{controller.tenor()},
                          onSelectionChanged: (Set<Tenor> newSelection) {
                            controller.tenor(newSelection.first);
                            controller.maxTenor(newSelection.first == Tenor.ENAM ? 6 : 12);
                            controller.jangkaWaktu(controller.jangkaWaktu() > controller.maxTenor() ? controller.maxTenor() : controller.jangkaWaktu());
                            controller.calculate();
                          },
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text('Pembelian Awal', style: GoogleFonts.lato().copyWith(
                        fontWeight: FontWeight.bold,
                      )),
                      SizedBox(height: 5,),
                      TextField(
                        controller: controller.teDownPayment,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          filled: true,
                          hintText: 'Pembelian Awal',
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text('Jangka Waktu', style: GoogleFonts.lato().copyWith(
                        fontWeight: FontWeight.bold,
                      )),
                      SizedBox(),
                      Slider(
                        padding: EdgeInsets.all(0),
                        value: controller.jangkaWaktu(),
                        min: 1,
                        max: controller.maxTenor(),
                        divisions: 11,
                        label: '${controller.jangkaWaktu().toInt()} Bulan',
                        onChanged: (newVal) {
                          controller.jangkaWaktu(newVal);
                          controller.calculate();
                        },
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Expected Rental Yield (ERY)', style: GoogleFonts.lato().copyWith(
                            fontWeight: FontWeight.bold,
                          )),
                          Text('${controller.percentage()}%'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Card(
                        color: Colors.blue,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text('Estimasi pendapatan imbal hasil dalam\n${controller.maxTenor().toInt()} Bulan', textAlign: TextAlign.center, style: GoogleFonts.lato().copyWith(
                            color: Colors.white,
                          )),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text('Perkiraan imbal hasil', style: GoogleFonts.lato().copyWith()),
                      SizedBox(height: 5,),
                      Text('IDR ${controller.numberToCurrency(controller.imbalHasil().toInt())}', style: GoogleFonts.lato().copyWith(
                        fontWeight: FontWeight.bold,
                      )),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Card(
                color: Colors.orange,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total Asset', style: GoogleFonts.lato().copyWith(
                          color: Colors.white
                      )),
                      Text('IDR ${controller.numberToCurrency(controller.totalAsset().toInt())}', style: GoogleFonts.lato().copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                    ],
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}
