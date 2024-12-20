import 'dart:convert';

import 'package:advance_api/model/random.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Getapi1 extends ChangeNotifier {
  Random? _getResponse;
  Random? get getResponse => _getResponse;
  void getdata() async {
    try {
      var resoponse = await http.get(Uri.parse("https://yesno.wtf/api"));
      if (resoponse.statusCode == 200) {
        _getResponse = Random.fromJson(jsonDecode(resoponse.body));
        notifyListeners();
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
