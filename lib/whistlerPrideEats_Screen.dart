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

  @override
  void initState() {
    super.initState();
    getPrideEatController.getPrideEat();
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
        title: const Text(
          'Whistler Pride Eats',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),

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
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: SizedBox(
                    height: Get.height * .26,
                    width: Get.width,
                    child: Image.network(
                      getPrideEatController.getGetPrideEatModel.value.data!.prideEatBanner.toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  getPrideEatController.getGetPrideEatModel.value.data!.prideEatsTitle.toString(),
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
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(11),
                              boxShadow: [
                                BoxShadow(blurRadius: 5, color: Colors.grey.shade200, offset: Offset(2, 2)),

                              ]),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Left side: Image
                              Container(
                                margin: const EdgeInsets.only(right: 16.0),
                                child: Image.network(
                                  item.prideEatImage.toString(),
                                  width: 130.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Title
                                    Text(
                                      item.prideEatTitle.toString(),
                                      style: GoogleFonts.robotoSlab(
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.w300,

                                      ),
                                    ),

                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                      item.prideEatDescription.toString().substring(0,70),
                                            style: GoogleFonts.robotoSlab(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 10),
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
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),

              ],
            ),
          ),
        ) : const Center(child: CircularProgressIndicator(),);
      }),
    );
  }
}
