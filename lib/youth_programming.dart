import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whistlerpride/widgets/bottom_navigationBar.dart';

import 'bOOKACCOMMODATIONS_screen.dart';

class YouthProgrammingScreen extends StatefulWidget {
  const YouthProgrammingScreen({super.key});

  @override
  State<YouthProgrammingScreen> createState() =>
      _YouthProgrammingScreenState();
}

class _YouthProgrammingScreenState extends State<YouthProgrammingScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back)),
        title:  Text(
          'Youth Programming',
          style: GoogleFonts.robotoSlab(
              color:  Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: CustomBottomNavigationBar.build().items,
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children:[ Image.asset('assets/images/youth.png'),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Text(
                    'Youth Programming',
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
                'Welcoming And Inclusive',
                style: GoogleFonts.oswald(
                    color:  Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),

              const SizedBox(
                height: 10,
              ),
              Text(
               "Whistler pride welcomes queer youth and allies ages 13-18 on Friday January 26th with unique sport, social and cultural programming."
                  "Exclusively for youth aged 13-18 | Pre-registration is required | Limited capacity.",
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
                                    'Youth Ski Guiding', style: GoogleFonts.roboto(
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
                                          'On Friday The Whistler Pride and Ski Festival welcomes',
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
                                  SizedBox(height: 6,),
                                  Text(
                                    'Friday January 26, 2024', style: GoogleFonts.robotoSlab(
                                      color:  Colors.black,
                                      fontSize: 10,

                                      fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(height: 4,),

                                  Text(
                                    'Meet at 9:45am next to the Guest Relations Kiosk', style: GoogleFonts.robotoSlab(
                                      color:  Colors.black,
                                      fontSize: 10,

                                      fontWeight: FontWeight.w500),
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
      ),
    );
  }
}
