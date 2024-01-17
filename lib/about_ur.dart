import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back)),
        title:  Text(
          'About Us',
          style: GoogleFonts.robotoSlab(
              color: const Color(0xFF1D1D1D),
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
      ),
        body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(10),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
Image.asset("assets/images/about.png"),
      SizedBox(height: 10,),
      Text(
        'WHISTLER PRIDE AND SKI FESTIVAL',
        style: GoogleFonts.robotoSlab(
            color: const Color(0xFF000000),
            fontSize: 16,
            fontWeight: FontWeight.w600),
      ),
      SizedBox(height: 10,),
      Text(
        'Whistler Pride and Ski Festival is the world’s best annual LGBTQ2+ Ski/Snowboard week at the award-winning Whistler and Blackcomb mountains. It is a celebration of diversity both on the slopes and throughout the alpine village of Resort Municipality of Whistler, British Columbia, Canada. The Whistler Pride and Ski Festival is more than just a ski week, it is an 8-day festival that combines Sports, Culinary, Wellness and spectacular Social and Cultural events.',
        style: GoogleFonts.robotoSlab(
            color: const Color(0xFF000000),
            fontSize: 12,
            height: 2,
            fontWeight: FontWeight.w300),
      ),
      Text(
        'Whistler Pride and Ski Festival is the world’s best annual LGBTQ2+ Ski/Snowboard week at the award-winning Whistler and Blackcomb mountains. It is a celebration of diversity both on the slopes and throughout the alpine village of Resort Municipality of Whistler, British Columbia, Canada. The Whistler Pride and Ski Festival is more than just a ski week, it is an 8-day festival that combines Sports, Culinary, Wellness and spectacular Social and Cultural events.',
        style: GoogleFonts.robotoSlab(
            color: const Color(0xFF000000),
            fontSize: 12,
            height: 2,
            fontWeight: FontWeight.w300),
      ),
      Text(
        'Whistler Pride and Ski Festival is the world’s best annual LGBTQ2+ Ski/Snowboard week at the award-winning Whistler and Blackcomb mountains. It is a celebration of diversity both on the slopes and throughout the alpine village of Resort Municipality of Whistler, British Columbia, Canada. The Whistler Pride and Ski Festival is more than just a ski week, it is an 8-day festival that combines Sports, Culinary, Wellness and spectacular Social and Cultural events.',
        style: GoogleFonts.robotoSlab(
            color: const Color(0xFF000000),
            fontSize: 12,
            height: 2,
            fontWeight: FontWeight.w300),
      ),

    ],
    )
            ));
  }
}
