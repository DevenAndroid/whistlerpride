
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whistlerpride/Repo/thefestival_repo.dart';
import 'package:whistlerpride/model/thefestivalModel.dart';
import 'package:whistlerpride/whistler_Pride_Events_screen.dart';
import 'package:whistlerpride/widgets/apptheme.dart';
import 'package:whistlerpride/widgets/bottom_navigationBar.dart';

class TheFestivalScreen extends StatefulWidget {
  const TheFestivalScreen({super.key});

  @override
  State<TheFestivalScreen> createState() => _TheFestivalScreenState();
}

class _TheFestivalScreenState extends State<TheFestivalScreen> {
  RxBool isDataLoading = false.obs;
  Rx<TheFestivalModel> model = TheFestivalModel().obs;

  getData() async {
    thefestivalData().then((value) {
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
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back)),
        title: const Text(
          'The Festival',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: CustomBottomNavigationBar
            .build()
            .items,
      ),
      body: Obx(() {
        return isDataLoading.value
            ? SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        model.value.data!.festivalTitle.toString(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        model.value.data!.festivalDate.toString(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    ListView.builder(
                      itemCount: model.value.data!.festivalLists!.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(16.0),
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(11),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(
                                    0.5,
                                    0.5,
                                  ),
                                  blurRadius: 3,
                                  spreadRadius: 1,
                                ),
                              ]
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Left side: Image
                              Container(
                                margin: const EdgeInsets.only(right: 16.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(11),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(11),
                                  child: Image.network(
                                    model.value.data!.festivalLists![index].festivalImage.toString(),
                                    width: 130.0,
                                    height: 140,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Title
                                    Text(
                                      model.value.data!.festivalLists![index]
                                          .festivalTitle
                                          .toString(),
                                      style: GoogleFonts.roboto(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),

                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: model
                                                .value
                                                .data!
                                                .festivalLists![index]
                                                .festivalMessage
                                                .toString()
                                                .substring(0, 120),
                                            style: GoogleFonts.robotoSlab(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          TextSpan(
                                            text: ' Read More',
                                            style: GoogleFonts.robotoSlab(
                                                color: Color(0xFFE025E7),
                                                fontSize: 11,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    // Button
                                    model.value.data!.festivalLists![index]
                                                .festivalButtonName !=
                                            ""
                                        ? Container(
                                            height: 35,
                                            width: 120,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                              color: const Color(0xffE025E7),
                                            ),
                                            child: Center(
                                                child: Text(
                                              model
                                                  .value
                                                  .data!
                                                  .festivalLists![index]
                                                  .festivalButtonName
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white),
                                            )),
                                          )
                                        : const SizedBox.shrink()
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    GridView.builder(
                        shrinkWrap: true,
                        itemCount: model.value.data!.festivalMenu!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 0,
                                mainAxisExtent: 60,
                                mainAxisSpacing: 1.0),
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Flexible(
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              color: const Color(0xffE025E7),
                              child: Center(
                                child: Text(
                                  model.value.data!.festivalMenu![index].menuTitle.toString(),
                                  style: const TextStyle(fontSize: 10, color: Colors.white),
                                ),
                              ),
                            ),
                          );
                        })
                  ],
                ),
              )
            : const Center(
                child: CircularProgressIndicator(
                color: AppTheme.primaryColor,
              ));
      }),
    );
  }
}
