import 'dart:convert';

import 'package:advance_api/model/jokes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Getapi2 extends ChangeNotifier {
  Jokes? _getResponse;
  Jokes? get getResponse => _getResponse;

  void getdata() async {
    var response = await http
        .get(Uri.parse("https://official-joke-api.appspot.com/random_joke"));
    if (response.statusCode == 200) {
      _getResponse = Jokes.fromJson(jsonDecode(response.body));
      notifyListeners();
    }
  }
}
