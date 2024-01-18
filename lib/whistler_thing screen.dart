import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whistlerpride/widgets/bottom_navigationBar.dart';

import 'bOOKACCOMMODATIONS_screen.dart';

class WhistlerThingsScreen extends StatefulWidget {
  const WhistlerThingsScreen({super.key});

  @override
  State<WhistlerThingsScreen> createState() =>
      _WhistlerThingsScreenState();
}

class _WhistlerThingsScreenState extends State<WhistlerThingsScreen> {

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
          'Things To Do In Whistler',
          style: GoogleFonts.robotoSlab(
              color:  Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
      ),

      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children:[ Image.asset('assets/images/things.png'),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Text(
                  'Things To Do In Whistler',
                    style: GoogleFonts.oswald(
                        color:  Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),


              ]),
              const SizedBox(
                height: 10,
              ),
               Text(
                'Experience More',
                style: GoogleFonts.oswald(
                    color:  Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),

              const SizedBox(
                height: 10,
              ),
              Text(
                'Whistler has things to do for both skiers and non-skiers – with winter activities available during the Pride Festival, and activities to explore year-round. Whether you want to try an outdoor adventure, explore the shops and cultural stops Whistler Village or treat yourself to a luxurious spa experience.',
                style: GoogleFonts.robotoSlab(
                    color:  Colors.black,
                    fontSize: 11,
                    height: 1.7,
                    fontWeight: FontWeight.w300),
              ),
              ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (index, context) {
                    return GestureDetector(
                      onTap: (){
                        Get.to(const BOOKACCOMMODATIONSScreen());
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
                              child: Image.asset(
                                'assets/images/image.png',
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
                                    '21 Steps ', style: GoogleFonts.roboto(
                                  color:  Colors.black,
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
                                          'Lift tickets are required for all on-mountain activities and we encourage guests to',
                                         style: GoogleFonts.robotoSlab(
                                    color:  Colors.black,
                                    fontSize: 11,

                                    fontWeight: FontWeight.w300),
                                        ),
                                        TextSpan(
                                          text: ' Read More',
                                          style: GoogleFonts.robotoSlab(
                                              color:  Color(0xFFE025E7),
                                              fontSize: 10,

                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Button

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
      ),
    );
  }
}
