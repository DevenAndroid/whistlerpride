import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../apiUrl.dart';
import '../model/getPride_eat_model.dart';
import '../model/get_things_to_model.dart';

Future<GetThingsToDoModel> getThingsToDoRepo() async {
  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
  };
  http.Response response = await http.get(Uri.parse(ApiUrl.getThingsToDo),
    headers: headers,
  );

  log("Api Url....    "+ApiUrl.getWhistlerEvents.toString());
  log("Api response....    "+response.body.toString());
  if (response.statusCode == 200) {
    return GetThingsToDoModel.fromJson(jsonDecode(response.body));
  } else {
    return GetThingsToDoModel(message: jsonDecode(response.body)["message"], status: false, data: null);
  }

}


Future<GetPrideEatModel> getPrideEatRepo() async {
  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
  };
  http.Response response = await http.get(Uri.parse(ApiUrl.getPrideEat),
    headers: headers,
  );

  log("Api Url....    "+ApiUrl.getWhistlerEvents.toString());
  log("Api response....    "+response.body.toString());
  if (response.statusCode == 200) {
    return GetPrideEatModel.fromJson(jsonDecode(response.body));
  } else {
    return GetPrideEatModel(message: jsonDecode(response.body)["message"], status: false, data: null);
  }

}


