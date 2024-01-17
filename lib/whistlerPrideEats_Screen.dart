import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:whistlerpride/widgets/bottom_navigationBar.dart';

import 'bOOKACCOMMODATIONS_screen.dart';

class WhistlerPrideEatsScreen extends StatefulWidget {
  const WhistlerPrideEatsScreen({super.key});

  @override
  State<WhistlerPrideEatsScreen> createState() =>
      _WhistlerPrideEatsScreenState();
}

class _WhistlerPrideEatsScreenState extends State<WhistlerPrideEatsScreen> {

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
          'Whistler Pride Eats',
          style: TextStyle(color: Colors.black, fontSize: 16),
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
              Image.asset('assets/images/imagess.png'),
              const SizedBox(
                height: 10,
              ),
               Text(
                'Your Table Awaits',
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
                    return GestureDetector(
                      onTap: (){
                        Get.to(const BOOKACCOMMODATIONSScreen());
                      },
                      child: Container(
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
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Title
                                  Text(
                                    '21 Steps ',
                                    style: GoogleFonts.oswald(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),

                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              'Lift tickets are required for all on-mountain activities and we encourage guests to',
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
                                    '4433 Sundial Place, Whistler BC Tap/click image for reservations 1-604-966-2121 ',
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
      ),
    );
  }
}
