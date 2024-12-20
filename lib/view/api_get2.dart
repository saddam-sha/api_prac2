import 'package:advance_api/controller/getapi2.dart';
import 'package:advance_api/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApiGet2 extends StatelessWidget {
  const ApiGet2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Jokes"),
        ),
        body: context.watch<Getapi2>().getResponse == null
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Card(
                    child: Column(
                      children: [
                        Text(context.watch<Getapi2>().getResponse!.type ?? ""),
                        Text(context.watch<Getapi2>().getResponse!.setup ?? ""),
                        Text(context.watch<Getapi2>().getResponse!.punchline ??
                            ""),
                      ],
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context.read<Getapi2>().getdata();
                      },
                      child: Text("Refresh"))
                ],
              ));
  }
}
