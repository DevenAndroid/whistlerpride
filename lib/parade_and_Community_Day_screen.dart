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
  ScrollController _scrollController = ScrollController();
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
                  width: 230,
                  child: Image.asset("assets/images/td.png")),
              SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                    'Whistler Pride Celebration',
                    style: GoogleFonts.oswald(
                        color: const Color(0xFF000000),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: (){
                          _scrollListView(-2);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: const Color(0xffE025E7)),
                          ),
                          child: const CircleAvatar(
                            maxRadius: 15,
                            minRadius: 15,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 15,
                              color: Color(0xffE025E7),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: (){
                          _scrollListView(2);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: const Color(0xffE025E7)),
                          ),
                          child: const CircleAvatar(
                            maxRadius: 15,
                            minRadius: 15,
                            backgroundColor: Color(0xffE025E7),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30,),


              SizedBox(
                height: 150,
                child: ListView.builder(
                    controller: _scrollController,
                    itemCount: 10,
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,

                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return
                        Row(
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
                                        'The social core of the week ufffffhigiggd\nThe social cofsfsffre of the week',
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
                            ),
                            SizedBox(width: 10,),
                          ],
                        );
                    }),
              ),

              const SizedBox(height: 20,),
               Text(
                'Events Registration',
                style: GoogleFonts.oswald(
                    color: const Color(0xFF000000),
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20,),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _scrollListView(int direction) {
    // Calculate the new scroll offset based on the current position and direction
    double newOffset = _scrollController.offset + (direction * 50.0);

    // Scroll to the new offset with animation
    _scrollController.animateTo(
      newOffset,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
