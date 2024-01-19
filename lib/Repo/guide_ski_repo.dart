import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../apiUrl.dart';
import '../model/get_guide_ski_model.dart';

Future<GetGuideSkiModel> getGuideSkiRepo() async {
  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
  };
  // try {
  http.Response response = await http.get(Uri.parse(ApiUrl.getGuideSkiUrl),
    headers: headers,
  );

  log("Api Url....    "+ApiUrl.getWhistlerEvents.toString());
  log("Api response....    "+response.body.toString());
  if (response.statusCode == 200) {
    return GetGuideSkiModel.fromJson(jsonDecode(response.body));
  } else {
    return GetGuideSkiModel(message: jsonDecode(response.body)["message"], status: false, data: null);
  }
  // } catch (e) {
  //   return GetWhistlerPrideEventsModel(message: e.toString(), status: false, data: null);
  // }
}


