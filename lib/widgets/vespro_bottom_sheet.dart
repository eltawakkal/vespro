import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class VesproBottomSheet extends StatelessWidget {

  final String title;
  final List<Widget> children;

  const VesproBottomSheet({super.key, required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 20,),
          Row(
            children: [
              SizedBox(width: 30,),
              Text(title, style: GoogleFonts.lato().copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold
              )),
              Spacer(),
              IconButton(
                onPressed: () => Get.back(),
                icon: Icon(EvaIcons.close),
              ),
              SizedBox(width: 10,),
            ],
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20),
              children: children,
            ),
          )
        ],
      ),
    );
  }
}
