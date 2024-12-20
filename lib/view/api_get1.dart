import 'package:advance_api/controller/getapi1.dart';
import 'package:advance_api/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApiGet1 extends StatelessWidget {
  const ApiGet1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rondom"),
      ),
      body: context.watch<Getapi1>().getResponse == null
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Text(context.watch<Getapi1>().getResponse!.answer ?? ""),
                Text(context.watch<Getapi1>().getResponse!.forced.toString() ??
                    ""),
                Image.network(
                    context.watch<Getapi1>().getResponse!.image ?? ""),
                ElevatedButton(
                    onPressed: () {
                      context.read<Getapi1>().getdata();
                    },
                    child: Text("Refresh"))
              ],
            ),
    );
  }
}
