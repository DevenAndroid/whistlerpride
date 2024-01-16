import 'package:flutter/material.dart';

class CustomBottomNavigationBar {
  static BottomNavigationBar build() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.festival_outlined),
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
