import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../apiUrl.dart';
import '../model/charity_ski_model.dart';
import '../model/getPride_eat_model.dart';
import '../model/get_things_to_model.dart';

Future<GetCharitySkiRaceModel> getCharitySkiRepo() async {
  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
  };
  http.Response response = await http.get(Uri.parse(ApiUrl.getPrideCharity),
    headers: headers,
  );

  log("Api Url....    "+ApiUrl.getWhistlerEvents.toString());
  log("Api response....    "+response.body.toString());
  if (response.statusCode == 200) {
    return GetCharitySkiRaceModel.fromJson(jsonDecode(response.body));
  } else {
    return GetCharitySkiRaceModel(message: jsonDecode(response.body)["message"], status: false, data: null);
  }

}
