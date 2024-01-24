import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whistlerpride/widgets/apptheme.dart';

import 'Repo/notification_repo.dart';
import 'model/notificationModel.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  RxBool isDataLoading = false.obs;
  Rx<NotificationModel> model = NotificationModel().obs;

  getData() async {
    notificationData().then((value) {
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
          'Notifications',
          style: GoogleFonts.robotoSlab(
              color: const Color(0xFF1D1D1D),
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
      ),
      body: Obx(() {
        return isDataLoading.value?
        SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(top: 10),
            child: ListView.builder(
                itemCount: model.value.data!.notifications!.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  // final item = getNotificationController.getNotificationModel.value.data!.notificationData![index];
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 0),
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(11),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                            width: 5,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: AppTheme.notification,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const CircleAvatar(
                            maxRadius: 20,
                            minRadius: 20,
                            backgroundColor: AppTheme.notification,
                            child: Text("T")),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                model.value.data!.notifications![index].date
                                    .toString(),
                                style: GoogleFonts.robotoSlab(
                                    color: const Color(0xFFC33D18),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                model.value.data!.notifications![index].title
                                    .toString(),
                                style: GoogleFonts.robotoSlab(
                                    color: const Color(0xFF000000),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                model.value.data!.notifications![index].message
                                    .toString(),
                                style: GoogleFonts.robotoSlab(
                                    color: const Color(0xFF6F7183),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                })) : const Center(
            child: CircularProgressIndicator(
              color: AppTheme.primaryColor,
            ));
      }),
    );
  }
}
