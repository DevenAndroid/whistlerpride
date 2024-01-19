import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:whistlerpride/apiUrl.dart';
import '../model/model_email_send.dart';
import '../widgets/helper.dart';

Future<ModelSendEmail> sendEmailRepo({context, name,email,message,formtype}) async {
  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
  };
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};
  map['name'] = name;
  map['email'] = email;
  map['message'] = message;
  map['formtype'] = formtype;
  http.Response response = await http.post(Uri.parse(ApiUrl.sendMail),
      headers: headers, body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  print(map);

  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return ModelSendEmail.fromJson(jsonDecode(response.body));
  } else {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return ModelSendEmail(
      message: jsonDecode(response.body)["message"],
    );
  }
}
