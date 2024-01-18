import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:whistlerpride/model/homePageModel.dart';
import 'package:whistlerpride/widgets/apptheme.dart';
import 'package:whistlerpride/widgets/bottom_navigationBar.dart';
import 'dart:ui' as ui;
import 'Repo/homepage_repo.dart';
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
  RxString dropDownValue2 = ''.obs;
  RxString dropDownValue3 = ''.obs;
  RxString id = "".obs;
  RxInt refreshInt = 0.obs;
  // Dummy data for dropdowns
  // List<String> options = ['Option 1', 'Option 2', 'Option 3'];
  RxBool isDataLoading = false.obs;
  Rx<HomePageModel> model = HomePageModel().obs;
  List<String> options = [];
  getData() async {
    homeData().then((value) {
      isDataLoading.value = true;
      model.value = value;
      options = List<String>.from(model.value.data!.festivalMenu!).toList();
      selectedValue1 = options.isNotEmpty ? options[0] : null;
    });
  }
  //
  // Future<void> _launchInBrowser(Uri url) async {
  //   if (!await launchUrl(
  //     url,
  //     mode: LaunchMode.externalApplication,
  //   )) {
  //     throw Exception('Could not launch $url');
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 7;
    final double itemWidth = size.width / 2;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            elevation: 0,
            leadingWidth: 120,
            leading: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Image.asset(
                'assets/images/logo.png',
                height: 30,
                width: 100,
              ),
            ),
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
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 150,
                  height: 50,
                ),
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
                  Get.to(const FaqScreen());
                },
              ),
              ListTile(
                leading: const Icon(Icons.call),
                title: const Text('Contact Us '),
                onTap: () {
                  Get.to(const ContactScreen());
                },
              ),
              ListTile(
                leading: const Icon(Icons.notification_important),
                title: const Text('Notifications '),
                onTap: () {
                  Get.to(const NotificationScreen());
                },
              ),
            ],
          ),
        ), //Drawer

        body: Obx(() {
          return isDataLoading.value
              ? SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
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
                              child: Image.network(
                                model.value.data!.homeBanner.toString(),
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
                          Positioned.fill(
                            bottom: 10,
                            left: 10,
                            right: 10,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                    flex: 3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          model.value.data!.homeBannerTitle
                                              .toString(),
                                          style: GoogleFonts.robotoSlab(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: model.value.data!
                                                    .homeBannerDescription
                                                    .toString(),
                                                style: GoogleFonts.robotoSlab(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 10,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                                const SizedBox(
                                  width: 6,
                                ),
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                        height: 30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(2),
                                            border: Border.all(
                                                color: Colors.white, width: 2)),
                                        child: Center(
                                            child: Text(
                                          model.value.data!
                                              .homeBannerFestivalDates
                                              .toString(),
                                          style: GoogleFonts.robotoSlab(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 9),
                                        ))))
                              ],
                            ),
                          ),
                        ]),

                        // Image.asset('assets/images/imagess.png'),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 51,
                                child: PopupMenuButton<int>(
                                  constraints: BoxConstraints(
                                    maxHeight: 600,
                                    minWidth: MediaQuery.of(context).size.width,
                                    maxWidth: MediaQuery.of(context).size.width,
                                  ),

                                  position: PopupMenuPosition.under,
                                  offset: Offset.fromDirection(50, 100),
                                  onSelected: (value) {
                                    setState(() {
                                      dropDownValue2.value = model.value.data!
                                          .festivalMenu![value].menuTitle
                                          .toString();
                                    });
                                  },
                                  // icon: Icon(Icons.keyboard_arrow_down),
                                  itemBuilder: (context) => List.generate(
                                    model.value.data!.festivalMenu!.length,
                                    (index) => PopupMenuItem(
                                        child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            dropDownValue2.value = model
                                                .value
                                                .data!
                                                .festivalMenu![index]
                                                .menuTitle
                                                .toString();
                                            refreshInt.value = DateTime.now()
                                                .millisecondsSinceEpoch;
                                            setState(() {});
                                            Get.back();
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 12.0, right: 12),
                                            child: Text(
                                              model
                                                  .value
                                                  .data!
                                                  .festivalMenu![index]
                                                  .menuTitle
                                                  .toString(),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                                  ),

                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 8),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(12)),
                                        border: Border.all(color: Colors.grey)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Obx(() {
                                          return Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Center(
                                                    child: Text(
                                                      dropDownValue2.value
                                                              .toString()
                                                              .isEmpty
                                                          ? "The Festival"
                                                          : dropDownValue2.value
                                                              .toString(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      overflow: TextOverflow
                                                          .ellipsis, // Ensure text doesn't overflow
                                                      maxLines: 1,
                                                      style: GoogleFonts
                                                          .robotoSlab(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 11,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                        const SizedBox(
                                          width: 1,
                                        ),
                                        const Expanded(
                                          child: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: Colors.black,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 51,
                                child: PopupMenuButton<int>(
                                  constraints: BoxConstraints(
                                    maxHeight: 600,
                                    minWidth: MediaQuery.of(context).size.width,
                                    maxWidth: MediaQuery.of(context).size.width,
                                  ),

                                  position: PopupMenuPosition.under,
                                  offset: Offset.fromDirection(50, 100),
                                  onSelected: (value) {
                                    setState(() {
                                      dropDownValue3.value = model.value.data!
                                          .accommodationsMenu![value].menuTitle
                                          .toString();
                                    });
                                  },
                                  // icon: Icon(Icons.keyboard_arrow_down),
                                  itemBuilder: (context) => List.generate(
                                    model
                                        .value.data!.accommodationsMenu!.length,
                                    (index) => PopupMenuItem(
                                        child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            dropDownValue3.value = model
                                                .value
                                                .data!
                                                .accommodationsMenu![index]
                                                .menuTitle
                                                .toString();
                                            refreshInt.value = DateTime.now()
                                                .millisecondsSinceEpoch;
                                            setState(() {});
                                            Get.back();
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 12.0, right: 12),
                                            child: Text(
                                              model
                                                  .value
                                                  .data!
                                                  .accommodationsMenu![index]
                                                  .menuTitle
                                                  .toString(),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                                  ),

                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 8),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(12)),
                                        border: Border.all(color: Colors.grey)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Obx(() {
                                          return Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Center(
                                                    child: Text(
                                                      dropDownValue3.value
                                                              .toString()
                                                              .isEmpty
                                                          ? "Accommodations"
                                                          : dropDownValue3.value
                                                              .toString(),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      style: GoogleFonts
                                                          .robotoSlab(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 11,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                        const SizedBox(
                                          width: 1,
                                        ),
                                        const Expanded(
                                          child: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: Colors.black,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
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
                            const SizedBox(
                              height: 17,
                            ),
                            Row(
                              children: [
                                Container(
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
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
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
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        SizedBox(
                          height: 310,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: model
                                  .value.data!.festivalCountdownList!.length,
                              physics: const AlwaysScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Stack(children: [
                                      Container(
                                        width: 180,
                                        height: 300,
                                        padding: const EdgeInsets.all(10.0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 5,
                                                  color: Colors.grey.shade200,
                                                  offset: const Offset(4, 4)),
                                            ]),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Left side: Image
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.network(
                                                model
                                                    .value
                                                    .data!
                                                    .festivalCountdownList![
                                                        index]
                                                    .festivalImage
                                                    .toString(),
                                                fit: BoxFit.fill,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 150,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text.rich(
                                              TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: model
                                                        .value
                                                        .data!
                                                        .festivalCountdownList![
                                                            index]
                                                        .festivalMessage
                                                        .toString()
                                                        .substring(0, 70),
                                                    style:
                                                        GoogleFonts.robotoSlab(
                                                            color: Colors.black,
                                                            fontSize: 11,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300),
                                                  ),
                                                  TextSpan(
                                                    text: ' Read More',
                                                    style:
                                                        GoogleFonts.robotoSlab(
                                                            color: const Color(
                                                                0xFFE025E7),
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Positioned(
                                        bottom: 20,
                                        left: 10,
                                        child: InkWell(
                                          onTap: () {
                                            if (model
                                                    .value
                                                    .data!
                                                    .festivalCountdownList![
                                                        index]
                                                    .isAnotherUrl ==
                                                true) {
                                              // _launchInBrowser(Uri.parse(model
                                              //     .value
                                              //     .data!
                                              //     .festivalCountdownList![index]
                                              //     .festivalButtonUrl
                                              //     .toString()));
                                            }
                                            // Get.to(const TheFestivalScreen());
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(6),
                                            height: 30,
                                            // width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                              color: const Color(0xffE025E7),
                                            ),
                                            child: Center(
                                                child: Text(
                                              model
                                                  .value
                                                  .data!
                                                  .festivalCountdownList![index]
                                                  .festivalButtonName
                                                  .toString(),
                                              style: GoogleFonts.roboto(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w600),
                                            )),
                                          ),
                                        ),
                                      ),
                                    ]),
                                    const SizedBox(
                                      width: 20,
                                    )
                                  ],
                                );
                              }),
                        ),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Text(
                        //       'Upcoming Events',
                        //       style: GoogleFonts.oswald(
                        //           color: Colors.black,
                        //           fontSize: 18,
                        //           fontWeight: FontWeight.w500),
                        //     ),
                        //     Row(
                        //       children: [
                        //         Container(
                        //           decoration: BoxDecoration(
                        //             shape: BoxShape.circle,
                        //             border: Border.all(
                        //                 color: const Color(0xffE025E7)),
                        //           ),
                        //           child: const CircleAvatar(
                        //             maxRadius: 15,
                        //             minRadius: 15,
                        //             backgroundColor: Colors.white,
                        //             child: Icon(
                        //               Icons.arrow_forward_ios,
                        //               size: 15,
                        //               color: Color(0xffE025E7),
                        //             ),
                        //           ),
                        //         ),
                        //         const SizedBox(
                        //           width: 10,
                        //         ),
                        //         Container(
                        //           decoration: BoxDecoration(
                        //             shape: BoxShape.circle,
                        //             border: Border.all(
                        //                 color: const Color(0xffE025E7)),
                        //           ),
                        //           child: const CircleAvatar(
                        //             maxRadius: 15,
                        //             minRadius: 15,
                        //             backgroundColor: Color(0xffE025E7),
                        //             child: Icon(
                        //               Icons.arrow_back_ios,
                        //               size: 15,
                        //               color: Colors.white,
                        //             ),
                        //           ),
                        //         ),
                        //       ],
                        //     )
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: 280,
                        //   child: ListView.builder(
                        //       scrollDirection: Axis.horizontal,
                        //       shrinkWrap: true,
                        //       physics: const AlwaysScrollableScrollPhysics(),
                        //       itemBuilder: (index, context) {
                        //         return Container(
                        //           width: 160,
                        //           padding: const EdgeInsets.all(16.0),
                        //           margin: const EdgeInsets.all(10),
                        //           decoration: BoxDecoration(
                        //               color: Colors.white,
                        //               borderRadius: BorderRadius.circular(5),
                        //               boxShadow: [const BoxShadow(blurRadius: 1)]),
                        //           child: Column(
                        //             crossAxisAlignment: CrossAxisAlignment.start,
                        //             children: [
                        //               // Left side: Image
                        //               Expanded(
                        //                 child: Image.asset(
                        //                   'assets/images/passes.png',
                        //                   fit: BoxFit.cover,
                        //                 ),
                        //               ),
                        //               const SizedBox(
                        //                 height: 10,
                        //               ),
                        //               const Text.rich(
                        //                 TextSpan(
                        //                   children: [
                        //                     TextSpan(
                        //                       text: 'WELCOME PARTY',
                        //                       style: TextStyle(
                        //                           fontWeight: FontWeight.bold,
                        //                           fontSize: 8),
                        //                     ),
                        //                     TextSpan(
                        //                         text:
                        //                         '- January 21, 2024 / 4:30 PM To 8:30 PM',
                        //                         style: TextStyle(fontSize: 8)),
                        //                   ],
                        //                 ),
                        //               ),
                        //               const SizedBox(
                        //                 height: 5,
                        //               ),
                        //               const Text(
                        //                 'The festival’s official kick-of where guests mingle meet festival organizer Read More',
                        //                 style: TextStyle(
                        //                     color: Colors.black, fontSize: 10),
                        //               ),
                        //               const SizedBox(
                        //                 height: 5,
                        //               ),
                        //
                        //               Container(
                        //                 height: 30,
                        //                 width: 90,
                        //                 decoration: BoxDecoration(
                        //                   borderRadius: BorderRadius.circular(3),
                        //                   color: const Color(0xffE025E7),
                        //                 ),
                        //                 child: const Center(
                        //                     child: Text(
                        //                       'Buy Tickets',
                        //                       style: TextStyle(
                        //                           fontSize: 10, color: Colors.white),
                        //                     )),
                        //               ),
                        //             ],
                        //           ),
                        //         );
                        //       }),
                        // ),
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
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, // Number of columns
                            crossAxisSpacing: 10.0, // Spacing between columns
                            mainAxisSpacing: 9.0, // Spacing between rows
                            childAspectRatio: (itemWidth / itemHeight),
                          ),
                          itemCount: model.value.data!.festivalPartners!.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.black)),
                              child: Image.network(
                                model.value.data!.festivalPartners![index]
                                    .partnerImage
                                    .toString(),
                                fit: BoxFit.contain,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(
                  color: AppTheme.primaryColor,
                ));
        }));
  }
}
