import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whistlerpride/widgets/apptheme.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back)),
        title:  Text(
          'Notifications',
            style: GoogleFonts.robotoSlab(
        color: const Color(0xFF1D1D1D),
          fontSize: 16,
          fontWeight: FontWeight.w400),
    ),
        ),
      body: Column(
        children: [
          SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(top: 10),
      child:
       ListView.builder(
          itemCount: 4,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            // final item = getNotificationController.getNotificationModel.value.data!.notificationData![index];
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(11),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      width: 5,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppTheme.notification,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                      maxRadius: 20,
                      minRadius: 20,
                      backgroundColor: AppTheme.notification,
                      child: Text("T")
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Date - 12-01-2024",

            style: GoogleFonts.robotoSlab(
            color: const Color(0xFFC33D18),
            fontSize: 10,
            fontWeight: FontWeight.w400),       ),
                    SizedBox(height: 5,),
                        Text(
                          "Lorem ipsum dolor sit amet",
            style: GoogleFonts.robotoSlab(
            color: const Color(0xFF000000),
            fontSize: 15,
            fontWeight: FontWeight.w400),   ),
                        SizedBox(height: 3,),
                        Text(
                          "Lorem ipsum dolor sit amet Consectetur",
            style: GoogleFonts.robotoSlab(
            color: const Color(0xFF6F7183),
            fontSize: 12,
            fontWeight: FontWeight.w400),   ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          })
          )],
      ),




      );

  }
}
