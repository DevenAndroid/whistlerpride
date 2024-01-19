import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../apiUrl.dart';
import '../model/post_contactUSModel.dart';

Future<PostConatctUsModel> postConatctUSRepo(
    name,email, message,formtype,  context) async {
  var map = <String, dynamic>{};
  map['name'] = name;
  map['email'] = email;
  map['message'] = message;
  map['formtype'] = formtype;

  var header = {
    HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.acceptHeader: "application/json",
  };
  final response = await http.post(Uri.parse(ApiUrl.postcontactUSUrl),
      body: jsonEncode(map), headers: header);

  if (response.statusCode == 200 || response.statusCode == 400) {
    print(response.body);

    return PostConatctUsModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}
