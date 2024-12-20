import 'package:advance_api/controller/api1.dart';
import 'package:advance_api/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApiPost1 extends StatelessWidget {
  ApiPost1({super.key});
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  GlobalKey<FormState> keyf = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Login 2"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
                key: keyf,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailcontroller,
                      validator: (value) {
                        String emailPattern =
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                        RegExp regExp = RegExp(emailPattern);
                        if (value == null || value.isEmpty) {
                          return "pless enter email";
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "pless enter password";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          labelText: "password",
                          hintText: "Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25))),
                    ),
                  ],
                )),
            ElevatedButton(
                onPressed: () {
                  if (keyf.currentState!.validate()) {
                    context.read<Api1>().Login();
                  }
                },
                child: const Text("Login"))
          ],
        ),
      ),
    );
  }
}
