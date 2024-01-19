import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../apiUrl.dart';
import '../model/getPride_eat_model.dart';
import '../model/get_pride_comm_model.dart';
import '../model/get_things_to_model.dart';

Future<GetParadeAndCommModel> getParadeRepo() async {
  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
  };
  http.Response response = await http.get(Uri.parse(ApiUrl.getParadeUrl),
    headers: headers,
  );

  log("Api Url....    "+ApiUrl.getWhistlerEvents.toString());
  log("Api response....    "+response.body.toString());
  if (response.statusCode == 200) {
    return GetParadeAndCommModel.fromJson(jsonDecode(response.body));
  } else {
    return GetParadeAndCommModel(message: jsonDecode(response.body)["message"], status: false, data: null);
  }

}
