import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whistlerpride/widgets/common_text_field.dart';
import 'dart:ui' as ui;
import 'apiUrl.dart';
import 'controller/get_book_acco_controller.dart';

class BookAccommodationScreen extends StatefulWidget {
  const BookAccommodationScreen({super.key});

  @override
  State<BookAccommodationScreen> createState() =>
      _BookAccommodationScreenState();
}

class _BookAccommodationScreenState extends State<BookAccommodationScreen> {

  final getBookAccoController = Get.put(GetBookAccoController());

  DateTime startSelectedDate = DateTime.now();
  DateTime endSelectedDate = DateTime.now().add(const Duration(days: 1));
  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  openDialPad(String phoneNumber) async {
    Uri url = Uri(scheme: "tel", path: phoneNumber);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print("Can't open dial pad.");
    }
  }
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
  @override
  void initState() {
    super.initState();
    getBookAccoController.getBookAcco();
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
        title: Text(
          'BOOK ACCOMMODATIONS',
          style: GoogleFonts.robotoSlab(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: Obx(() {
        return getBookAccoController.statusOfGetBookAcco.value.isSuccess ?
          SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                    children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: SizedBox(
                      height: Get.height * .26,
                      width: Get.width,
                      child: Image.network(
                        getBookAccoController.getBookAccoModel.value.data!.bookAccommodationsBanner.toString(),
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
                      Positioned(
                        bottom: 10,
                        left: 10,
                        right: 10,
                        child: Text(
                          getBookAccoController.getBookAccoModel.value.data!.bookAccommodationsTitle.toString(),
                          style: GoogleFonts.robotoSlab(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ),


                ]),
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
                      SizedBox(
                        height: 130,
                       width: 130.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(9),
                          child: Image.network(
                              getBookAccoController.getBookAccoModel.value.data!.pridePartneredDetails!.pridePartneredImage.toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Title
                            Text(
                              getBookAccoController.getBookAccoModel.value.data!.pridePartneredDetails!.pridePartneredTitle.toString(),
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w500, fontSize: 14),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              getBookAccoController.getBookAccoModel.value.data!.pridePartneredDetails!.pridePartneredSubtitle.toString(),
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w500, fontSize: 9),
                            ),
                            const SizedBox(
                              height: 5,
                            ),

                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                              getBookAccoController.getBookAccoModel.value.data!.pridePartneredDetails!.pridePartneredDescription.toString().substring(0,50),
                                    style: GoogleFonts.robotoSlab(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 11),
                                  ),
                                  TextSpan(
                                    text: ' Read More',
                                    style: GoogleFonts.robotoSlab(
                                        color: const Color(0xffE025E7),
                                        fontWeight: FontWeight.w600,
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
                  height: 15,
                ),
                Text(
                  getBookAccoController.getBookAccoModel.value.data!.bookAccommodationsDetails!.accommodationsTitle.toString(),
                  style: GoogleFonts.robotoSlab(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  getBookAccoController.getBookAccoModel.value.data!.bookAccommodationsDetails!.accommodationsDescription.toString(),
                  style: GoogleFonts.robotoSlab(
                    fontSize: 11.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(
                  height: 15,
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
                  height: 16,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Start Date',
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
                                hint: startSelectedDate.toLocal().toIso8601String().split('T')[0],
                                onTap: () {
                                  startDate(context);
                                }),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,),
                    Expanded(
                      child: Column(
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
                                hint: endSelectedDate.toLocal().toIso8601String().split('T')[0],
                                onTap: () {
                                  endDate(context);
                                }),
                          ),
                        ],
                      ),
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
                      child: GestureDetector(
                        onTap: (){
                          if(startSelectedDate.toString() != '' && endSelectedDate.toString() != ''){
                            launchURL('${ getBookAccoController.getBookAccoModel.value.data!.searchLodging!.searchUrl
                                .toString()}?arrivaldate=${startSelectedDate.toString()}&departuredate=${endSelectedDate
                                .toString()}');
                          }else{
                            showToast('Please Select Start & End Date');
                          }
                        },
                        child: Container(
                          height: 40,
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
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                     Expanded(
                      child: GestureDetector(
                        onTap: (){
                          openDialPad(getBookAccoController.getBookAccoModel.value.data!.preferToBookByPhone.toString());
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Prefer to book by phone?Call  ',
                                  style: GoogleFonts.robotoSlab(
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black,
                                      fontSize: 11),
                                ),
                                TextSpan(
                                  text: getBookAccoController.getBookAccoModel.value.data!.preferToBookByPhone.toString(),
                                  style: GoogleFonts.robotoSlab(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 170,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount:  getBookAccoController.getBookAccoModel.value.data!.accommodationsImageLists!.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        var item = getBookAccoController.getBookAccoModel.value.data!.accommodationsImageLists![index];
                        return GestureDetector(
                          onTap: (){
                            launchURL(item.accommodationsImageUrl.toString());
                          },
                          child: Container(
                            width: 170,
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.only(right: 16.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.grey, // Set the desired border color
                                width: 0.8, // Set the desired border width
                              ),
                            ),
                            child: Image.network(
                              item.accommodationsImage.toString(),
                              width: 130.0,
                              fit: BoxFit.contain,
                            ),
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
        ): const Center(child: CircularProgressIndicator());
      }),
    );
  }
}
