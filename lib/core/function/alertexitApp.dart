// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/core/constant/color.dart';
import 'package:restaurant/view/screen/HomeScreen.dart';

Future<bool> ExitApp() {
  Get.defaultDialog(title: "Exit", middleText: "Do you want exit", actions: [
    ElevatedButton(
      onPressed: () {
        exit(0);
      },
      child: Text("yes"),
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
          backgroundColor: AppColor.myprimarycolor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(35))),
    ),
    ElevatedButton(
      onPressed: () {
        Get.back();
      },
      child: Text("no"),
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
          backgroundColor: AppColor.myprimarycolor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(35))),
    )
  ]);
  return Future.value(true);
}

Future<bool> GetBack() {
  Get.offAll(HomeScreen());
  return Future.value(true);
}
