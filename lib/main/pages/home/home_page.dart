import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vespro/main/pages/detail/detail_page.dart';
import 'package:vespro/main/pages/home/home_page_controller.dart';
import 'package:vespro/widgets/shimmer_home.dart';

class InternalProperty {
  final String imageUrl;
  final String address;
  final String title;
  final int kamarTidur;
  final int kamarMandi;
  final int luas;
  final double progress;
  final String progressString;
  final int certificate;

  InternalProperty(this.imageUrl, this.address, this.title, this.kamarTidur, this.kamarMandi, this.luas, this.progress, this.progressString, this.certificate);
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final pageViewController = PageController(
    initialPage: 0
  );

  final controller = Get.put(HomePageController());

  var properties = [
    InternalProperty('https://www.99.co/id/panduan/wp-content/uploads/2023/05/08142152/Perumahan-Cibubur.jpg', 'Jl. Puncak Tarang no 34', 'Rumah Type 42/84', 2, 1, 42, 0.1, '10%', 315),
    InternalProperty('https://vistalandgroup.com/wp-content/uploads/2023/12/3d-render-rumah-GHI-afternoon-2-1024x705.jpg', 'Jl. Brawijaya no 14', 'Rumah Type 42/84', 2, 2, 50, 0.3, '30%', 425),
    InternalProperty('https://d3lfgix2a8jnun.cloudfront.net/custom-assets/9/rumah-murah-di-bandung-mahaba-village_63d2baa141eb1-W3E9beKSDXvAjt81XYSemAbxmhb1767wbgNbBhZl.jpg', 'Jl. Tangerang Raya no 23', 'Rumah Type 42/84', 1, 1, 40, 0.2, '20%', 395),
    InternalProperty('https://gardens.id/wp-content/uploads/2022/09/Evergreen-Type-96-Side-1.jpeg', 'Jl. Karang Ploso no 11', 'Rumah Type 42/84', 3, 2, 55, 0.1, '10%', 295),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
      Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo_transparent.png', width: 40,),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('VESPRO', style: GoogleFonts.lato().copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),),
                  Text('Property Trading', style: GoogleFonts.lato().copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),),
                ],
              ),
            ],
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () => controller.initPage(),
          child: controller.isLoading() ? ShimmerHome() : ListView(
            children: [
              SizedBox(
                height: 170,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    PageView(
                      controller: pageViewController,
                      children: [
                        Image.asset('assets/images/banner_1.png', fit: BoxFit.cover,),
                        Image.asset('assets/images/banner_2.png', fit: BoxFit.cover,),
                      ],
                    ),
                    Positioned(
                      bottom: 20,
                      child: SmoothPageIndicator(
                        controller: pageViewController,  // PageController
                        count:  2,
                        effect:  WormEffect(
                          dotHeight: 10,
                          dotWidth: 10,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text('Aksi Cepat', style: GoogleFonts.lato().copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              SizedBox(
                width: double.infinity,
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(width: 20,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        width: 250,
                        height: 80,
                        child: Image.asset('assets/images/banner_kecil_1.png', fit: BoxFit.cover,),
                      ),
                    ),
                    SizedBox(width: 10,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        width: 250,
                        height: 80,
                        child: Image.asset('assets/images/banner_kecil_2.png', fit: BoxFit.cover,),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text('Properti Populer', style: GoogleFonts.lato().copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),),
              ),
              SizedBox(height: 10,),
              SizedBox(
                height: 290,
                width: double.infinity,
                child: ListView.builder(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: properties.length,
                  itemBuilder: (BuildContext context, int index) => Card(
                    margin: EdgeInsets.only(right: 15, bottom: 5),
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
                  ),
                ),
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
