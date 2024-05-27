// ignore_for_file: prefer_const_constructors, avoid_print, prefer_typing_uninitialized_variables

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/core/class/crud.dart';
import 'package:restaurant/core/services/servises.dart';
import 'package:restaurant/linkapi.dart';
import 'package:restaurant/view/screen/logintest.dart';

import '../core/constant/color.dart';

class VerifySignupController extends GetxController {
  bool isloadingVerifySignup = false;
  Curd curd = Curd();
  String? phone;
  List verifycodesdata = [];
  var verifycode;
  MyServices myServices = Get.find();

  gotosuccessPage(String verifycode) async {
    print("---verify signup controller controller go to success page methos");
    print("***************");
    if (int.parse(verifycode) == randomNumber) {
      isloadingVerifySignup = true;
      update();
      print("1");
      verifycode = randomNumber.toString();
      var response = await curd.postRequesrt(AppLink.verifycodeSignup, {
        "users_phone": myServices.sharedPref.getString("usersphone").toString(),
        "users_verifycode": randomNumber.toString()
      });
      print(response['status']);
      isloadingVerifySignup = false;
      update();
      if (response['status'] == 'success') {
        print("2");
        myServices.sharedPref.setString("step", "3");
        Get.offAll(const Login());
        i = -1;
      } else {
        print("5");
      }
    } else {
      Get.defaultDialog(
          radius: 20,
          title: "ERROR",
          titleStyle:
              TextStyle(color: AppColor.red, fontWeight: FontWeight.bold),
          middleText: "Verify code not correct",
          middleTextStyle: TextStyle(color: AppColor.myprimarycolor),
          onCancel: () {},
          textCancel: "OK",
          buttonColor: AppColor.myprimarycolor,
          cancelTextColor: AppColor.myprimarycolor);
    }
  }

  resend() async {
    print("---verify signup controller controller resend methos");
    randomNumber = 0;
    i = 0;
    i = 60;
    generateRandom();
  }

  var randomNumber = 0;
  generateRandom() {
    print("---verify signup controller controller generate random methos");
    Random random = Random();
    randomNumber = random.nextInt(90000) + 10000;
    print("---------------------------");
    print("1randomNumber $randomNumber");
    print("---------------------------");
    Timer(Duration(seconds: 2), () {
      Get.snackbar(
        "كود التحقق",
        "$randomNumber",
        duration: Duration(seconds: 8),
        colorText: AppColor.myprimarycolor,
      );
      update();
    });
    Timer(Duration(minutes: 1), () {
      randomNumber = 0;
      print("---------------------------");
      print("2randomNumber $randomNumber");
      print("---------------------------");
      update();
    });
  }

  Timer? tt;
  var i;
  minn() {
    i = 60;

    tt = Timer.periodic(Duration(seconds: 1), (timer) {
      if (i != -1) {
        i != 0 ? i-- : 0;
        // print("i $i");
        update();
      }
    });
  }

  deleteandupdate() async {
    print("---verify signup controller controller delete and update methos");
    var response = await curd.postRequesrt(AppLink.delete, {
      "usersphone": myServices.sharedPref.getString("usersphone").toString()
    });
    print(response['status']);
    if (response['status'] == 'sucsses') {
      myServices.sharedPref.clear();
      Get.offAll(() => const Login());
    } else {
      print("error");
    }
  }

  @override
  void onInit() {
    print("---verify signup controller controller on init methos");
    generateRandom();
    minn();
    super.onInit();
  }
}
