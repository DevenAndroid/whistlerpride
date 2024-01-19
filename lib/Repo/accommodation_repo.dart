import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../apiUrl.dart';
import '../model/accommodationModel.dart';

Future<AccommodationsModel> accommodationsData() async {

  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
  };
  http.Response response =
  await http.get(Uri.parse(ApiUrl.AccommodationsModelUSUrl), headers: headers);
  if (response.statusCode == 200) {
    return AccommodationsModel.fromJson(json.decode(response.body));
  }
  else if (response.statusCode == 401) {
    throw Exception(response.body);
  }
  else {
    throw Exception(response.body);
  }
}


