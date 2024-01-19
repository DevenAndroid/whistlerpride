import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whistlerpride/widgets/bottom_navigationBar.dart';

import 'bOOKACCOMMODATIONS_screen.dart';
import 'controller/getPrideEvents_controller.dart';

class WhistlerThingsScreen extends StatefulWidget {
  const WhistlerThingsScreen({super.key});

  @override
  State<WhistlerThingsScreen> createState() =>
      _WhistlerThingsScreenState();
}

class _WhistlerThingsScreenState extends State<WhistlerThingsScreen> {

  final getThingsController = Get.put(GetPrideEventsController());
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
    getThingsController.getThingsToDo().then((value) {
      for (var element in getThingsController.getThingsToDoModel.value.data!.hostHotelLatLong!) {
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
          'Things To Do In Whistler',
          style: GoogleFonts.robotoSlab(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
      ),

      body: Obx(() {
        return     getThingsController.statusOfGetThingsToDo.value.isSuccess ?
          SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(10),
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
                        getThingsController.getThingsToDoModel.value.data!.thingsInWhistlerBanner.toString(),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    top: Get.height*.18,
                    left: 10,
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      getThingsController.getThingsToDoModel.value.data!.thingsInWhistlerTitle.toString(),
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
                  getThingsController.getThingsToDoModel.value.data!.experienceMoreTitle.toString(),
                  style: GoogleFonts.oswald(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),

                const SizedBox(
                  height: 10,
                ),
                Text(
                  getThingsController.getThingsToDoModel.value.data!.experienceMoreDescription.toString(),
                  style: GoogleFonts.robotoSlab(
                      color: Colors.black,
                      fontSize: 11,
                      height: 1.7,
                      fontWeight: FontWeight.w300),
                ),
                const SizedBox(
                  height: 15,
                ),
                ListView.builder(
                    itemCount: getThingsController.getThingsToDoModel.value.data!.thingsWhistlerLists!.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var item = getThingsController.getThingsToDoModel.value.data!.thingsWhistlerLists![index];
                      return GestureDetector(
                        onTap: () {
                          if (item.isAnotherUrl == true) {
                            launchURL(item.buttonUrl.toString());
                          } else {
                            Get.to(()=>const BOOKACCOMMODATIONSScreen());
                          }
                        },
                        child:  Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10.0),

                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(11),
                                  boxShadow: [
                                    BoxShadow(blurRadius: 2, color: Colors.grey.shade200, offset: Offset(2, 2)),

                                  ]),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Left side: Image
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      item.thingsWhistlerImage.toString(),
                                      width: 110.0,
                                      height: 110,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        // Title
                                        Text(
                                          item.thingsWhistlerTitle.toString(),
                                          style: GoogleFonts.robotoSlab(
                                            fontSize: 15.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,

                                          ),
                                        ),
                            SizedBox(height: 10,),
                                        Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                item.thingsWhistlerDescription.toString().substring(0,120),
                                                style: GoogleFonts.robotoSlab(
                                                    fontWeight: FontWeight.w300,
                                                    color: Colors.black,
                                                    fontSize: 11),
                                              ),
                                              TextSpan(
                                                text: ' Read More',
                                                style: GoogleFonts.robotoSlab(
                                                    color: Color(0xffE025E7),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 10),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        // Button

                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10,)
                          ],
                        ),



                        // Container(
                        //   padding: const EdgeInsets.all(7.0),
                        //   margin: const EdgeInsets.all(6),
                        //   decoration: BoxDecoration(
                        //       color: Colors.white,
                        //       borderRadius: BorderRadius.circular(11),
                        //       boxShadow: const [
                        //         BoxShadow(
                        //           color: Colors.black26,
                        //           offset: Offset(
                        //             0.5,
                        //             0.5,
                        //           ), //Offset
                        //           blurRadius: 0.5,
                        //           spreadRadius: 0.0,
                        //         ),
                        //       ]),
                        //   child: Row(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       // Left side: Image
                        //       Container(
                        //         margin: const EdgeInsets.only(right: 16.0),
                        //         child: Image.network(
                        //             item.thingsWhistlerImage.toString(),
                        //           width: 110.0,
                        //           fit: BoxFit.cover,
                        //         ),
                        //       ),
                        //       Expanded(
                        //         child: Column(
                        //           crossAxisAlignment: CrossAxisAlignment.start,
                        //           children: [
                        //             SizedBox(
                        //               height: 10,
                        //             ),
                        //             // Title
                        //             Text(
                        //               item.thingsWhistlerTitle.toString(),
                        //               style: GoogleFonts.roboto(
                        //                 color: Colors.black,
                        //                 fontSize: 15,
                        //
                        //                 fontWeight: FontWeight.w500),
                        //             ),
                        //             SizedBox(
                        //               height: 10,
                        //             ),
                        //             Text.rich(
                        //               TextSpan(
                        //                 children: [
                        //                   TextSpan(
                        //                     text:
                        //               item.thingsWhistlerDescription.toString().substring(0,70),
                        //                     style: GoogleFonts.robotoSlab(
                        //                         color: Colors.black,
                        //                         fontSize: 11,
                        //
                        //                         fontWeight: FontWeight.w300),
                        //                   ),
                        //                   TextSpan(
                        //                     text: ' Read More',
                        //                     style: GoogleFonts.robotoSlab(
                        //                         color: Color(0xFFE025E7),
                        //                         fontSize: 10,
                        //
                        //                         fontWeight: FontWeight.w600),
                        //                   ),
                        //                 ],
                        //               ),
                        //             ),
                        //
                        //             // Button
                        //
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      );
                    }),
                const SizedBox(
                  height: 10,
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
        ) : const Center(child:  CircularProgressIndicator(),);
      }),
    );
  }
}
