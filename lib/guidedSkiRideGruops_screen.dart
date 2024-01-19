import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whistlerpride/whistlerPrideEats_Screen.dart';
import 'package:whistlerpride/widgets/bottom_navigationBar.dart';
import 'dart:ui' as ui;

import 'controller/charity_race_controller.dart';

class GuidedSkiRideGruopsScreen extends StatefulWidget {
  const GuidedSkiRideGruopsScreen({super.key});

  @override
  State<GuidedSkiRideGruopsScreen> createState() =>
      _GuidedSkiRideGruopsScreenState();
}

class _GuidedSkiRideGruopsScreenState extends State<GuidedSkiRideGruopsScreen> {

  final guideSkiController = Get.put(GetCharityRaceController());
  GoogleMapController? controller;
  Set<Marker> markers = {};
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
    guideSkiController.getGuideSkiFun().then((value) {
      for(var element in guideSkiController.getGuideSkiModel.value.data!.hostHotelLatLong!){
        addMarker(
            position: element.latLong!,
            title: element.eventTitle.toString());
      }
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
          'Guided Ski & Ride Gruops',
          style: GoogleFonts.robotoSlab(
              color: const Color(0xFF000000),
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
      ),

      body: Obx(() {
        return guideSkiController.statusOfGetGuidePride.value.isSuccess ?
          SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(
                          0.4), // Replace with your desired color and opacity
                      BlendMode.srcATop,
                    ),
                    child: SizedBox(
                      height: Get.height * .26,
                      width: Get.width,
                      child: Image.network(
                        guideSkiController.getGuideSkiModel.value.data!.guidedSkiRideBanner.toString(),
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
                    guideSkiController.getGuideSkiModel.value.data!.guidedSkiRideTitle.toString(),
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
                guideSkiController.getGuideSkiModel.value.data!.guidedSkiRideMoreTitle.toString(),
                style: GoogleFonts.oswald(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left side: Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        guideSkiController.getGuideSkiModel.value.data!.guidedSkiRideBanner.toString(),
                        width: 130.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 12,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 3,),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: guideSkiController.getGuideSkiModel.value.data!.guidedSkiRideMoreDescription.toString().substring(0,70),
                                  style: GoogleFonts.robotoSlab(
                                      color: Colors.black,
                                      fontSize: 11,
                                
                                      fontWeight: FontWeight.w300),
                                ),
                                TextSpan(
                                  text: ' Read More',
                                  style: GoogleFonts.robotoSlab(
                                      color: Color(0xFFE025E7),
                                      fontSize: 10,
                                
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // Button
                          SizedBox(height: 8,),
                          GestureDetector(
                            onTap: () {
                              launchURL(  guideSkiController.getGuideSkiModel.value.data!.guidedSkiRideButtonUrl.toString());
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
                                    guideSkiController.getGuideSkiModel.value.data!.guidedSkiRideButtonTitle == '' ? 'Register' : guideSkiController.getGuideSkiModel.value.data!.guidedSkiRideButtonTitle.toString(),
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
                height: 10,
              ),
              Text(
                'OUR TICKETS & RENTALS',
                style: GoogleFonts.oswald(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                  itemCount: guideSkiController.getGuideSkiModel.value.data!.ticketAndRentals!.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var item = guideSkiController.getGuideSkiModel.value.data!.ticketAndRentals![index];
                    return Column(
                      children: [
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
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  item.ticketAndRentalsImage.toString(),
                                  width: 130.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 12,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 3,),
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text:   item.ticketAndRentalsDescription.toString().substring(0,70),
                                            style: GoogleFonts.robotoSlab(
                                                color: Colors.black,
                                                fontSize: 11,
                                
                                                fontWeight: FontWeight.w300),
                                          ),
                                          TextSpan(
                                            text: ' Read More',
                                            style: GoogleFonts.robotoSlab(
                                                color: Color(0xFFE025E7),
                                                fontSize: 10,
                                
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    // Button
                                    SizedBox(height: 8,),
                                    GestureDetector(
                                      onTap: () {
                                        if (item.isAnotherUrl == true) {
                                          launchURL(item.buttonUrl.toString());
                                        } else {
                                          // Get.to(() => const ParadeandCommunityDayScreen());
                                        }
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
                                                item.buttonName == '' ? 'LIFT TICKETS' : item.buttonName.toString(),
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
                        SizedBox(height: 13,),
                      ],
                    );
                  }),
              const SizedBox(
                height: 10,
              ),
              // SizedBox(
              //   height: 200,
              //   child: GoogleMap(
              //     initialCameraPosition: CameraPosition(target: markers.first.position, zoom: 14.0),
              //     onMapCreated: (GoogleMapController controller) {
              //     },
              //     markers: markers,
              //   ),
              // ),
            ],
          ),
        ) : const Center(child: CircularProgressIndicator(),);
      }),
    );
  }
}
