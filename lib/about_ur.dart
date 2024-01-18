import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whistlerpride/Repo/about_repo.dart';
import 'package:whistlerpride/model/aboutModel.dart';
import 'package:whistlerpride/widgets/apptheme.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  RxBool isDataLoading = false.obs;
  Rx<AboutModel> model = AboutModel().obs;

  getData() async {
    aboutData().then((value) {
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
              child:  Icon(Icons.arrow_back,color: Colors.black,)),
          title: Text(
            'About Us',
            style: GoogleFonts.robotoSlab(
                color: const Color(0xFF1D1D1D),
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
        ),
        body: Obx(() {
          return  isDataLoading.value?
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    model.value.data!.aboutBanner.toString(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    model.value.data!.aboutTitle.toString(),
                    style: GoogleFonts.robotoSlab(
                        color: const Color(0xFF000000),
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    model.value.data!.aboutContent.toString(),
                    style: GoogleFonts.robotoSlab(
                        color: const Color(0xFF000000),
                        fontSize: 12,
                        height: 2,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              )) : const Center(
              child: CircularProgressIndicator(
                color: AppTheme.primaryColor,
              ));
        }));
  }
}
