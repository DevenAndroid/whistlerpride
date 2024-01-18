import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:whistlerpride/widgets/bottom_navigationBar.dart';
import 'package:whistlerpride/widgets/common_text_field.dart';

class HosthotelScreen extends StatefulWidget {
  const HosthotelScreen({super.key});

  @override
  State<HosthotelScreen> createState() => _HosthotelScreenState();
}

class _HosthotelScreenState extends State<HosthotelScreen> {
  GoogleMapController? myController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    myController = controller;
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
        title: const Text(
          'Host hotel',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),

      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/imagess.png'),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'The Aava Whistler Hotel - Your Festival Basecamp',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'We’ve negotiated a great low rate for Whistler Pride guests to make the Aava Whistler Hotel the best place to stay during Whistler Pride.',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 11,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Stay where the action is! Get easy access to our welcome centre, event shuttle pick-up/drop-off, and be only few steps away from the event venue for our biggest events. A two-minute walk from Whistler Village, a five-minute stroll from the Whistler and Blackcomb Mountain gondolas.. Read More',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 11,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: (){
                  Get.to(const HosthotelScreen());
                },
                child: Container(
                  height: 35,
                  width: 100,
                  decoration: BoxDecoration(
                      color: const Color(0xffE025E7),
                      borderRadius: BorderRadius.circular(5)),
                  child: const Center(
                      child: Text(
                        'Book Now',
                        style:
                        TextStyle(fontSize: 10, color: Colors.white),
                      )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'NOT SEEING WHAT YOU ARE LOOKING FOR?',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Name',
                style:
                TextStyle(fontSize: 12, color: Colors.black,fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 10,
              ),
              RegisterTextFieldWidget(
                hint: 'Enter your Name',
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Email',
                style:
                TextStyle(fontSize: 12, color: Colors.black,fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 10,
              ),
              RegisterTextFieldWidget(
                hint: 'Enter your Email',
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Message',
                style:
                TextStyle(fontSize: 12, color: Colors.black,fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 10,
              ),
              RegisterTextFieldWidget(
                hint: 'Message',
                maxLines: 5,
                minLines: 5,
              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  Get.to(const HosthotelScreen());
                },
                child: Container(
                  height: 35,
                  width: 100,
                  decoration: BoxDecoration(
                      color: const Color(0xffE025E7),
                      borderRadius: BorderRadius.circular(5)),
                  child: const Center(
                      child: Text(
                        'Send',
                        style:
                        TextStyle(fontSize: 10, color: Colors.white),
                      )),
                ),
              ),
              SizedBox(
                height: 200,
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 10.0,
                  ),
                ),
              ),
      ],
          ),
        ),
      ),
    );
  }
}
