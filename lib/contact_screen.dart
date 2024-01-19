import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whistlerpride/widgets/apptheme.dart';
import 'package:whistlerpride/widgets/common_text_field.dart';

import 'Repo/get_contactUs_repo.dart';
import 'Repo/post_conatctus_repo.dart';
import 'model/get_contactUSModel.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  RxBool isDataLoading = false.obs;
  Rx<GetContactUsModel> model = GetContactUsModel().obs;

  getData() async {
    getcontactusData().then((value) {
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
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          title: Text(
            'Contact Us',
            style: GoogleFonts.robotoSlab(
                color: const Color(0xFF1D1D1D),
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
        ),
        body: Obx(() {
          return isDataLoading.value
              ? SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("assets/images/contact.png"),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          model.value.data!.contactTitle.toString(),
                          style: GoogleFonts.robotoSlab(
                              color: const Color(0xFF000000),
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          model.value.data!.contactDescription.toString(),
                          style: GoogleFonts.robotoSlab(
                              color: const Color(0xFF000000),
                              fontSize: 12,
                              fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Contact us',
                          style: GoogleFonts.robotoSlab(
                              color: const Color(0xFF000000),
                              fontSize: 17,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Name',
                          style: GoogleFonts.robotoSlab(
                              color: const Color(0xFF000000),
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        RegisterTextFieldWidget(
                          hint: "Enter your Name",
                          controller: nameController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Email',
                          style: GoogleFonts.robotoSlab(
                              color: const Color(0xFF000000),
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        RegisterTextFieldWidget(
                          hint: "Enter your Email",
                          controller: emailController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Message',
                          style: GoogleFonts.robotoSlab(
                              color: const Color(0xFF000000),
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        RegisterTextFieldWidget(
                          controller: messageController,
                          hint: "Massage",
                          maxLines: 10,
                          minLines: 4,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () async {

                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            var id = prefs.getString("deviceId");

                            postConatctUSRepo(
                              nameController.text,
                              emailController.text,
                              messageController.text,
                               "ContactUS",
                              context
                            ).then((value) async {
                              if (value.status == true) {
                                Fluttertoast.showToast(
                                  msg: value.message.toString(),

                                );
                                nameController.clear();
                              emailController.clear();
                              messageController.clear();
                              } else {
                                Fluttertoast.showToast(
                                  msg: value.message.toString(),
                                );
                              }
                            });
                          },
                          child: Container(
                            height: 35,
                            width: 120,
                            decoration: BoxDecoration(
                                color: const Color(0xffE025E7),
                                borderRadius: BorderRadius.circular(3)),
                            child: Center(
                                child: Text(
                              'Send',
                              style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            )),
                          ),
                        ),
                      ]))
              : const Center(
                  child: CircularProgressIndicator(
                  color: AppTheme.primaryColor,
                ));
        }));
  }
}
