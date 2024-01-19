import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whistlerpride/widgets/bottom_navigationBar.dart';

import 'bOOKACCOMMODATIONS_screen.dart';
import 'controller/getPrideEvents_controller.dart';

class YouthProgrammingScreen extends StatefulWidget {
  const YouthProgrammingScreen({super.key});

  @override
  State<YouthProgrammingScreen> createState() =>
      _YouthProgrammingScreenState();
}

class _YouthProgrammingScreenState extends State<YouthProgrammingScreen> {

  final getYouthProgramController = Get.put(GetPrideEventsController());
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
    getYouthProgramController.getYouthProgramming().then((value) {
      for (var element in getYouthProgramController.getYouthProgramModel.value.data!.hostHotelLatLong!) {
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
          'Youth Programming',
          style: GoogleFonts.robotoSlab(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
      ),

      body: Obx(() {
        return  getYouthProgramController.statusOfGetYouthProgram.value.isSuccess ?
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
                      height: Get.height * .26,
                      width: Get.width,
                      child: Image.network(
                        getYouthProgramController.getYouthProgramModel.value.data!.youthProgrammingBanner.toString(),
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
                      getYouthProgramController.getYouthProgramModel.value.data!.youthProgrammingTitle.toString(),
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
              getYouthProgramController.getYouthProgramModel.value.data!.welcomingTitle.toString(),
                  style: GoogleFonts.oswald(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),

                const SizedBox(
                  height: 10,
                ),
                Text(
                getYouthProgramController.getYouthProgramModel.value.data!.welcomingDescription.toString(),
                  style: GoogleFonts.robotoSlab(
                      color: Colors.black,
                      fontSize: 11,
                      height: 1.7,
                      fontWeight: FontWeight.w300),
                ),
                ListView.builder(
                    itemCount: getYouthProgramController.getYouthProgramModel.value.data!.youthProgrammings!.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                     var item = getYouthProgramController.getYouthProgramModel.value.data!.youthProgrammings![index];
                      return GestureDetector(
                        onTap: () {
                          if (item.isAnotherUrl == true) {
                            launchURL(item.buttonUrl.toString());
                          } else {
                            Get.to(()=>const AccommodationScreen());
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(7.0),
                          margin: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(11),
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
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Left side: Image
                              Container(
                                margin: const EdgeInsets.only(right: 16.0),
                                child: Image.network(
                                  item.programmingImage.toString(),
                                  width: 110.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    // Title
                                    Text(
                                      item.programmingTitle.toString(), style: GoogleFonts.roboto(
                                        color: Colors.black,
                                        fontSize: 15,

                                        fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                           item.programmingDescription.toString().substring(0,70),
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
                                    SizedBox(height: 6,),
                                    Text(
                                     item.dateAndPlace.toString(), style: GoogleFonts.robotoSlab(
                                        color: Colors.black,
                                        fontSize: 10,

                                        fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(height: 4,),


                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
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
        ): const Center(child: CircularProgressIndicator());
      }),
    );
  }
}
