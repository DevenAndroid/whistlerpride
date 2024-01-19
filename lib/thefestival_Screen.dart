import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whistlerpride/CharitySkiRace_screen.dart';
import 'package:whistlerpride/Repo/thefestival_repo.dart';
import 'package:whistlerpride/guidedSkiRideGruops_screen.dart';
import 'package:whistlerpride/model/thefestivalModel.dart';
import 'package:whistlerpride/parade_and_Community_Day_screen.dart';
import 'package:whistlerpride/whistlerPrideEats_Screen.dart';
import 'package:whistlerpride/whistler_Pride_Events_screen.dart';
import 'package:whistlerpride/whistler_thing%20screen.dart';
import 'package:whistlerpride/widgets/apptheme.dart';
import 'package:whistlerpride/youth_programming.dart';

class TheFestivalScreen extends StatefulWidget {
  const TheFestivalScreen({super.key});

  @override
  State<TheFestivalScreen> createState() => _TheFestivalScreenState();
}

class _TheFestivalScreenState extends State<TheFestivalScreen> {
  RxBool isDataLoading = false.obs;
  Rx<TheFestivalModel> model = TheFestivalModel().obs;

  getData() async {
    thefestivalData().then((value) {
      isDataLoading.value = true;
      model.value = value;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

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
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Text(
          'The Festival',
          style: GoogleFonts.robotoSlab(
              color: const Color(0xFF000000),
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
      ),
      body: Obx(() {
        return isDataLoading.value
            ? SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 10),
                      child: Text(
                        model.value.data!.festivalTitle.toString(),
                        style: GoogleFonts.oswald(
                            color: const Color(0xFF000000),
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        model.value.data!.festivalDate.toString(),
                        style: GoogleFonts.oswald(
                            color: const Color(0xFF000000),
                            fontSize: 18,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      itemCount: model.value.data!.festivalLists!.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(11),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(
                                          0.2,
                                          0.2,
                                        ),
                                        blurRadius: 1,
                                      ),
                                    ]),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Left side: Image
                                    Container(
                                      margin:
                                          const EdgeInsets.only(right: 16.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(11),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(11),
                                        child: Image.network(
                                          model
                                              .value
                                              .data!
                                              .festivalLists![index]
                                              .festivalImage
                                              .toString(),
                                          width: 130.0,
                                          height: 140,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Title
                                          Text(
                                            model
                                                .value
                                                .data!
                                                .festivalLists![index]
                                                .festivalTitle
                                                .toString(),
                                            style: GoogleFonts.roboto(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),

                                          Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: model
                                                      .value
                                                      .data!
                                                      .festivalLists![index]
                                                      .festivalMessage
                                                      .toString()
                                                      .substring(0, 120),
                                                  style: GoogleFonts.robotoSlab(
                                                      color: Colors.black,
                                                      fontSize: 11,
                                                      height: 1.6,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                                TextSpan(
                                                  text: ' Read More',
                                                  style: GoogleFonts.robotoSlab(
                                                      color: Color(0xFFE025E7),
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          // Button
                                          model
                                                      .value
                                                      .data!
                                                      .festivalLists![index]
                                                      .festivalButtonName !=
                                                  ""
                                              ? Container(
                                                  height: 35,
                                                  width: 120,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3),
                                                    color:
                                                        const Color(0xffE025E7),
                                                  ),
                                                  child: Center(
                                                      child: Text(
                                                    model
                                                        .value
                                                        .data!
                                                        .festivalLists![index]
                                                        .festivalButtonName
                                                        .toString(),
                                                    style: GoogleFonts.roboto(
                                                        color: Colors.white,
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  )),
                                                )
                                              : const SizedBox.shrink()
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    GridView.builder(
                        shrinkWrap: true,
                        itemCount: model.value.data!.festivalMenu!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 0,
                                mainAxisExtent: 60,
                                mainAxisSpacing: 1.0),
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Flexible(
                            child: InkWell(
                              onTap: () {
                                if (model.value.data!.festivalMenu![index]
                                        .menuTitle ==
                                    "Whistler Pride Events") {
                                  Get.to(() => WhistlerPrideEventsScreen());
                                }
                                if (model.value.data!.festivalMenu![index]
                                        .menuTitle ==
                                    "Parade and Community Day") {
                                  Get.to(() => ParadeandCommunityDayScreen());
                                }
                                if (model.value.data!.festivalMenu![index]
                                        .menuTitle ==
                                    "Charity Ski Race") {
                                  Get.to(() => CharitySkiRaceScreen());
                                }
                                if (model.value.data!.festivalMenu![index]
                                        .menuTitle ==
                                    "Guided Ski/Ride Groups") {
                                  Get.to(() => GuidedSkiRideGruopsScreen());
                                }
                                if (model.value.data!.festivalMenu![index]
                                        .menuTitle ==
                                    "Youth Programming") {
                                  Get.to(() => YouthProgrammingScreen());
                                }
                                if (model.value.data!.festivalMenu![index]
                                        .menuTitle ==
                                    "Things To Do In Whistler") {
                                  Get.to(() => WhistlerThingsScreen());
                                }
                                if (model.value.data!.festivalMenu![index]
                                        .menuTitle ==
                                    "Whistler Pride Eats") {
                                  Get.to(() => WhistlerPrideEatsScreen());
                                }
                              },
                              child: Container(
                                margin: const EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xffE025E7),
                                ),
                                child: Center(
                                  child: Text(
                                    model.value.data!.festivalMenu![index]
                                        .menuTitle
                                        .toString(),
                                    style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                          );
                        })
                  ],
                ),
              )
            : const Center(
                child: CircularProgressIndicator(
                color: AppTheme.primaryColor,
              ));
      }),
    );
  }
}
