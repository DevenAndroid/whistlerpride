import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whistlerpride/widgets/common_text_field.dart';

class BookAccommodationScreen extends StatefulWidget {
  const BookAccommodationScreen({super.key});

  @override
  State<BookAccommodationScreen> createState() =>
      _BookAccommodationScreenState();
}

class _BookAccommodationScreenState extends State<BookAccommodationScreen> {
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
      body: SingleChildScrollView(
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
                  child: Image.asset(
                    "assets/images/imagess.png",
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
                      margin: const EdgeInsets.only(right: 16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                      ),
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
                          Text(
                            "MAKE WHISTLER PRIDE PARTNERED HOTELS YOUR PREFERRED HOTELS",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w500, fontSize: 14),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "STAY LONGER AND SAVE UP TO 25% ON LODGING",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w500, fontSize: 8),
                          ),
                          const SizedBox(
                            height: 5,
                          ),

                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      "Book your Winter Pride and Ski Festival lodging",
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
                'ACCOMMODATIONS IN WHISTLER',
                style: GoogleFonts.robotoSlab(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Book your Winter Pride and Ski Festival lodging today and save up to 25%.',
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
                      SizedBox(
                        width: 160,
                        child: RegisterTextFieldWidget(
                            prefix: Image.asset(
                              'assets/images/calender.png',
                              height: 10,
                            ),
                            readOnly: true,
                            hint: "Start Date",
                            onTap: () {}),
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
                            hint: "End Date",
                            onTap: () {}),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Container(
                      height: 35,
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
                    width: 20,
                  ),
                  const Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Prefer to book by phone?Call 1.844.932.0606',
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 170,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 2,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        width: 170,
                        margin: const EdgeInsets.only(right: 16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.grey, // Set the desired border color
                            width: 2, // Set the desired border width
                          ),
                        ),
                        child: Image.asset(
                          'assets/images/image.png',
                          width: 130.0,
                          fit: BoxFit.cover,
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 80,
              )
            ],
          ),
        ),
      ),
    );
  }
}
