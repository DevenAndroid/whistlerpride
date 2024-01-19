import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:whistlerpride/whistlerPrideEats_Screen.dart';
import 'package:whistlerpride/widgets/bottom_navigationBar.dart';
import 'dart:ui' as ui;
class GuidedSkiRideGruopsScreen extends StatefulWidget {
  const GuidedSkiRideGruopsScreen({super.key});

  @override
  State<GuidedSkiRideGruopsScreen> createState() =>
      _GuidedSkiRideGruopsScreenState();
}

class _GuidedSkiRideGruopsScreenState extends State<GuidedSkiRideGruopsScreen> {
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

        title:  Text(
          'Guided Ski & Ride Gruops',
          style: GoogleFonts.robotoSlab(
              color: const Color(0xFF000000),
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
      ),

      body: SingleChildScrollView(
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
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(
                  0.4), // Replace with your desired color and opacity
              BlendMode.srcATop,
            ),
            child: Image.asset(
              'assets/images/imagess.png',
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
            child:  Text(
              "Guided Ski & Ride gruops",
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
                'SIGN UP FOR SKI & RIDE GROUPS',
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
                      child: Image.asset(
                        'assets/images/image.png',
                        width: 130.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 12,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 3,),
                        // Title

                        // Description

                        Text(
                          'The social core of the week ufffffhigi\nThe social cofsfsffre of the week\nThe social core of the week ufffffhigi',
                          style: GoogleFonts.roboto(
                              color: const Color(0xFF000000),
                              fontSize: 11,
                              fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // Button
                        SizedBox(height: 8,),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 35,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: const Color(0xffE025E7),
                            ),
                            child:  Center(
                                child: Text(
                                  'Register',
                                  style: GoogleFonts.roboto(
                                      color: const Color(0xFFFFFFFF),
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600),
                                )),
                          ),
                        ),
                      ],
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
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (index, context) {
                    return      Column(
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Left side: Image
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'assets/images/image.png',
                                  width: 130.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 12,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 3,),
                                  // Title

                                  // Description

                                  Text(
                                    'The social core of the week ufffffhigi\nThe social cofsfsffre of the week\nThe social core of the week ufffffhigi',
                                    style: GoogleFonts.roboto(
                                        color: const Color(0xFF000000),
                                        fontSize: 11,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  // Button
                                  SizedBox(height: 8,),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 35,
                                      width: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color: const Color(0xffE025E7),
                                      ),
                                      child:  Center(
                                          child: Text(
                                            'Register',
                                            style: GoogleFonts.roboto(
                                                color: const Color(0xFFFFFFFF),
                                                fontSize: 11,
                                                fontWeight: FontWeight.w600),
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 13,),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
