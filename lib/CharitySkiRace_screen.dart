import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui' as ui;
import 'controller/charity_race_controller.dart';

class CharitySkiRaceScreen extends StatefulWidget {
  const CharitySkiRaceScreen({super.key});

  @override
  State<CharitySkiRaceScreen> createState() => _CharitySkiRaceScreenState();
}

class _CharitySkiRaceScreenState extends State<CharitySkiRaceScreen> {

  final getCharityController = Get.put(GetCharityRaceController());
  GoogleMapController? controller;
  Set<Marker> markers = {};
  bool isExpanded = false;
  void addMarker({required LatLng position, required String title}) {
    markers.add(
      Marker(
        markerId: MarkerId(position.toString()),
        position: position,
        infoWindow: InfoWindow(title: title),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getCharityController.getCharityRace().then((value) {
      for (var element in getCharityController.getCharityModel.value.data!.eventLatLong!) {
        addMarker(
            title: element.eventTitle.toString(),
            position: element.latLong!
        );
      }
      setState(() {});
    });
  }
  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back, color: Colors.black,)),
        title: Text(
          'Charity Ski Race',
          style: GoogleFonts.robotoSlab(
              color: const Color(0xFF000000),
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),


      ),

      body: Obx(() {
        return getCharityController.statusOfGetCharity.value.isSuccess ?
          SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      height: Get.height * .26,
                      width: Get.width,
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(
                              0.4), // Replace with your desired color and opacity
                          BlendMode.srcATop,
                        ),
                        child: Image.network(
                          getCharityController.getCharityModel.value.data!.charityBanner.toString(),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.black, // Adjust opacity as needed
                    child: BackdropFilter(
                      filter:
                      ui.ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                      child: Container(
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    right: 10,
                    child: Text(
                      getCharityController.getCharityModel.value.data!.charityTitle.toString(),
                      style: GoogleFonts.robotoSlab(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  getCharityController.getCharityModel.value.data!.s2024WelcomingTitle.toString(),
                  style: GoogleFonts.oswald(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text:
                       getCharityController.getCharityModel.value.data!.s2024WelcomingDescription.toString().substring(0,120),
                        style:
                        GoogleFonts.robotoSlab(fontWeight: FontWeight.w300, fontSize: 11, height: 1.5, color: Colors.black),
                      ),
                      TextSpan(
                          text: 'Read More',
                          style:
                          GoogleFonts.robotoSlab(fontSize: 10, color: const Color(0xffE025E7), fontWeight: FontWeight
                              .w600,)),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (index, context) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                minRadius: 5,
                                maxRadius: 5,
                                backgroundColor: Color(0xffE025E7),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Skiers and snowboarders welcome.',
                                style: GoogleFonts.robotoSlab(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,)
                        ],
                      );
                    }),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Prizes will be available for pick-up from the Whistler Pride Welcome Centre at the Aava Hotel.',
                  style: GoogleFonts.robotoSlab(
                      color: Colors.black,
                      fontSize: 11,
                      height: 1.5,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  // margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(11),
                      boxShadow: const [BoxShadow(blurRadius: 1)]),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Left side: Image
                      Container(
                        margin: const EdgeInsets.only(right: 16.0),
                        child: Image.network(
                            getCharityController.getCharityModel.value.data!.s2024CompanyLogo.toString(),
                          width: 130.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '${getCharityController.getCharityModel.value.data!.s2024CompanyTitle.toString()} :-',
                                style: GoogleFonts.robotoSlab(
                                    color: Colors.black,
                                    fontSize: 11,
                                    height: 1.5,
                                    fontWeight: FontWeight.w600),
                              ),


                              TextSpan(
                                text:
                                getCharityController.getCharityModel.value.data!.s2024CompanyDescription.toString().substring(0,100),
                                style: GoogleFonts.robotoSlab(
                                    color: Colors.black,
                                    fontSize: 10,
                                    height: 1.5,
                                    fontWeight: FontWeight.w300),),
                              const TextSpan(
                                text: 'Read More',
                                style: TextStyle(
                                    color: Color(0xffE025E7),
                                    fontWeight: FontWeight.w600, fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                Text(
                  getCharityController.getCharityModel.value.data!.s2023WelcomingTitle.toString(),
                  style: GoogleFonts.oswald(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 10,),
                Text(
                  getCharityController.getCharityModel.value.data!.s2024CompanyDescription.toString(),
                  style: GoogleFonts.robotoSlab(
                      color: Colors.black,
                      fontSize: 11,
                      fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 10,),
                ListView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (index, context) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                minRadius: 5,
                                maxRadius: 5,
                                backgroundColor: Color(0xffE025E7),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                  'Closest: Ian G. — Guessed Time: 24.82 Actual Time: 24.99',
                                  style: GoogleFonts.robotoSlab(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                        ],
                      );
                    }),
                const SizedBox(height: 10,),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(11),
                      boxShadow: const [ BoxShadow(
                        color: Colors.black26,
                        offset: Offset(
                          0.5,
                          0.5,
                        ), //Offset
                        blurRadius: 0.5,
                        spreadRadius: 0.0,
                      ),
                      ]),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Left side: Image
                      Expanded(
                        child: ClipRRect(
                          child: Image.network(
                            getCharityController.getCharityModel.value.data!.s2023CompanyLogo.toString(),
                            width: 130.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 12,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 3,),
                            // Title
                            Text(
                              getCharityController.getCharityModel.value.data!.s2023CompanyTitle.toString(),
                              style: GoogleFonts.roboto(
                                  color: const Color(0xFF000000),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                        
                            // Description
                            SizedBox(height: 8,),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: getCharityController.getCharityModel.value.data!.s2023CompanyDescription.toString().substring(0,120),
                                    style:
                                    GoogleFonts.robotoSlab(fontWeight: FontWeight.w300, fontSize: 11, height: 1.5, color: Colors.black),
                                  ),
                                  TextSpan(
                                      text: 'Read More',
                                      style:
                                      GoogleFonts.robotoSlab(fontSize: 10, color: const Color(0xffE025E7), fontWeight: FontWeight
                                          .w600,)),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // Button
                            SizedBox(height: 8,),
                            InkWell(
                              onTap: () {
                                launchURL(     getCharityController.getCharityModel.value.data!.promoBtnUrl.toString());
                              },
                              child: Container(
                                height: 35,
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: const Color(0xffE025E7),
                                ),
                                child: Center(
                                    child: Text(
                                    getCharityController.getCharityModel.value.data!.promoBtnText.toString(),
                                      style: GoogleFonts.roboto(
                                          color: const Color(0xFFFFFFFF),
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 200,
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(target: markers.first.position, zoom: 14.0),
                    onMapCreated: (GoogleMapController controller) {
                    },
                    markers: markers,
                  ),
                ),
              ],
            ),
          ),
        ) : const Center(child: CircularProgressIndicator());
      }),
    );
  }
}
