import 'package:advance_api/controller/api2.dart';
import 'package:advance_api/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApiPost2 extends StatelessWidget {
  ApiPost2({super.key});
  GlobalKey<FormState> keyform = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login 2"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
                key: keyform,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _email,
                      validator: (value) {
                        String emailPattern =
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                        RegExp regExp = RegExp(emailPattern);

                        if (value == null || value.isEmpty) {
                          return "pless enter Email";
                        } else if (!regExp.hasMatch(value)) {
                          return "Enter wrong email";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          labelText: "Email",
                          hintText: "Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _password,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "pless enter Password";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          labelText: "Password",
                          hintText: "Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25))),
                    ),
                  ],
                )),
            ElevatedButton(
                onPressed: () {
                  if (keyform.currentState!.validate()) {
                    context.read<Api2>().login();
                  }
                },
                child: const Text("Login"))
          ],
        ),
      ),
    );
  }
}
