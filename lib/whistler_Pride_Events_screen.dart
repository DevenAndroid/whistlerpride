import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:whistlerpride/parade_and_Community_Day_screen.dart';
import 'package:whistlerpride/widgets/bottom_navigationBar.dart';

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
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child:  Icon(Icons.arrow_back,color: Colors.black,)),
        title: const Text(
          'Whistler Pride Events',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
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
              SizedBox(
                height: 190,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (index, context) {
                      return  Container(
                        width: 160,
                        padding: const EdgeInsets.all(16.0),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [BoxShadow(
                              color: Colors.black26,
                              offset: Offset(
                                0.5,
                                0.5,
                              ), //Offset
                              blurRadius: 0.5,
                              spreadRadius: 0.0,
                            ),]),
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
                      );
                    }),
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Event Schedule',
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
                            boxShadow: const [ BoxShadow(
                              color: Colors.black26,
                              offset: Offset(
                                0.5,
                                0.5,
                              ), //Offset
                              blurRadius: 0.5,
                              spreadRadius: 0.0,
                            ),]),
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
            ],
          ),
        ),
      ),
    );
  }
}
