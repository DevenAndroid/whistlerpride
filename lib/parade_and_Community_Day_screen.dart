import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whistlerpride/widgets/bottom_navigationBar.dart';
import 'dart:ui' as ui;
import 'CharitySkiRace_screen.dart';

class ParadeandCommunityDayScreen extends StatefulWidget {
  const ParadeandCommunityDayScreen({super.key});

  @override
  State<ParadeandCommunityDayScreen> createState() => _ParadeandCommunityDayScreenState();
}

class _ParadeandCommunityDayScreenState extends State<ParadeandCommunityDayScreen> {
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
          'Parade and Community Day',
          style: GoogleFonts.robotoSlab(
              color: const Color(0xFF000000),
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
      ),


      body: SingleChildScrollView(
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
                    "Parade and community Day",
                    style: GoogleFonts.robotoSlab(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ]),




              const SizedBox(height: 20,),
              SizedBox(
                  width: 250,
                  child: Image.asset("assets/images/TD.png")),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Whistler Pride Celebration',
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
                height: 150,
// width: 100,
                child: ListView.builder(
                  itemCount: 10,
                  physics: const AlwaysScrollableScrollPhysics(),
shrinkWrap: true,

                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(9.0),

                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(11),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(
                                  0.2,
                                  0.2,
                                ),
                                blurRadius: 1,

                              ),
                            ]
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Left side: Image
                            Container(
                              margin: const EdgeInsets.only(right: 16.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(11),
                                child: Image.asset(
                                  'assets/images/image.png',
                                  width: 130.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Title
                                Text(
                                  "3:00 PM – MEET & GREET AT SKIER’S PLAZA",
                                  style: GoogleFonts.roboto(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Skier’s Plaza at the base of Whistler will be buzzing with",
                                        style: GoogleFonts.robotoSlab(
                                            color: Colors.black,
                                            fontSize: 11,
                                            height: 1.6,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      TextSpan(
                                        text: ' Read More',
                                        style: GoogleFonts.robotoSlab(
                                            color: Color(0xFFE025E7),
                                            fontSize: 11,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                // Button
                                Container(
                                  height: 35,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(3),
                                    color: const Color(0xffE025E7),
                                  ),
                                  child: Center(
                                      child: Text(
                                        "wetgeryrh",

                                        style: GoogleFonts.roboto(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600),
                                      )),
                                )

                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Container(
            padding: const EdgeInsets.all(9.0),

            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(11),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(
                      0.2,
                      0.2,
                    ),
                    blurRadius: 1,

                  ),
                ]
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left side: Image
                Container(
                  margin: const EdgeInsets.only(right: 16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(11),
                    child: Image.asset(
                      'assets/images/image.png',
                      width: 130.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      "3:00 PM – MEET & GREET AT SKIER’S PLAZA",
                      style: GoogleFonts.roboto(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Skier’s Plaza at the base of Whistler will be buzzing with",
                            style: GoogleFonts.robotoSlab(
                                color: Colors.black,
                                fontSize: 11,
                                height: 1.6,
                                fontWeight: FontWeight.w300),
                          ),
                          TextSpan(
                            text: ' Read More',
                            style: GoogleFonts.robotoSlab(
                                color: Color(0xFFE025E7),
                                fontSize: 11,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Button
                    Container(
                      height: 35,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(3),
                        color: const Color(0xffE025E7),
                      ),
                      child: Center(
                          child: Text(
                            "wetgeryrh",

                            style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w600),
                          )),
                    )

                  ],
                ),
              ],
            ),
          ),
        ),
              Container(
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.all(10),
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
                    ),]),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left side: Image
                    Container(
                      margin: const EdgeInsets.only(right: 16.0),
                      child: Image.asset(
                        'assets/images/image.png',
                        width: 130.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title
                          const Text(
                            'Ski & Ride Groups',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          // Description
                          const Text(
                            'The social core of the week, the free daily guided ski and snowboard groups Read More',
                            style: TextStyle(
                              fontSize: 10.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // Button
                          InkWell(
                            onTap: (){
                              Get.to(const CharitySkiRaceScreen());
                            },
                            child: Container(
                              height: 35,
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: const Color(0xffE025E7),
                              ),
                              child: const Center(
                                  child: Text(
                                    'Reserve Your Spot',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                'Events Registration',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.all(10),
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
                    ),]),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left side: Image
                    Container(
                      margin: const EdgeInsets.only(right: 16.0),
                      child: Image.asset(
                        'assets/images/image.png',
                        width: 130.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title
                          const Text(
                            'Whistler Pride Youth Social',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          // Description
                          const Text(
                            'The social core of the week, the free daily guided ski and snowboard groups Read More',
                            style: TextStyle(
                              fontSize: 10.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // Button
                          InkWell(
                            onTap: (){
                            },
                            child: Container(
                              height: 35,
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: const Color(0xffE025E7),
                              ),
                              child: const Center(
                                  child: Text(
                                    'Reserve Your Spot',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
