// ignore_for_file: prefer_const_constructors, avoid_print, non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/core/class/crud.dart';
import 'package:restaurant/core/constant/color.dart';
import 'package:restaurant/core/services/servises.dart';
import 'package:restaurant/linkapi.dart';
import 'package:restaurant/view/screen/logintest.dart';

class ResetPasswordController extends GetxController {
  bool isLoading = false;
  Curd curd = Curd();
  String? phone;
  TextEditingController? password;
  TextEditingController? re_password;
  GlobalKey<FormState> formState = GlobalKey();
  MyServices myServices = Get.find();
  bool isshowpassword = true;
  bool isshowpassword1 = true;

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  showPassword1() {
    isshowpassword1 = isshowpassword1 == true ? false : true;
    update();
  }

  resetPassword() async {
    print("---reset password controller reset password methos");
    /* if (password!.text != re_password!.text) {
      Get.defaultDialog(title: "Warning", middleText: "reEnter the password");
    }*/
    if (formState.currentState!.validate()) {
      isLoading = true;
      update();
      if (password!.text == re_password!.text) {
        isLoading = true;
        update;
        var response = await curd.postRequesrt(AppLink.resetPassword, {
          "users_phone": phone,
          "users_password": password!.text,
        });

        print(response["status"]);
        isLoading = false;
        update();
        if (response["status"] == "success") {
          Get.offAll(() => const Login());
        } else {
          Get.defaultDialog(
              radius: 20,
              title: "ERROR",
              titleStyle:
                  TextStyle(color: AppColor.red, fontWeight: FontWeight.bold),
              middleText: "This is already password",
              middleTextStyle: TextStyle(color: AppColor.myprimarycolor),
              onCancel: () {},
              textCancel: "OK",
              buttonColor: AppColor.myprimarycolor,
              cancelTextColor: AppColor.myprimarycolor);
        }
      } else {
        print("not ==");
        Get.defaultDialog(
            radius: 20,
            title: "ERROR",
            titleStyle:
                TextStyle(color: AppColor.red, fontWeight: FontWeight.bold),
            middleText: "check the two password",
            middleTextStyle: TextStyle(color: AppColor.myprimarycolor),
            onCancel: () {},
            textCancel: "OK",
            buttonColor: AppColor.myprimarycolor,
            cancelTextColor: AppColor.myprimarycolor);
      }
    } else {
      print("not full");
    }
    update();
  }

  @override
  void onInit() {
    print("---reset password controller on init methos");
    phone = Get.arguments['phone'];
    password = TextEditingController();
    re_password = TextEditingController();
    super.onInit();
  }
}
