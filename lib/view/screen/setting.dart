import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/core/services/servises.dart';
import 'package:restaurant/view/screen/logintest.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  MyServices myServices = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("${myServices.sharedPref.getString("id")}"),
            Text("${myServices.sharedPref.getString("name")}"),
            Text("${myServices.sharedPref.getString("phone")}"),
            Text("${myServices.sharedPref.getString("type")}"),
            ElevatedButton(
                onPressed: () {
                  myServices.sharedPref.clear();
                  Get.offAll(Login());
                },
                child: Text("data")),
          ],
        ),
      ),
    );
  }
}
