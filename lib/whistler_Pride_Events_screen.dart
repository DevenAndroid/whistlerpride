import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whistlerpride/parade_and_Community_Day_screen.dart';
import 'controller/getPrideEvents_controller.dart';
import 'dart:ui' as ui;

class WhistlerPrideEventsScreen extends StatefulWidget {
  const WhistlerPrideEventsScreen({super.key});

  @override
  State<WhistlerPrideEventsScreen> createState() => _WhistlerPrideEventsScreenState();
}

class _WhistlerPrideEventsScreenState extends State<WhistlerPrideEventsScreen> {
  final LatLng initialPosition = LatLng(50.1147609, -122.9600464);
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
              Get.back();
            },
            child:  Icon(Icons.arrow_back,color: Colors.black,)),
        title: const Text(
          'Whistler Pride Events',
          style: TextStyle(color: Colors.black, fontSize: 16),
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
                              getPrideEventsController.getPrideEventsModel.value.data!.whistlerBanner.toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.black, // Adjust opacity as needed
                        child: BackdropFilter(
                          filter: ui.ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
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
                          getPrideEventsController.getPrideEventsModel.value.data!.whistlerTitle.toString(),
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
                      'Multiple Events & Tickets',
                      style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 190,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: getPrideEventsController.getPrideEventsModel.value.data!.eventsTicketsLists!.length,
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            var item = getPrideEventsController.getPrideEventsModel.value.data!.eventsTicketsLists![index];
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
                                  Container(
                                    child: Image.network(
                                      item.eventTicketImage.toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 30,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
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
                                        item.eventTicketButtonName == '' ?  'Buy Ticket' : item.eventTicketButtonName.toString(),
                                        style: const TextStyle(fontSize: 10, color: Colors.white),
                                      ),
                                    )),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Event Schedule',
                          style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: const Color(0xffE025E7)),
                              ),
                              child: const CircleAvatar(
                                maxRadius: 15,
                                minRadius: 15,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                  color: Color(0xffE025E7),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: const Color(0xffE025E7)),
                              ),
                              child: const CircleAvatar(
                                maxRadius: 15,
                                minRadius: 15,
                                backgroundColor: Color(0xffE025E7),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 280,
                      child: ListView.builder(
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
                                    child: Image.network(
                                      item.eventImage.toString(),
                                      fit: BoxFit.cover,
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
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 8),
                                        ),
                                        TextSpan(text: '- ${item.eventDate.toString()}', style: TextStyle(fontSize: 8)),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    item.eventDescription.toString().substring(0, 70),
                                    style: TextStyle(color: Colors.black, fontSize: 10),
                                  ),
                                  const SizedBox(
                                    height: 5,
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
                                      child: const Center(
                                          child: Text(
                                        'Buy Tickets',
                                        style: TextStyle(fontSize: 10, color: Colors.white),
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
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
}
