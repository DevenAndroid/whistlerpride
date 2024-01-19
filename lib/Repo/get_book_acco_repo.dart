import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../apiUrl.dart';
import '../model/get_book_acco_model.dart';

Future<GetBookAccoModel> getBookAccoRepo() async {
  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
  };
  http.Response response = await http.get(Uri.parse(ApiUrl.getBookAccoUrl),
    headers: headers,
  );

  log("Api Url....    "+ApiUrl.getWhistlerEvents.toString());
  log("Api response....    "+response.body.toString());
  if (response.statusCode == 200) {
    return GetBookAccoModel.fromJson(jsonDecode(response.body));
  } else {
    return GetBookAccoModel(message: jsonDecode(response.body)["message"], status: false, data: null);
  }

}
