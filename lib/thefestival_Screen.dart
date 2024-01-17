import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:whistlerpride/whistler_Pride_Events_screen.dart';

class TheFestivalScreen extends StatefulWidget {
  const TheFestivalScreen({super.key});

  @override
  State<TheFestivalScreen> createState() => _TheFestivalScreenState();
}

class _TheFestivalScreenState extends State<TheFestivalScreen> {
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
          'The Festival',
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                'WHISTLER PRIDE & SKI FESTIVAL 2024',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                'JANUARY 21-28, 2024',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              ),
            ),
            ListView.builder(
              itemCount: 5,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.all(10),
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
                              'Ski & Ride Groups',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            // Description
                            const Text(
                              'The social core of the week, the free daily guided ski and snowboard groups Read More',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // Button
                            InkWell(
                              onTap: (){
                                Get.to(WhistlerPrideEventsScreen());
                              },
                              child: Container(
                                height: 35,
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: const Color(0xffE025E7),
                                ),
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
                );
              },
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  height: 35,
                  color: const Color(0xffE025E7),
                  child: const Center(
                      child: Text(
                    'Whistler Pride Events',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  )),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  height: 35,
                  color: const Color(0xffE025E7),
                  child: const Center(
                      child: Text(
                    'Parade And Community Day',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  )),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  height: 35,
                  color: const Color(0xffE025E7),
                  child: const Center(
                      child: Text(
                    'Charity Ski Race',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  )),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  height: 35,
                  color: const Color(0xffE025E7),
                  child: const Center(
                      child: Text(
                    'Charity Ski/Ride Groups',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  )),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  height: 35,
                  color: const Color(0xffE025E7),
                  child: const Center(
                      child: Text(
                    'Whistler Pride Eats',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
