import 'dart:convert';

import 'package:advance_api/controller/getapi1.dart';
import 'package:advance_api/main.dart';
import 'package:advance_api/view/api_get1.dart';
import 'package:advance_api/view/api_get2.dart';
import 'package:advance_api/view/api_post.dart';
import 'package:advance_api/view/api_post1.dart';
import 'package:advance_api/view/api_post2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Dashbord extends StatefulWidget {
  const Dashbord({super.key});

  @override
  State<Dashbord> createState() => _DashbordState();
}

class _DashbordState extends State<Dashbord> {
  void getLeavedata() async {
    var response = await http.post(
        Uri.parse(
            "https://o360qa.speridian.com/API/ExternalApp_QA/MobileAppAPI/GetLeaveRequestsList"),
        headers: {
          "Authorization": "Bearer $token"
        },
        body: {
          "CustomerKey": "ED073250-FEBF-41DB-81F1-46DFAFFBD390",
          "LeaveTypeId": ""
        });

    if (response.statusCode == 200) {
      var getvalue = jsonDecode(response.body);
      print(getvalue);
    } else {
      print("Something Went Worng");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLeavedata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Dashbord"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ApiPost1()));
              },
              child: const Text("Api1")),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ApiPost2()));
              },
              child: const Text("Api2")),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                //context.read<Getapi1>().getdata();

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ApiGet1()));
              },
              child: const Text("Api1")),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                //context.read<Getapi1>().getdata();

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ApiGet2()));
              },
              child: const Text("Api1")),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
