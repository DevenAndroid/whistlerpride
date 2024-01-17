import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:whistlerpride/model/aboutModel.dart';
import 'package:whistlerpride/model/faqModel.dart';
import '../apiUrl.dart';

Future<AboutModel> aboutData() async {

  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
  };
  http.Response response =
  await http.get(Uri.parse(ApiUrl.aboutModel), headers: headers);
  if (response.statusCode == 200) {
    return AboutModel.fromJson(json.decode(response.body));
  }
  else if (response.statusCode == 401) {
    throw Exception(response.body);
  }
  else {
    throw Exception(response.body);
  }
}


