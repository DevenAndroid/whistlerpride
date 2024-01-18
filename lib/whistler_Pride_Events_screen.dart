import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whistlerpride/parade_and_Community_Day_screen.dart';
import 'controller/getPrideEvents_controller.dart';


class WhistlerPrideEventsScreen extends StatefulWidget {
  const WhistlerPrideEventsScreen({super.key});

  @override
  State<WhistlerPrideEventsScreen> createState() => _WhistlerPrideEventsScreenState();
}

class _WhistlerPrideEventsScreenState extends State<WhistlerPrideEventsScreen> {

  final LatLng initialPosition = LatLng(50.1147609, -122.9600464);
  GoogleMapController? controller;
  Set<Marker> markers = Set();

  final getPrideEventsController = Get.put(GetPrideEventsController());
   bool isExpanded = false;
  void addMarker(LatLng position, String title, String snippet) {
    setState(() {
      markers.add(
        Marker(
          markerId: MarkerId(position.toString()),
          position: position,
          infoWindow: InfoWindow(title: title, snippet: snippet),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
        ),
      );
    });
  }
  List<LatLng> markerLocations = [];
  void addMarkers() {
    for (LatLng markerLocation in markerLocations) {
      addMarker(markerLocation, 'Marker Title', 'Marker Description');
    }
  }
@override
  void initState() {
    super.initState();
    getPrideEventsController.getPrideEvents();
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
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back)),
        title: const Text(
          'Whistler Pride Events',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: CustomBottomNavigationBar
      //       .build()
      //       .items,
      // ),
      body: Obx(() {
        return getPrideEventsController.statusOfGetEvents.value.isSuccess ?
          SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                 borderRadius: BorderRadius.circular(6),
                child: SizedBox(
                  height: Get.height*.26,
                  width: Get.width,
                  child: Image.network(getPrideEventsController.getPrideEventsModel.value.data!.whistlerBanner.toString(),
                  fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10,),
               Text(
                'Multiple Events & Tickets',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 190,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: getPrideEventsController.getPrideEventsModel.value.data!.eventsTicketsLists!.length,
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var item =  getPrideEventsController.getPrideEventsModel.value.data!.eventsTicketsLists![index];
                      return Container(
                        width: 160,
                        padding: const EdgeInsets.all(16.0),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [BoxShadow(
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
                            const SizedBox(height: 10,),
                            Container(
                              height: 30,
                              width: 90,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(3),
                                color: const Color(0xffE025E7),

                              ),
                              child: Center(
                                  child: InkWell(
                                    onTap: () {
                                      if(item.isAnotherUrl == true){
                                        launchURL(item.eventTicketButtonUrl.toString());
                                      }
                                      else{
                                        Get.to(()=>const ParadeandCommunityDayScreen());
                                      }
                                    },
                                    child:  Text(
                                      item.eventTicketButtonName.toString(),
                                      style: const TextStyle(
                                          fontSize: 10, color: Colors.white),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Event Schedule',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
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
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 8),
                                  ),
                                  TextSpan(
                                      text:
                                      '- ${item.eventDate.toString()}',
                                      style: TextStyle(fontSize: 8)),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                             Text(
                               item.eventDescription.toString().substring(0, 70),
                              style: TextStyle(
                                  color: Colors.black, fontSize: 10),
                            ),
                            const SizedBox(
                              height: 5,
                            ),

                            InkWell(
                              onTap: () {},
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
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.white),
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
                        initialCameraPosition: CameraPosition(target: markerLocations.first, zoom: 14.0),
                        onMapCreated: (GoogleMapController controller) {
                          controller = controller;
                          addMarkers();
                        },
                        markers: markers,
                      ),
                    ),
                  ],
          ),
        ) : const Center(child: CircularProgressIndicator());
      }),
    );
  }
}
