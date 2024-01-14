import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:whistlerpride/parade_and_Community_Day_screen.dart';

class WhistlerPrideEventsScreen extends StatefulWidget {
  const WhistlerPrideEventsScreen({super.key});

  @override
  State<WhistlerPrideEventsScreen> createState() => _WhistlerPrideEventsScreenState();
}

class _WhistlerPrideEventsScreenState extends State<WhistlerPrideEventsScreen> {
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
          'Whistler Pride Events',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.festival_outlined),
            label: 'Festival',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_mark),
            label: 'ACCOMMODATIONS',
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/imagess.png'),
              const SizedBox(height: 10,),
              const Text(
                'Multiple Events & Tickets',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Container(
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
                        Container(
                          child: Image.asset(
                            'assets/images/passes.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          height: 30,
                          width: 90,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(3),
                            color: const Color(0xffE025E7),

                          ),
                          child: Center(
                              child: InkWell(
                                onTap: (){
                                  Get.to(const ParadeandCommunityDayScreen());
                                },
                                child: const Text(
                                  'Buy Passes',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Container(
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
                        Container(
                          child: Image.asset(
                            'assets/images/passes.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          height: 30,
                          width: 90,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(3),
                            color: const Color(0xffE025E7),

                          ),
                          child: const Center(
                              child: Text(
                                'Buy Passes',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              const Row(
                children: [
                  Text(
                    'Event Schedule',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),

                ],
              ),
              Row(
                children: [
                  Container(
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
                        Container(
                          child: Image.asset(
                            'assets/images/passes.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 10,),
                        const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'WELCOME PARTY',
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 8),
                              ),
                              TextSpan(text: '- January 21, 2024 / 4:30 PM To 8:30 PM',style: TextStyle(fontSize: 8)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5,),
                        const Text(
                          'The festival’s official kick-of where guests mingle meet festival organizer Read More',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 10),
                        ),
                        const SizedBox(height: 5,),

                        Container(
                          height: 30,
                          width: 90,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(3),
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
                  ),
                  Container(
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
                        Container(
                          child: Image.asset(
                            'assets/images/passes.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 10,),
                        const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'WELCOME PARTY',
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 8),
                              ),
                              TextSpan(text: '- January 21, 2024 / 4:30 PM To 8:30 PM',style: TextStyle(fontSize: 8)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5,),
                        const Text(
                          'The festival’s official kick-of where guests mingle meet festival organizer Read More',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 10),
                        ),
                        const SizedBox(height: 5,),

                        Container(
                          height: 30,
                          width: 90,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(3),
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
