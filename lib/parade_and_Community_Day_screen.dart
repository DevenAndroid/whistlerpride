import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui' as ui;

import 'controller/charity_race_controller.dart';

class ParadeandCommunityDayScreen extends StatefulWidget {
  const ParadeandCommunityDayScreen({super.key});

  @override
  State<ParadeandCommunityDayScreen> createState() => _ParadeandCommunityDayScreenState();
}

class _ParadeandCommunityDayScreenState extends State<ParadeandCommunityDayScreen> {
  ScrollController _scrollController = ScrollController();
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

  final getCharityController = Get.put(GetCharityRaceController());
  @override
  void initState() {
    super.initState();
    getCharityController.getParade().then((value) {
      for(var element in getCharityController.getParadeModel.value.data!.hostHotelLatLong!){
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
            child: const Icon(Icons.arrow_back, color: Colors.black,)),
        title: Text(
          'Parade and Community Day',
          style: GoogleFonts.robotoSlab(
              color: const Color(0xFF000000),
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
      ),


      body: Obx(() {
        return  getCharityController.statusOfGetParade.value.isSuccess ?
          SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
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
                      child: Image.network(
                        getCharityController.getParadeModel.value.data!.paradeCommunityBanner.toString(),
                        fit: BoxFit.cover,
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
                      getCharityController.getParadeModel.value.data!.paradeCommunityTitle.toString(),
                      style: GoogleFonts.robotoSlab(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ]),


                const SizedBox(height: 20,),
                SizedBox(
                    width: 230,
                    child: Image.asset("assets/images/td.png")),
                const SizedBox(height: 10,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Whistler Pride Celebration',
                      style: GoogleFonts.oswald(
                          color: const Color(0xFF000000),
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            _scrollListView(-2);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: const Color(0xffE025E7)),
                            ),
                            child: const CircleAvatar(
                              maxRadius: 15,
                              minRadius: 15,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 15,
                                color: Color(0xffE025E7),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            _scrollListView(2);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: const Color(0xffE025E7)),
                            ),
                            child: const CircleAvatar(
                              maxRadius: 15,
                              minRadius: 15,
                              backgroundColor: Color(0xffE025E7),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30,),


                SizedBox(
                  height: Get.height*.25,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                      controller: _scrollController,
                      itemCount:  getCharityController.getParadeModel.value.data!.prideCelebrationLists!.length,
                      physics: const AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var item =  getCharityController.getParadeModel.value.data!.prideCelebrationLists![index];
                        return
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                 width : 340,
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
                                        item.celebrationImage.toString(),
                                        width: 130.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(width: 12,),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 3,),
                                          // Title
                                          Text(
                                            item.celebrationTitle.toString(),
                                            style: GoogleFonts.roboto(
                                                color: const Color(0xFF000000),
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                      
                                          // Description
                                          const SizedBox(height: 8,),
                                          Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text:
                                                  item.celebrationDescription.toString().substring(0,50),
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
                                          const SizedBox(height: 8,),
                                          InkWell(
                                            onTap: () {
                                              launchURL(  item.celebrationButtonUrl.toString());
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
                                                    item.celebrationButtonName == '' ?  'Event Ticket' : item.celebrationButtonName.toString(),
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
                              const SizedBox(width: 10,),
                            ],
                          );
                      }),
                ),

                const SizedBox(height: 20,),
                Text(
                  'Events Registration',
                  style: GoogleFonts.oswald(
                      color: const Color(0xFF000000),
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20,),
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
                            getCharityController.getParadeModel.value.data!.youthProgrammingImage.toString(),
                          width: 130.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 3,),
                            // Title
                            Text(
                              getCharityController.getParadeModel.value.data!.youthProgrammingTitle.toString(),
                              style: GoogleFonts.roboto(
                                  color: const Color(0xFF000000),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                        
                            // Description
                            const SizedBox(height: 8,),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: getCharityController.getParadeModel.value.data!.youthProgrammingDescription.toString().substring(0,50),
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
                            const SizedBox(height: 8,),
                            InkWell(
                              onTap: () {
                                launchURL( getCharityController.getParadeModel.value.data!.youthProgrammingButtonUrl.toString());
                              },
                              child: Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: const Color(0xffE025E7),
                                ),
                                padding: const EdgeInsets.all(6),
                                child: Center(
                                    child: Text(
                                      getCharityController.getParadeModel.value.data!.youthProgrammingButtonName == '' ?  'Youth Programming Info' :  getCharityController.getParadeModel.value.data!.youthProgrammingButtonName.toString(),
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
          ),
        ): const Center(child: CircularProgressIndicator(),);
      }),
    );
  }

  void _scrollListView(int direction) {
    // Calculate the new scroll offset based on the current position and direction
    double newOffset = _scrollController.offset + (direction * 50.0);

    // Scroll to the new offset with animation
    _scrollController.animateTo(
      newOffset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
