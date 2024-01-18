import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../apiUrl.dart';
import '../model/get_whistler_pride_events_model.dart';

Future<GetWhistlerPrideEventsModel> getPrideEventsRepo() async {
  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
  };
  // try {
    http.Response response = await http.get(Uri.parse(ApiUrl.getWhistlerEvents),
      headers: headers,
    );

      log("Api Url....    "+ApiUrl.getWhistlerEvents.toString());
      log("Api response....    "+response.body.toString());
    if (response.statusCode == 200) {
      return GetWhistlerPrideEventsModel.fromJson(jsonDecode(response.body));
    } else {
      return GetWhistlerPrideEventsModel(message: jsonDecode(response.body)["message"], status: false, data: null);
    }
  // } catch (e) {
  //   return GetWhistlerPrideEventsModel(message: e.toString(), status: false, data: null);
  // }
}


