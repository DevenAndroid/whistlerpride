import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whistlerpride/thefestival_Screen.dart';
import 'package:whistlerpride/widgets/bottom_navigationBar.dart';

import 'about_ur.dart';
import 'contact_screen.dart';
import 'faq_screen.dart';
import 'notification.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedValue1;
  String? selectedValue2;

  // Dummy data for dropdowns
  List<String> options = ['Option 1', 'Option 2', 'Option 3'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            elevation: 0,
            leadingWidth: 120,
            leading: Padding(
              padding: const EdgeInsets.only(top: 6, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {},
                    child: const Row(
                      children: [
                        Icon(Icons.location_on),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Home",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black,
                          size: 25,
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "jaipur, Rajasthan",
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            title: Image.asset(
              'assets/images/logo.png',
              height: 30,
              width: 100,
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Image.asset(
                  'assets/images/bellicon.png',
                  height: 30,
                  width: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Image.asset(
                  'assets/images/menu.png',
                  height: 30,
                  width: 30,
                ),
              ),
            ]),
        bottomNavigationBar: BottomNavigationBar(
          items: CustomBottomNavigationBar.build().items,
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ), //BoxDecoration
                child: Image.asset('assets/images/logo.png',width: 150,height: 50,),
              ), //DrawerHeader
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('About Us'),
                onTap: () {
                  Get.to(const AboutUsScreen());
                },
              ),
              ListTile(
                leading: const Icon(Icons.question_mark),
                title: const Text('FAQs '),
                onTap: () {
                  Get.to(FaqScreen());
                },
              ),
              ListTile(
                leading: const Icon(Icons.call),
                title: const Text('Contact Us '),
                onTap: () {
                  Get.to(ContactScreen());
                },
              ),
              ListTile(
                leading: const Icon(Icons.notification_important),
                title: const Text('Notifications '),
                onTap: () {
                  Get.to(NotificationScreen());
                },
              ),
            ],
          ),
        ), //Drawer
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/imagess.png'),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              labelText: 'The Festival',
                              labelStyle: TextStyle(fontSize: 13),
                              border: OutlineInputBorder(),
                            ),
                            value: selectedValue1,
                            items: options.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                selectedValue1 = newValue;
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              labelText: 'Accommodations',
                              labelStyle: TextStyle(fontSize: 13),
                              border: OutlineInputBorder(),
                            ),
                            value: selectedValue2,
                            items: options.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                selectedValue2 = newValue;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '2024 FESTIVAL COUNTDOWN',
                      style: GoogleFonts.oswald(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
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
                  height: 280,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemBuilder: (index, context) {
                        return Container(
                          width: 160,
                          padding: const EdgeInsets.all(16.0),
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [const BoxShadow(blurRadius: 1)]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Left side: Image
                              Expanded(
                                child: Image.asset(
                                  'assets/images/passes.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'WELCOME PARTY',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 8),
                                    ),
                                    TextSpan(
                                        text:
                                            '- January 21, 2024 / 4:30 PM To 8:30 PM',
                                        style: TextStyle(fontSize: 8)),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                'The festival’s official kick-of where guests mingle meet festival organizer Read More',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 10),
                              ),
                              const SizedBox(
                                height: 5,
                              ),

                              InkWell(
                                onTap:(){
                                  Get.to(const TheFestivalScreen());
                                },
                                child: Container(
                                  height: 30,
                                  width: 90,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: const Color(0xffE025E7),
                                  ),
                                  child: const Center(
                                      child: Text(
                                    'Buy Tickets',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  )),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(
                      'Upcoming Events',
                      style: GoogleFonts.oswald(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
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
                  height: 280,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemBuilder: (index, context) {
                        return Container(
                          width: 160,
                          padding: const EdgeInsets.all(16.0),
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [const BoxShadow(blurRadius: 1)]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Left side: Image
                              Expanded(
                                child: Image.asset(
                                  'assets/images/passes.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'WELCOME PARTY',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 8),
                                    ),
                                    TextSpan(
                                        text:
                                            '- January 21, 2024 / 4:30 PM To 8:30 PM',
                                        style: TextStyle(fontSize: 8)),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                'The festival’s official kick-of where guests mingle meet festival organizer Read More',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 10),
                              ),
                              const SizedBox(
                                height: 5,
                              ),

                              Container(
                                height: 30,
                                width: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: const Color(0xffE025E7),
                                ),
                                child: const Center(
                                    child: Text(
                                  'Buy Tickets',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
                                )),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 10,
                ),
                 Text(
                  'Festival Partners',
                  style: GoogleFonts.oswald(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Number of columns
                    crossAxisSpacing: 8.0, // Spacing between columns
                    mainAxisSpacing: 8.0, // Spacing between rows
                  ),
                  itemCount: 9,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Image.asset(
                      'assets/images/image.png',
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
