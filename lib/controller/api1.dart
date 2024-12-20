import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api1 extends ChangeNotifier {
  var _getToken;
  get getToken => _getToken;

  void Login() async {
    var response = await http.post(Uri.parse("https://reqres.in/api/register"),
        body: {"email": "eve.holt@reqres.in", "password": "pistol"});
    if (response.statusCode == 200) {
      _getToken = jsonDecode(response.body);
      print(_getToken);
      notifyListeners();
    }
  }
}
