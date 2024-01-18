import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whistlerpride/widgets/common_text_field.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(Icons.arrow_back)),
          title: Text(
            'Contact Us',
            style: GoogleFonts.robotoSlab(
                color: const Color(0xFF1D1D1D),
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
        ),
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("assets/images/contact.png"),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Get In Touch With Us',
                    style: GoogleFonts.robotoSlab(
                        color: const Color(0xFF000000),
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    'Please feel free to use this form to contact Whistler Pride Festival. We would love to hear from you.',
                    style: GoogleFonts.robotoSlab(
                        color: const Color(0xFF000000),
                        fontSize: 12,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Contact us',
                    style: GoogleFonts.robotoSlab(
                        color: const Color(0xFF000000),
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Name',
                    style: GoogleFonts.robotoSlab(
                        color: const Color(0xFF000000),
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  RegisterTextFieldWidget(
                    hint: "Enter your Name",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Email',
                    style: GoogleFonts.robotoSlab(
                        color: const Color(0xFF000000),
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  RegisterTextFieldWidget(
                    hint: "Enter your Email",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Phone Number',
                    style: GoogleFonts.robotoSlab(
                        color: const Color(0xFF000000),
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  RegisterTextFieldWidget(
                    hint: "Enter your mobile",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Message',
                    style: GoogleFonts.robotoSlab(
                        color: const Color(0xFF000000),
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  RegisterTextFieldWidget(
                    hint: "Massage",
                    maxLines: 10,
                    minLines: 4,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 200),
                    child: CommonButtonBlue(
                      title: 'Send',
                    ),
                  )
                ])));
  }
}
