import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whistlerpride/widgets/bottom_navigationBar.dart';

import 'bOOKACCOMMODATIONS_screen.dart';
import 'controller/getPrideEvents_controller.dart';

class WhistlerPrideEatsScreen extends StatefulWidget {
  const WhistlerPrideEatsScreen({super.key});

  @override
  State<WhistlerPrideEatsScreen> createState() =>
      _WhistlerPrideEatsScreenState();
}

class _WhistlerPrideEatsScreenState extends State<WhistlerPrideEatsScreen> {

  final getPrideEatController = Get.put(GetPrideEventsController());
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
    getPrideEatController.getPrideEat().then((value) {
      for (var element in getPrideEatController.getGetPrideEatModel.value.data!.prideEatsLatLong!) {
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
        title:  Text(
          'Whistler Pride Eats',
    style: GoogleFonts.robotoSlab(
    fontSize: 16.0,
    color: Colors.black,
    fontWeight: FontWeight.w400,
        ),
      ),),

      body: Obx(() {
        return  getPrideEatController.statusOfGetPride.value.isSuccess ?
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
                        getPrideEatController.getGetPrideEatModel.value.data!.prideEatBanner.toString(),
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
                      getPrideEatController.getGetPrideEatModel.value.data!.prideEatsTitle.toString(),
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
                  "Your Table Awaits",
                  style: GoogleFonts.oswald(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                    itemCount: getPrideEatController.getGetPrideEatModel.value.data!.prideEats!.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var item = getPrideEatController.getGetPrideEatModel.value.data!.prideEats![index];
                      return GestureDetector(
                        onTap: () {
                          if (item.isAnotherUrl == true) {
                            launchURL(item.buttonUrl.toString());
                          } else {
                            Get.to(()=>const AccommodationScreen());
                          }
                        },
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10.0),

                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(11),
                                  boxShadow: [
                                    BoxShadow(blurRadius: 2, color: Colors.grey.shade200, offset: Offset(1, 1)),

                                  ]),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Left side: Image
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      item.prideEatImage.toString(),
                                      width: 130.0,
                                      height: 130,
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
                                          item.prideEatTitle.toString(),
                                          style: GoogleFonts.robotoSlab(
                                            fontSize: 15.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,

                                          ),
                                        ),

                                        Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                          item.prideEatDescription.toString().substring(0,70),
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
                                        Text(
                                          item.placeAndNumber.toString(),
                                          style: GoogleFonts.robotoSlab(
                                            fontSize: 10.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                          ],
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
        ) : const Center(child: CircularProgressIndicator(),);
      }),
    );
  }
}
