import 'dart:convert';

import 'package:advance_api/view/dashbord.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

var token;

class ApiPost extends StatefulWidget {
  const ApiPost({super.key});

  @override
  State<ApiPost> createState() => _ApiPostState();
}

class _ApiPostState extends State<ApiPost> {
  final TextEditingController _Emailcontroller = TextEditingController();
  final TextEditingController _Passwordcontroller = TextEditingController();
  void login() async {
    var value = await http.post(
        Uri.parse(
            "https://o360qa.speridian.com/API/ExternalApp_QA/ADLoginApi/AuthenticateUser"),
        body: {
          "Username": _Emailcontroller.text,
          "Password": _Passwordcontroller.text,
          "AppKey": "5238CB5A-929B-4160-86B3-4D7E5985A678"
        });
    if (value.statusCode == 200) {
      var getToken = jsonDecode(value.body);
      //token = getToken;

      print(getToken);
      await writedata();
    }
  }

  writedata() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("email", _Emailcontroller.text);
    pref.setString("password", _Passwordcontroller.text);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Dashbord()),
    );

    setState(() {});
  }

  getdata() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final String? storedEmail = pref.getString('email');
    final String? storedPassword = pref.getString('password');

    if (storedEmail != null && storedPassword != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Dashbord()),
      );
    }
    setState(() {});
  }

  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
    //login();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _Emailcontroller,
                validator: (value) {
                  String emailPattern =
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                  RegExp regExp = RegExp(emailPattern);
                  if (value!.isEmpty) {
                    return "plesse entere email";
                  } else if (!regExp.hasMatch(value)) {
                    return "Enter wrong email";
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                    label: Text("Email"),
                    hintText: "Email",
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _Passwordcontroller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "pless enter password";
                  } else if (value != _Passwordcontroller.text) {
                    return "Enter wrong password";
                  }
                  return null;
                  //return null;
                },
                decoration: const InputDecoration(
                    labelText: "Password",
                    hintText: "Password",
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                      onPressed: () {
                        writedata();
                        if (key.currentState!.validate()) {
                          login();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Dashbord()),
                          );
                          // getdata();
                        }
                      },
                      child: const Text("Login")))
            ],
          ),
        ),
      ),
    );
  }
}
