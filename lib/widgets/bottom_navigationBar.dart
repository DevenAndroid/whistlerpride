import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whistlerpride/homepage.dart';
import 'package:whistlerpride/thefestival_Screen.dart';

class CustomBottomNavigationBar {
  static BottomNavigationBar build() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: InkWell(
            onTap: () {
              Get.to(() => HomePage());
            },
            child: Image.asset(
              'assets/images/home.png',
              height: 25,
            ),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: InkWell(
            onTap: () {
              Get.to(() => TheFestivalScreen());
            },
            child: Image.asset(
              'assets/images/festival.png',
              height: 25,
            ),
          ),
          label: 'Festival',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/acc.png',
            height: 25,
          ),
          label: 'Accommodations',
        ),
      ],
    );
  }
}
