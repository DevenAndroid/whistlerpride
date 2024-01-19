import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Repo/send_email_repo.dart';
import '../apiUrl.dart';
import '../model/model_email_send.dart';

class SendMailController extends GetxController{
  Rx<RxStatus> statusOfSend = RxStatus.empty().obs;
  Rx<ModelSendEmail> Send = ModelSendEmail().obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  send(context) async {
    sendEmailRepo(
       context: context,
      email:emailController.text.toString() ,
      formtype: "Host_hotel",
      message: messageController.text.toString(),
      name: nameController.text.toString()
      ).then((value) async {

      Send.value = value;
        if (value.status == true) {

          showToast(value.message.toString());
          statusOfSend.value = RxStatus.success();
        } else {
          statusOfSend.value = RxStatus.error();
          showToast(value.message.toString());
        }
      });
    }
  }


