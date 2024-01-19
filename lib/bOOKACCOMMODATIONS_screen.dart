import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whistlerpride/Repo/accommodation_repo.dart';
import 'package:whistlerpride/host%20_hotel_screen.dart';
import 'package:whistlerpride/widgets/apptheme.dart';
import 'package:whistlerpride/widgets/common_text_field.dart';

import 'bOOKACCOMMODATIONStwo_Screen.dart';
import 'model/accommodationModel.dart';

class AccommodationScreen extends StatefulWidget {
  const AccommodationScreen({super.key});

  @override
  State<AccommodationScreen> createState() => _AccommodationScreenState();
}

class _AccommodationScreenState extends State<AccommodationScreen> {
  RxBool isDataLoading = false.obs;
  Rx<AccommodationsModel> model = AccommodationsModel().obs;
  TextEditingController dateInput = TextEditingController();
  DateTime startSelectedDate = DateTime.now();
  DateTime endSelectedDate = DateTime.now().add(const Duration(days: 1));
  Future<void> startDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startSelectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != startSelectedDate) {
      setState(() {
        startSelectedDate = picked;
      });
    }
  }

  Future<void> endDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: endSelectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != endSelectedDate) {
      setState(() {
        endSelectedDate = picked;
      });
    }
  }

  getData() async {
    accommodationsData().then((value) {
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

  pickDate(
      {required Function(DateTime gg) onPick,
      DateTime? initialDate,
      DateTime? firstDate,
      DateTime? lastDate}) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: initialDate ?? DateTime.now(),
        firstDate: firstDate ?? DateTime.now(),
        lastDate: lastDate ?? DateTime(2101),
        initialEntryMode: DatePickerEntryMode.calendarOnly);
    if (pickedDate == null) return;
    onPick(pickedDate);
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
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: const Text(
          'BOOK ACCOMMODATIONS',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      body: Obx(() {
        return isDataLoading.value
            ? SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: SizedBox(
                          height: Get.height * .26,
                          width: Get.width,
                          child: Image.network(
                            model.value.data!.accommodationsBanner.toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.all(16.0),
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
                              height: 140,
                              margin: const EdgeInsets.only(right: 16.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                border: Border.all(
                                  color: const Color(
                                      0xffE025E7), // Set the desired border color
                                  width: 1.5, // Set the desired border width
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Image.network(
                                  model.value.data!.hotelPackageDetails!
                                      .packageImage
                                      .toString(),
                                  width: 125.0,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Title

                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: model
                                              .value
                                              .data!
                                              .hotelPackageDetails!
                                              .packageDescription
                                              .toString()
                                              .substring(0, 150),
                                          style: GoogleFonts.robotoSlab(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 10),
                                        ),
                                        TextSpan(
                                          text: ' Read More',
                                          style: GoogleFonts.robotoSlab(
                                              color: const Color(0xffE025E7),
                                              fontWeight: FontWeight.w300,
                                              fontSize: 11),
                                        ),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      final String url = model.value.data!
                                          .hotelPackageDetails!.packageButtonUrl
                                          .toString();

                                      if (await canLaunch(url)) {
                                        await launch(Uri.parse(url).toString());
                                      } else {
                                        throw 'Could not launch $url';
                                      }
                                    },
                                    child: Container(
                                      height: 35,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          color: const Color(0xffE025E7),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Center(
                                          child: Text(
                                        model.value.data!.hotelPackageDetails!
                                            .packageButtonName
                                            .toString(),
                                        style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 10,
                                            color: Colors.white),
                                      )),
                                    ),
                                  ),
                                  // Button
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        model.value.data!.whistlerLodgingDetails!.lodgingTitle
                            .toString(),
                        style: GoogleFonts.oswald(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        model.value.data!.whistlerLodgingDetails!
                            .lodgingDescription
                            .toString(),
                        style: GoogleFonts.robotoSlab(
                          fontSize: 11.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Stay and Ski packages are now available when you pair your accommodation with lift tickets.',
                        style: GoogleFonts.robotoSlab(
                          fontSize: 11.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Book 3+ nights between January 1 – 31, 2024 to receive a free 100 CAD Whistler Dining Voucher, valid at participating restaurants. Enter promo code JANUARYDINING at check-out or call 1.844.932.0606 and mention this offer to the Whistler-based Travel Consultants.',
                        style: GoogleFonts.robotoSlab(
                          fontSize: 11.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Select Date',
                        style: GoogleFonts.robotoSlab(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Select Date',
                                style: GoogleFonts.robotoSlab(
                                  fontSize: 12.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              InkWell(
                                onTap: () {
                                  startDate(context);
                                },
                                child: SizedBox(
                                  width: 160,
                                  child: RegisterTextFieldWidget(
                                      controller: dateInput,
                                      prefix: Image.asset(
                                        'assets/images/calender.png',
                                        height: 10,
                                      ),
                                      readOnly: true,
                                      hint: startSelectedDate.toString(),
                                      onTap: () {
                                        startDate(context);
                                      }),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'End Date',
                                style: GoogleFonts.robotoSlab(
                                  fontSize: 12.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: 160,
                                child: RegisterTextFieldWidget(
                                    prefix: Image.asset(
                                      'assets/images/calender.png',
                                      height: 10,
                                    ),
                                    readOnly: true,
                                    hint: endSelectedDate.toString(),
                                    onTap: () {
                                      endDate(context);
                                    }),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () async {
                          final String url =
                              '${model.value.data!.searchLodging!.searchUrl}?arrivaldate=${startSelectedDate.toString()}&departuredate=${endSelectedDate.toString()}';
                          print('object${url.toString()}');
                          if (await canLaunch(url)) {
                            await launch(Uri.parse(url).toString());
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: Container(
                          height: 35,
                          width: 120,
                          decoration: BoxDecoration(
                              color: const Color(0xffE025E7),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                              child: Text(
                            'Search Loading',
                            style: GoogleFonts.roboto(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Prefer to book by phone?Call 1.844.932.0606',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 40,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount:
                                model.value.data!.accommodationsMenu!.length,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(right: 20),
                                height: 35,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: const Color(0xffE025E7),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Center(
                                    child: InkWell(
                                  onTap: () {
                                    if (index == 0) {
                                      Get.to(() => HosthotelScreen());
                                    } if (index == 1) {
                                      Get.to(() => BookAccommodationScreen());
                                    }
                                  },
                                  child: Text(
                                    model.value.data!.accommodationsMenu![index]
                                        .menuTitle
                                        .toString(),
                                    style: GoogleFonts.roboto(
                                      fontSize: 10,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )),
                              );
                            }),
                      ),
                      const SizedBox(
                        height: 80,
                      )
                    ],
                  ),
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
