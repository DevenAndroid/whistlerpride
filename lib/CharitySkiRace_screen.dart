import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'controller/charity_race_controller.dart';
import 'package:whistlerpride/widgets/bottom_navigationBar.dart';
import 'dart:ui' as ui;
import 'guidedSkiRideGruops_screen.dart';

class CharitySkiRaceScreen extends StatefulWidget {
  const CharitySkiRaceScreen({super.key});

  @override
  State<CharitySkiRaceScreen> createState() => _CharitySkiRaceScreenState();
}

class _CharitySkiRaceScreenState extends State<CharitySkiRaceScreen> {

  final getCharityController = Get.put(GetCharityRaceController());
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
        title: Text(
          'Charity Ski Race',
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
                    "Charity Sky Race",
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
                'RACE TO RAISE MONEY FOR CHARITY',
                style: GoogleFonts.oswald(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
               Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'Test your speed and try guessing your time in a friendly race that raises funds for QMUNITY, BC’s Queer, Trans, & Two-Spirit Resource Centre. Show us your sweet skiing or boarding moves as you zoom down the giant dual slalom Race Centre on Blackcomb Mountain.',
                      style:
                      GoogleFonts.robotoSlab(fontWeight: FontWeight.w300, fontSize: 11,height: 1.5,color: Colors.black),
                    ),
                    TextSpan(
                        text: 'Read More',
                        style:
                        GoogleFonts.robotoSlab(fontSize: 10, color: const Color(0xffE025E7),fontWeight: FontWeight.w600,)),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (index, context) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                minRadius: 5,
                                maxRadius: 5,
                                backgroundColor: Color(0xffE025E7),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Skiers and snowboarders welcome.',
                                style: GoogleFonts.robotoSlab(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ],
                      );
                    }),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Prizes will be available for pick-up from the Whistler Pride Welcome Centre at the Aava Hotel.',
                  style: GoogleFonts.robotoSlab(
                      color: Colors.black,
                      fontSize: 11,
                      fontWeight: FontWeight.w300),
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(11),
                      boxShadow: const [BoxShadow(blurRadius: 1)]),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Left side: Image
                      Container(
                        margin: const EdgeInsets.only(right: 16.0),
                        child: Image.asset(
                          'assets/images/imageis.png',
                          width: 130.0,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 10,)
                      ],
                    );
                  }),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Prizes will be available for pick-up from the Whistler Pride Welcome Centre at the Aava Hotel.',
                style: GoogleFonts.robotoSlab(
                    color: Colors.black,
                    fontSize: 11,
                    height: 1.5,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(height: 10,),
              Container(
                padding: const EdgeInsets.all(16.0),
                // margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(11),
                    boxShadow: const [BoxShadow(blurRadius: 1)]),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Left side: Image
                    Container(
                      margin: const EdgeInsets.only(right: 16.0),
                      child: Image.asset(
                        'assets/images/imageis.png',
                        width: 130.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                     Expanded(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'QMUNITY :-',
                              style: GoogleFonts.robotoSlab(
                                  color: Colors.black,
                                  fontSize: 11,
                                  height: 1.5,
                                  fontWeight: FontWeight.w600),
                            ),



                            TextSpan(
                              text:
                              'Since 1979,QMUNITY has existed as BC’s queer, trans, and Two-Spirit resource Centre. Show us your sweet.',
                              style: GoogleFonts.robotoSlab(
                                  color: Colors.black,
                                  fontSize: 10,
                                  height: 1.5,
                                  fontWeight: FontWeight.w300),),
                            TextSpan(
                              text: 'Read More',
                              style: TextStyle(
                                  color: Color(0xffE025E7),
                                  fontWeight: FontWeight.w600, fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Text(
                '2023 WINNERS',
                style: GoogleFonts.oswald(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10,),
              Text(
                'These are the winners for the 2023 Whistler Pride Charity Ski Race.. ',
                style: GoogleFonts.robotoSlab(
                    color: Colors.black,
                    fontSize: 11,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 10,),
              ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (index, context) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              minRadius: 5,
                              maxRadius: 5,
                              backgroundColor: Color(0xffE025E7),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                'Closest: Ian G. — Guessed Time: 24.82 Actual Time: 24.99',
                                style: GoogleFonts.robotoSlab(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w300),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                  'Closest: Ian G. — Guessed Time: 24.82 Actual Time: 24.99',
                                  style: GoogleFonts.robotoSlab(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    }),
                const SizedBox(height: 10,),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(11),
                      boxShadow: const [BoxShadow(blurRadius: 1)]),
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
                        SizedBox(height: 10,),
                      ],
                    );
                  }),
              const SizedBox(height: 10,),
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
                        Text(
                          'Whistler Pride ',
                          style: GoogleFonts.roboto(
                              color: const Color(0xFF000000),
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),

                        // Description
                        SizedBox(height: 8,),
                        Text(
                          'The social core of the week ufffffhigi\nThe social cofsfsffre of the week',
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
                                  'Reserve Your Spot',
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
              ],
            ),
          ),
        ) : const Center(child: CircularProgressIndicator(),);
      }),
    );
  }
}
