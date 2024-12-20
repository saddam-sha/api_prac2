import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api2 extends ChangeNotifier {
  var _getToken;
  get getToken => _getToken;

  void login() async {
    var response = await http.post(Uri.parse("https://reqres.in/api/login"),
        body: {"email": "eve.holt@reqres.in", "password": "cityslicka"});

    if (response.statusCode == 200) {
      _getToken = jsonDecode(response.body);
      print(_getToken);
    }
  }
}
