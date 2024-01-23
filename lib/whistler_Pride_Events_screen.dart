import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whistlerpride/parade_and_Community_Day_screen.dart';
import 'package:whistlerpride/widgets/bottom_navigationBar.dart';
import 'controller/getPrideEvents_controller.dart';
import 'dart:ui' as ui;

class WhistlerPrideEventsScreen extends StatefulWidget {
  const WhistlerPrideEventsScreen({super.key});

  @override
  State<WhistlerPrideEventsScreen> createState() => _WhistlerPrideEventsScreenState();
}

class _WhistlerPrideEventsScreenState extends State<WhistlerPrideEventsScreen> {
  final LatLng initialPosition = LatLng(50.1147609, -122.9600464);
  ScrollController _scrollController = ScrollController();
  GoogleMapController? controller;
  Set<Marker> markers = {};

  final getPrideEventsController = Get.put(GetPrideEventsController());
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
    getPrideEventsController.getPrideEvents().then((value) {
      for (var element in getPrideEventsController.getPrideEventsModel.value.data!.eventLatLong!) {
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
              Get.to(BottomNavbar());
            },
            child:  Icon(Icons.arrow_back,color: Colors.black,)),
        title:  Text(
          'Whistler Pride Events',
            style: GoogleFonts.oswald(
            color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w400),
        ),
      ),
      body: Obx(() {
        return getPrideEventsController.statusOfGetEvents.value.isSuccess
            ? SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: SizedBox(
                          height: Get.height * .23,
                          width: Get.width,
                          child: Image.network(
                            getPrideEventsController.getPrideEventsModel.value.data!.whistlerBanner.toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned.fill(
                        top: Get.height*.17,
                        left: 10,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.start,
                          getPrideEventsController.getPrideEventsModel.value.data!.whistlerTitle.toString(),
                          style: GoogleFonts.oswald(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),


                    ]),

                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Multiple Events & Tickets',
                      style: GoogleFonts.oswald(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: 175,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: getPrideEventsController.getPrideEventsModel.value.data!.eventsTicketsLists!.length,
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            var item = getPrideEventsController.getPrideEventsModel.value.data!.eventsTicketsLists![index];
                            return Row(
                              children: [
                                Container(
                                  width: 162,
                                  height: 169,
                                  padding: const EdgeInsets.all(10.0),

                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(
                                            0.5,
                                            0.5,
                                          ), //Offset
                                          blurRadius: 0.5,
                                          spreadRadius: 0.0,
                                        ),
                                      ]),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Left side: Image
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          item.eventTicketImage.toString(),
                                          fit: BoxFit.fill,
                                          height: 100,
                                          width: 145,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 30,
                                        width: 90,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: const Color(0xffE025E7),
                                        ),
                                        child: Center(
                                            child: InkWell(
                                          onTap: () {
                                            if (item.isAnotherUrl == true) {
                                              launchURL(item.eventTicketButtonUrl.toString());
                                            } else {
                                              Get.to(() => const ParadeandCommunityDayScreen());
                                            }
                                          },
                                          child: Text(
                                            item.eventTicketButtonName.toString(),
                                            style: GoogleFonts.roboto(
                                                color: Colors.white,
                                                fontSize: 11,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        )),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10,),
                              ],
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text(
                          'Event Schedule',
                          style: GoogleFonts.oswald(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: (){
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
                              onTap: (){
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
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                          controller: _scrollController,
                          scrollDirection: Axis.horizontal,
                          itemCount: getPrideEventsController.getPrideEventsModel.value.data!.eventScheduleLists!.length,
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            var item = getPrideEventsController.getPrideEventsModel.value.data!.eventScheduleLists![index];
                            return Container(
                              width: 160,
                              padding: const EdgeInsets.all(16.0),
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(
                                        0.5,
                                        0.5,
                                      ), //Offset
                                      blurRadius: 0.5,
                                      spreadRadius: 0.0,
                                    ),
                                  ]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Left side: Image
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        item.eventImage.toString(),
                                        fit: BoxFit.fill,
                                        width: 300,
                                        height: 130,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: item.eventTitle.toString(),
                                          style: GoogleFonts.robotoSlab(
                                              color: Colors.black,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        TextSpan(text: '- ${item.eventDate.toString()}',
                                          style: GoogleFonts.robotoSlab(
                                              color: Colors.black,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500),),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: item.eventDescription.toString().substring(0, 70),
                                          style: GoogleFonts.robotoSlab(
                                              color: Colors.black,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        TextSpan(text: 'Read more',
                                          style: GoogleFonts.robotoSlab(
                                              color: Color(0xFFE025E7),
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600),),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 9,
                                  ),

                                  InkWell(
                                    onTap: () {
                                      if (item.isAnotherUrl == true) {
                                        launchURL(item.eventsBookLink.toString());
                                      } else {
                                        // Get.to(() => const ParadeandCommunityDayScreen());
                                      }
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 90,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color: const Color(0xffE025E7),
                                      ),
                                      child:  Center(
                                          child: Text(
                                        'Buy Tickets',
                                            style: GoogleFonts.robotoSlab(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontWeight: FontWeight.w600),
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 14,
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
              )
            : const Center(child: CircularProgressIndicator());
      }),
    );
  }
  void _scrollListView(int direction) {
    // Calculate the new scroll offset based on the current position and direction
    double newOffset = _scrollController.offset + (direction * 50.0);

    // Scroll to the new offset with animation
    _scrollController.animateTo(
      newOffset,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
