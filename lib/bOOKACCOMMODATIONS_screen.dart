import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:whistlerpride/widgets/bottom_navigationBar.dart';
import 'package:whistlerpride/widgets/common_text_field.dart';

import 'bOOKACCOMMODATIONStwo_Screen.dart';

class BOOKACCOMMODATIONSScreen extends StatefulWidget {
  const BOOKACCOMMODATIONSScreen({super.key});

  @override
  State<BOOKACCOMMODATIONSScreen> createState() =>
      _BOOKACCOMMODATIONSScreenState();
}

class _BOOKACCOMMODATIONSScreenState extends State<BOOKACCOMMODATIONSScreen> {
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
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back)),
        title: const Text(
          'BOOK ACCOMMODATIONS',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: CustomBottomNavigationBar.build().items,
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/imagess.png'),
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

                          const Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      'Lift tickets are required for all on-mountain activities and we encourage guests to',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 10),
                                ),
                                TextSpan(
                                  text: ' Read More',
                                  style: TextStyle(
                                      color: Color(0xffE025E7),
                                      fontWeight: FontWeight.w300,
                                      fontSize: 10),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: (){
                              Get.to(const BOOKACCOMMODATIONSTWOScreen());
                            },
                            child: Container(
                              height: 35,
                              width: 100,
                              decoration: BoxDecoration(color:  Color(0xffE025E7),borderRadius: BorderRadius.circular(5)),
                              child: const Center(
                                  child: Text(
                                    'Hotel Package',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white),
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
              const Text(
                'STAY LONGER AND SAVE UP TO 25% ON LODGING ',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Book your Winter Pride and Ski Festival lodging today and save up to 25%.',
                style: TextStyle(
                  fontSize: 11.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Stay and Ski packages are now available when you pair your accommodation with lift tickets.',
                style: TextStyle(
                  fontSize: 11.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Book 3+ nights between January 1 – 31, 2024 to receive a free 100 CAD Whistler Dining Voucher, valid at participating restaurants. Enter promo code JANUARYDINING at check-out or call 1.844.932.0606 and mention this offer to the Whistler-based Travel Consultants.',
                style: TextStyle(
                  fontSize: 11.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Salect Date',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: SizedBox(
                      width: 200,
                      child: RegisterTextFieldWidget(
                          readOnly: true, hint: "Start Date", onTap: () {}),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 200,
                      child: RegisterTextFieldWidget(
                        readOnly: true,
                        hint: "End Date",
                        onTap: () {},
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 35,
                width: 120,
                color: const Color(0xffE025E7),
                child: const Center(
                    child: Text(
                  'Search Lodging',
                  style: TextStyle(fontSize: 10, color: Colors.white),
                )),
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
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: SizedBox(
                      width: 200,
                      child: Container(
                        height: 35,
                        width: 120,
                        color: const Color(0xffE025E7),
                        child: const Center(
                            child: Text(
                          'Host Hotel',
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 200,
                      child: Container(
                        height: 35,
                        width: 120,
                        color: const Color(0xffE025E7),
                        child: const Center(
                            child: Text(
                          'Book Accommodations',
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        )),
                      ),
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
