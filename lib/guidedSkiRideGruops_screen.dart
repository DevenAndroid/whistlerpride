import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whistlerpride/whistlerPrideEats_Screen.dart';
import 'package:whistlerpride/widgets/bottom_navigationBar.dart';

class GuidedSkiRideGruopsScreen extends StatefulWidget {
  const GuidedSkiRideGruopsScreen({super.key});

  @override
  State<GuidedSkiRideGruopsScreen> createState() =>
      _GuidedSkiRideGruopsScreenState();
}

class _GuidedSkiRideGruopsScreenState extends State<GuidedSkiRideGruopsScreen> {
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
          'Guided Ski & Ride Gruops',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: CustomBottomNavigationBar.build().items,
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
                'SIGN UP FOR SKI & RIDE GROUPS',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
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
                                  text:
                                      'Lift tickets are required for all on-mountain activities and we encourage guests to',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 14),
                                ),
                                TextSpan(
                                  text: ' Read More',
                                  style: TextStyle(
                                      color: Color(0xffE025E7),
                                      fontWeight: FontWeight.w300,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // Button
                          InkWell(
                            onTap: () {
                              Get.to(const WhistlerPrideEatsScreen());
                            },
                            child: Container(
                              height: 35,
                              width: 100,
                              decoration: BoxDecoration(color:  Color(0xffE025E7),borderRadius: BorderRadius.circular(5)),
                              child: const Center(
                                  child: Text(
                                'Register',
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
              const Text(
                'Our TICKETS & RENTALS',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (index, context) {
                    return Container(
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
                                        text:
                                            'Lift tickets are required for all on-mountain activities and we encourage guests to',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 14),
                                      ),
                                      TextSpan(
                                        text: ' Read More',
                                        style: TextStyle(
                                            color: Color(0xffE025E7),
                                            fontWeight: FontWeight.w300,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                // Button
                                InkWell(
                                  onTap: () {
                                    Get.to(const GuidedSkiRideGruopsScreen());
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Color(0xffE025E7),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: const Center(
                                        child: Text(
                                      'Lift Tickets',
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
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
