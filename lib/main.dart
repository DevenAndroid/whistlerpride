import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whistlerpride/splashScreen.dart';
import 'package:whistlerpride/thefestival_Screen.dart';
import 'package:whistlerpride/whistler_thing%20screen.dart';
import 'package:whistlerpride/youth_programming.dart';

import 'about_ur.dart';
import 'bOOKACCOMMODATIONS_screen.dart';
import 'bOOKACCOMMODATIONStwo_Screen.dart';
import 'contact_screen.dart';
import 'faq_screen.dart';
import 'homepage.dart';
import 'host _hotel_screen.dart';
import 'notification.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Whistler Pride',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const SplashScreen(),
    );
  }
}

