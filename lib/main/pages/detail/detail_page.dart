import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vespro/main/pages/home/home_page.dart';

class DetailPage extends StatelessWidget {

  final InternalProperty property;

  const DetailPage({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(property.imageUrl, fit: BoxFit.cover,),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(30),
            sliver: SliverList.list(
              children: [
                Text(property.title, style: GoogleFonts.lato().copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )),
                Text(property.address, style: GoogleFonts.lato().copyWith(
                  fontSize: 14,
                  color: Colors.deepOrange,
                )),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Icon(Icons.bed, size: 18, color: Colors.orange,),
                    SizedBox(width: 5,),
                    Text('${property.kamarTidur} Kamar Tidur', style: GoogleFonts.lato().copyWith(
                      fontSize: 14,
                    )),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.bathtub, size: 18, color: Colors.orange),
                    SizedBox(width: 5,),
                    Text('${property.kamarMandi} Kamar Mandi', style: GoogleFonts.lato().copyWith(
                      fontSize: 14,
                    )),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.photo_size_select_small, size: 18, color: Colors.orange),
                    SizedBox(width: 5,),
                    Text('${property.luas} m²', style: GoogleFonts.lato().copyWith(
                      fontSize: 14,
                    )),
                  ],
                ),
                SizedBox(height: 20,),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Center(
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: SizedBox(
                                  height: 100, width: 100,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 10,
                                    value: property.progress,
                                    color: Colors.orange,
                                    backgroundColor: Colors.blue,

                                  ),
                                ),
                              )
                          ),
                          Text(property.progressString, style: GoogleFonts.lato().copyWith()),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.verified_user, size: 18, color: Colors.orange),
                          SizedBox(width: 5,),
                          Text('${property.certificate} Sertifikat', style: GoogleFonts.lato().copyWith(
                            fontSize: 14,
                          )),
                        ],
                      ),
                      SizedBox(height: 20,),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
