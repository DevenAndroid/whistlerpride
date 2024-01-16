import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'guidedSkiRideGruops_screen.dart';

class CharitySkiRaceScreen extends StatefulWidget {
  const CharitySkiRaceScreen({super.key});

  @override
  State<CharitySkiRaceScreen> createState() => _CharitySkiRaceScreenState();
}

class _CharitySkiRaceScreenState extends State<CharitySkiRaceScreen> {
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
          'Charity Ski Race',
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
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/imagess.png'),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'RACE TO RAISE MONEY FOR CHARITY',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'Test your speed and try guessing your time in a friendly race that raises funds for QMUNITY, BC’s Queer, Trans, & Two-Spirit Resource Centre. Show us your sweet skiing or boarding moves as you zoom down the giant dual slalom Race Centre on Blackcomb Mountain.',
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
                    ),
                    TextSpan(
                        text: 'Read More',
                        style:
                            TextStyle(fontSize: 14, color: Color(0xffE025E7))),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (index, context) {
                    return const Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              minRadius: 5,
                              maxRadius: 5,
                              backgroundColor: Color(0xffE025E7),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Skiers and snowboarders welcome.',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    );
                  }),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Prizes will be available for pick-up from the Whistler Pride Welcome Centre at the Aava Hotel.',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
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
                    ),
                    const Expanded(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'QMUNITY :-',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            TextSpan(
                                text:
                                    'Since 1979, QMUNITY has existed as BC’s queer, trans, and Two-Spirit resource Centre. Show us your sweet.',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                    fontSize: 14,)),
                            TextSpan(
                              text: 'Read More',
                              style: TextStyle(
                                  color: Color(0xffE025E7),
                                  fontWeight: FontWeight.w300, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                '2023 WINNERS',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10,),
              const Text(
                'These are the winners for the 2023 Whistler Pride Charity Ski Race.. ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(height: 10,),
              ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (index, context) {
                    return const Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              minRadius: 5,
                              maxRadius: 5,
                              backgroundColor: Color(0xffE025E7),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                'Closest: Ian G. — Guessed Time: 24.82 Actual Time: 24.99',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
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
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title
                          const Text(
                            'Lift Tickets ',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Lift tickets are required for all on-mountain activities and we encourage guests to',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300, fontSize: 14),
                                ),
                                TextSpan(
                                  text: ' Read More',
                                  style: TextStyle(
                                      color: Color(0xffE025E7),
                                      fontWeight: FontWeight.w300, fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // Button
                          InkWell(
                            onTap: (){
                              Get.to(const GuidedSkiRideGruopsScreen());
                            },
                            child: Container(
                              height: 35,
                              width: 120,
                              color: const Color(0xffE025E7),
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
