import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whistlerpride/model/faqModel.dart';
import 'package:whistlerpride/widgets/apptheme.dart';

import 'Repo/faq_repo.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  RxBool isDataLoading = false.obs;
  Rx<FaqModel> model = FaqModel().obs;

  getData() async {
    faqData().then((value) {
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
          title: Text(
            'FAQ',
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
              padding: const EdgeInsets.all(10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      model.value.data!.faqBanner.toString(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Frequently Asked Questions',
                      style: GoogleFonts.robotoSlab(
                          color: const Color(0xFF000000),
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Column(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: AppTheme.notification, width: 1),
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 0,
                                          offset: Offset(0, 0))
                                    ]),
                                child: Theme(
                                  data: Theme.of(context)
                                      .copyWith(
                                      dividerColor: Colors.transparent),
                                  child: ExpansionTile(
                                    backgroundColor: const Color(0xFFFCFBFA),
                                    iconColor: const Color(0xFF000000),
                                    collapsedIconColor: const Color(0xFF000000),
                                    childrenPadding: const EdgeInsets.all(1),
                                    title: Text(
                                      model.value.data!.faqTabContent![index].questions.toString(),
                                      style: GoogleFonts.robotoSlab(
                                        color: const Color(0xFF0F0F0F),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                      ),
                                    ),
                                    children: <Widget>[
                                      ListTile(
                                        iconColor: const Color(0xFF07B6CA),
                                        isThreeLine: true,
                                        subtitle: Text(
                                          model.value.data!.faqTabContent![index].answered.toString(),
                                          style: GoogleFonts.robotoSlab(
                                            color: const Color(0xFF000000),
                                            fontWeight: FontWeight.w300,
                                            fontSize: 12,
                                          ),
                                        ),
                                        dense: true,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          );
                        })
                  ])): const Center(
              child: CircularProgressIndicator(
                color: AppTheme.primaryColor,
              ));
        }));
  }
}
