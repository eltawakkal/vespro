import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vespro/main/pages/home/home_page.dart';

import '../detail/detail_page.dart';

class PropertyPage extends StatelessWidget {
  const PropertyPage({super.key});

  @override
  Widget build(BuildContext context) {

    var properties = [
      InternalProperty('https://www.99.co/id/panduan/wp-content/uploads/2023/05/08142152/Perumahan-Cibubur.jpg', 'Jl. Puncak Tarang no 34', 'Rumah Type 42/84', 2, 1, 42, 0.1, '10%', 315),
      InternalProperty('https://vistalandgroup.com/wp-content/uploads/2023/12/3d-render-rumah-GHI-afternoon-2-1024x705.jpg', 'Jl. Brawijaya no 14', 'Rumah Type 42/84', 2, 2, 50, 0.3, '30%', 425),
      InternalProperty('https://cdn.antaranews.com/cache/1200x800/2021/02/02/perumahan_ungaran.jpg', 'Jl. Tangerang Raya no 23', 'Rumah Type 42/84', 1, 1, 40, 0.2, '20%', 395),
      InternalProperty('https://gardens.id/wp-content/uploads/2022/09/Evergreen-Type-96-Side-1.jpeg', 'Jl. Karang Ploso no 11', 'Rumah Type 42/84', 3, 2, 55, 0.1, '10%', 295),
      InternalProperty('https://www.pinhome.id/blog/wp-content/uploads/2021/06/1601977264_5f7c3bb05ff1bads_images_1864.jpg', 'Jl. Jawa Bali no 121', 'Rumah Type 42/84', 3, 2, 50, 0.2, '17%', 295),
      InternalProperty('https://d3lfgix2a8jnun.cloudfront.net/custom-assets/12/serenity-townhouse_65981afcb15ed-CoueMxoupETwdnaOy9V5XA2zGqjMBKjoj0iIVrJm.jpg', 'Jl. Karang Anayar no 11', 'Rumah Type 42/84', 3, 2, 60, 0.1, '15%', 295),
      InternalProperty('https://asset.kompas.com/crops/SUhAa-hzBi1l62eWtxpbsjS8e0E=/6x15:950x644/750x500/data/photo/2021/01/05/5ff45060b15eb.png', 'Jl. Rwojati no 11', 'Rumah Type 42/84', 3, 2, 65, 0.25, '21%', 295),
      InternalProperty('https://arsitagx-master.s3.ap-southeast-1.amazonaws.com/img-medium/47319/29366/lentras-build-adhi-city-sentul1691033669-m.jpeg', 'Jl. Purwodadi no 11', 'Rumah Type 42/84', 3, 2, 45, 0.1, '11%', 295),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Properti'),
      ),
      body: GridView.builder(
        primary: false,
        padding: const EdgeInsets.all(20),
        itemCount: properties.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: InkWell(
              onTap: () => Get.to(DetailPage(property: properties[index],)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 180,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 90,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(properties[index].imageUrl, fit: BoxFit.cover,),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(properties[index].address, style: GoogleFonts.lato().copyWith(
                        fontSize: 13,
                        color: Colors.deepOrange,
                      ),),
                      Text(properties[index].title, maxLines: 2, overflow: TextOverflow.ellipsis, style: GoogleFonts.lato().copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.blue
                      ),),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Icon(Icons.bed, size: 18, color: Colors.orange,),
                          SizedBox(width: 5,),
                          Text('${properties[index].kamarTidur} Kamar Tidur', style: GoogleFonts.lato().copyWith(
                            fontSize: 13,
                            color: Colors.blue,
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.bathtub, size: 18, color: Colors.orange,),
                          SizedBox(width: 5,),
                          Text('${properties[index].kamarMandi} Kamar Mandi', style: GoogleFonts.lato().copyWith(
                            fontSize: 13,
                            color: Colors.blue,
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.photo_size_select_small, size: 18, color: Colors.orange,),
                          SizedBox(width: 5,),
                          Text('${properties[index].luas} m²', style: GoogleFonts.lato().copyWith(
                            fontSize: 13,
                            color: Colors.blue,
                          )),
                        ],
                      ),
                      Spacer(),
                      LinearProgressIndicator(
                        value: properties[index].progress,
                        minHeight: 10,
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange,
                      ),
                      Row(
                        children: [
                          Text(properties[index].progressString, style: GoogleFonts.lato().copyWith(
                            fontSize: 13,
                            color: Colors.blue,
                          )),
                          Spacer(),
                          Text('${properties[index].certificate} Sertifikat', style: GoogleFonts.lato().copyWith(
                            fontSize: 13,
                            color: Colors.blue,
                          )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          mainAxisExtent: 290
        ),
      ),
    );
  }
}
