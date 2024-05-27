import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant/core/constant/color.dart';
import 'package:restaurant/linkapi.dart';

bool isXamppRunning = false;
void checkXamppStatus() async {
  try {
    final response =
        await http.get(Uri.parse('${AppLink.signup}/xampp/splash.php'));

    if (response.statusCode == 200) {
      isXamppRunning = true;

      print('XAMPP is running');
    } else {
      isXamppRunning = false;
      Get.defaultDialog(
          radius: 20,
          title: "ERROR",
          titleStyle:
              TextStyle(color: AppColor.red, fontWeight: FontWeight.bold),
          middleText: "pleas check the url",
          middleTextStyle: TextStyle(color: AppColor.myprimarycolor),
          onCancel: () {},
          textCancel: "OK",
          buttonColor: AppColor.myprimarycolor,
          cancelTextColor: AppColor.myprimarycolor);
      print('XAMPP is not running');
    }
  } catch (e) {
    isXamppRunning = false;
    Get.defaultDialog(
        radius: 20,
        title: "ERROR",
        titleStyle: TextStyle(color: AppColor.red, fontWeight: FontWeight.bold),
        middleText: "pleas turn on the xampp",
        middleTextStyle: TextStyle(color: AppColor.myprimarycolor),
        onCancel: () {},
        textCancel: "OK",
        buttonColor: AppColor.myprimarycolor,
        cancelTextColor: AppColor.myprimarycolor);
    print('Error checking XAMPP status: $e');
  }
}
