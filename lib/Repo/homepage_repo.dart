import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../apiUrl.dart';
import '../model/homePageModel.dart';

Future<HomePageModel> homeData() async {

  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
  };
  http.Response response =
  await http.get(Uri.parse(ApiUrl.HomePageModel), headers: headers);
  if (response.statusCode == 200) {
    log("<<<<<<<UserProfileData from repository=======>${response.body}");
    return HomePageModel.fromJson(json.decode(response.body));
  }
  else if (response.statusCode == 401) {
    print(response.statusCode);

    throw Exception(response.body);
  }
  else {
    throw Exception(response.body);
  }
}


