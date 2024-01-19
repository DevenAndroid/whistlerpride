import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whistlerpride/controller/send_mail_controller.dart';
import 'package:whistlerpride/widgets/common_text_field.dart';

import 'Repo/host_hotel_repo.dart';
import 'model/host_hotel_model.dart';

class HosthotelScreen extends StatefulWidget {
  const HosthotelScreen({super.key});

  @override
  State<HosthotelScreen> createState() => _HosthotelScreenState();
}

class _HosthotelScreenState extends State<HosthotelScreen> {
  GoogleMapController? myController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  Rx<RxStatus> statusOfGetHostHotel = RxStatus.empty().obs;
  Rx<ModelHostHotel> getHostHotel = ModelHostHotel().obs;

  Future getCharityRace() async {
    statusOfGetHostHotel.value = RxStatus.empty();
    await getHostHotelRepo().then((value) {
      statusOfGetHostHotel.value = RxStatus.success();
      getHostHotel.value = value;
    });
  }

  final sendMailController = Get.put(SendMailController());
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCharityRace();
  }
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
            child:  const Icon(Icons.arrow_back,color: Colors.black,)),
        title:  Text(
          'Host hotel',
        style:  GoogleFonts.robotoSlab(fontSize: 15, color: Colors.black,fontWeight: FontWeight.w500),

        ),
      ),

      body: Obx(() {
      return statusOfGetHostHotel.value.isSuccess ?

      SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             ClipRRect(
                 borderRadius: BorderRadius.circular(10),
                 child: Image.network( getHostHotel.value.data!.hostHotelBanner.toString())),

              SizedBox(
                height: 130,
                child: ListView.builder(
                  itemCount: getHostHotel.value.data!.hotelFeaturedImages!.length,
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        ClipRRect(
                          borderRadius:BorderRadius.circular(10) ,
                          child: Image.network(
                          
                              getHostHotel.value.data!.hotelFeaturedImages![index].toString(),
                            height: 80,
                            width: 80,
                            fit: BoxFit.fill,
                          
                          ),
                        ),
                        SizedBox(width: 10,)
                      ],
                    );
                  },
                ),
              ),
              

              Text(
                getHostHotel.value.data!.whistlerHotelTitle.toString(),
                style: GoogleFonts.oswald(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                getHostHotel.value.data!.whistlerHotelDescription.toString(),
                style: GoogleFonts.robotoSlab(
                    color: Colors.black,
                    fontSize: 11,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: 10,
              ),

              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: (){

                  if (getHostHotel
                      .value
                      .data!
                      .isAnotherUrl ==
                      true) {
                    _launchInBrowser(Uri.parse(getHostHotel
                        .value
                        .data!
                        .buttonUrl.toString()
                    ));
                  }
                  Get.to(const HosthotelScreen());
                },
                child: Container(
                  height: 35,
                  width: 120,
                  decoration: BoxDecoration(
                      color: const Color(0xffE025E7),
                      borderRadius: BorderRadius.circular(3)),
                  child: Center(
                      child: Text(
                          getHostHotel
                              .value
                              .data!
                              .buttonName.toString(),
                        style:
                        GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600),
                      )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'NOT SEEING WHAT YOU ARE LOOKING FOR?',
                style: GoogleFonts.robotoSlab(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Name',

                style:
                GoogleFonts.robotoSlab(fontSize: 12, color: Colors.black,fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 10,
              ),
               RegisterTextFieldWidget(
                controller: sendMailController.nameController,
                hint: 'Enter your Name',
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Email',
                style:
                GoogleFonts.robotoSlab(fontSize: 12, color: Colors.black,fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 10,
              ),
               RegisterTextFieldWidget(
                controller: sendMailController.emailController,
                hint: 'Enter your Email',
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Message',
                style:
                GoogleFonts.robotoSlab(fontSize: 12, color: Colors.black,fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 10,
              ),
               RegisterTextFieldWidget(
                controller: sendMailController.messageController,
                hint: 'Message',
                maxLines: 5,
                minLines: 5,
              ),
              const SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  sendMailController.send(context);
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
                        style:
                        GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600),
                      )),
                ),
              ),
              const SizedBox(height: 20,),
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
      ): const Center(child: CircularProgressIndicator());

  }));
}}
