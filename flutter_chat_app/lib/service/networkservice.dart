import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:developer';

class ApiRepository {
  ApiRepository._();
  static final ApiRepository instance = ApiRepository._();
  Future<dynamic> postRequest(
      {@required String? url,
      @required BuildContext? context,
      @required Map<String, String>? header,
      @required Map<String, dynamic>? quarryperam}) async {
    var response = await http.post(Uri.parse(url!),
        headers: header, body: jsonEncode(quarryperam));
    log(Uri.parse(url).toString());
    log(header.toString());
    log("reponse: ${response.body}");
    log("log response status:- ${response.statusCode}");
    if (response.statusCode == 200) {
      // print(response.body);
      return response.body;
    } else {}
    return response.body;
  }

Future<dynamic> getRequest({
  String? url,
  @required BuildContext? context,
  Map<String, String>? header,
  Map<String, dynamic>? quarryperam,
}) async {
  var response = await http.get(Uri.parse(url!), headers: header,);
  log(Uri.parse(url).toString());
  log(header.toString());
  if (response.statusCode == 200) {
    // print(response.body);
    return response.body;
  } else {}
}
}