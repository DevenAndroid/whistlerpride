import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whistlerpride/homepage.dart';
import 'package:whistlerpride/thefestival_Screen.dart';

class CustomBottomNavigationBar {
  static BottomNavigationBar build() {
    return BottomNavigationBar(
      items:  [
        BottomNavigationBarItem(
          icon: InkWell(
              onTap: (){
                Get.to(()=> HomePage());
              },
              child: Icon(Icons.home)),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: InkWell(
              onTap: (){
                Get.to(()=> TheFestivalScreen());
              },
              child: Icon(Icons.festival_outlined)),
          label: 'Festival',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.question_mark),
          label: 'Accommodations',
        ),
      ],
    );
  }
}
