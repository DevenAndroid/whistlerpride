import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whistlerpride/bOOKACCOMMODATIONS_screen.dart';
import 'package:whistlerpride/homepage.dart';
import 'package:whistlerpride/thefestival_Screen.dart';
import '../controller/bottomnavbar_controller.dart';
import 'apptheme.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  final bottomController = Get.put(BottomNavBarController());

  final pages = [
    const HomePage(),
    const TheFestivalScreen(),
    const AccommodationScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: pages.elementAt(bottomController.pageIndex.value),
        extendBody: true,
        // extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        bottomNavigationBar: buildMyNavBar(context),
      );
    });
  }

  buildMyNavBar(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.maxFinite,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight: Radius.circular(0),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: MaterialButton(
                      padding: const EdgeInsets.only(bottom: 10),
                      onPressed: () {
                        bottomController.updateIndexValue(0);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          bottomController.pageIndex.value == 0
                              ? Image.asset(
                            'assets/images/home.png',
                            height: 25,
                            color: AppTheme.notification,
                          )
                              : Image.asset(
                            'assets/images/home.png',
                            height: 25,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          bottomController.pageIndex.value == 0
                              ?  Text(
                            "Home",
                            style: GoogleFonts.robotoSlab(
                                color: AppTheme.notification,
                                fontSize: 11,
                                fontWeight: FontWeight.w500),
                          )
                              : Text(
                            "Home",
                            style: GoogleFonts.robotoSlab(
                                color: const Color(0xFF000000),
                                fontSize: 11,
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: MaterialButton(
                      padding: const EdgeInsets.only(bottom: 10),
                      onPressed: () {
                        bottomController.updateIndexValue(1);
                      },
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          bottomController.pageIndex.value == 1
                              ? Image.asset(
                            'assets/images/festival.png',
                            height: 25,
                            color: AppTheme.notification,
                          )
                              : Image.asset(
                            'assets/images/festival.png',
                            height: 25,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          bottomController.pageIndex.value == 1
                              ?  Text(
                            "Festival",
                            style: GoogleFonts.robotoSlab(
                                color: AppTheme.notification,
                                fontSize: 11,
                                fontWeight: FontWeight.w500),
                          )
                              :  Text(
                            "Festival",
                            style: GoogleFonts.robotoSlab(
                                color: const Color(0xFF000000),
                                fontSize: 11,
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: MaterialButton(
                        padding: const EdgeInsets.only(bottom: 10),
                        onPressed: () {
                          bottomController.updateIndexValue(2);
                        },
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 8,
                            ),
                            bottomController.pageIndex.value == 2
                                ? Image.asset(
                              'assets/images/acc.png',
                              height: 25,
                              color: AppTheme.notification,
                            )
                                : Image.asset(
                              'assets/images/acc.png',
                              height: 25,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            bottomController.pageIndex.value == 2
                                ?  Text(
                              "ACCOMMODATIONS",
                              style: GoogleFonts.robotoSlab(
                                  color: AppTheme.notification,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500),
                            )
                                :  Text(
                              "ACCOMMODATIONS",
                              style: GoogleFonts.robotoSlab(
                                  color: const Color(0xFF000000),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
