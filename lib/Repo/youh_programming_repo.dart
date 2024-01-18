import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../apiUrl.dart';
import '../model/get_whistler_pride_events_model.dart';
import '../model/youth_programming_model.dart';



Future<GetYouthProgrammingModel> getYouthProgramRepo() async {
  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
  };

  http.Response response = await http.get(Uri.parse(ApiUrl.getYouthProgram),
    headers: headers,
  );

  log("Api Url....    "+ApiUrl.getWhistlerEvents.toString());
  log("Api response....    "+response.body.toString());
  if (response.statusCode == 200) {
    return GetYouthProgrammingModel.fromJson(jsonDecode(response.body));
  } else {
    return GetYouthProgrammingModel(message: jsonDecode(response.body)["message"], status: false, data: null);
  }
}