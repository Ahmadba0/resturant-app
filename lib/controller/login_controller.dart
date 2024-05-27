// ignore_for_file: unused_local_variable, avoid_print, prefer_const_constructors, prefer_typing_uninitialized_variables, file_names
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/core/class/crud.dart';
import 'package:restaurant/core/constant/color.dart';
import 'package:restaurant/core/services/servises.dart';
import 'package:restaurant/linkapi.dart';
import 'package:restaurant/view/screen/HomeScreen.dart';

class LoginController extends GetxController {
  TextEditingController? phonenumber;
  TextEditingController? password;
  Curd curd = Curd();
  GlobalKey<FormState> formState = GlobalKey();
  bool isloading = false;
  MyServices myServices = Get.find();
  bool isshowpassword = true;

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  login() async {
    print("---login controller login methos");
    if (formState.currentState!.validate()) {
      isloading = true;
      update();
      var response = await curd.postRequesrt(AppLink.login, {
        "users_phone": phonenumber!.text,
        "users_password": password!.text,
      });
      isloading = false;
      update();
      print(response);
      if (response['status'] == 'success') {
        print("-------------------------------");
        print(response['data']);
        print(response['status']);
        // Get.offAll(HomeScreen());
        if (response['data']['users_check'] == 1) {
          print("-------------------------------1");
          myServices.sharedPref
              .setString("id", response['data']['users_id'].toString());

          myServices.sharedPref
              .setString("name", response['data']['users_name'].toString());
          myServices.sharedPref
              .setString("phone", response['data']['users_phone'].toString());

          String userid = myServices.sharedPref.getString("phone").toString();
          myServices.sharedPref
              .setString("type", response['data']['users_type'].toString());
          print(
              " id: ${myServices.sharedPref.getString("id")} \n name: ${myServices.sharedPref.getString("name")} \n phone: ${myServices.sharedPref.getString("phone")} \n type: ${myServices.sharedPref.getString("type")}");
          //
          //
          //
          FirebaseMessaging.instance.subscribeToTopic("users");
          FirebaseMessaging.instance.subscribeToTopic("users${userid}");
          //
          //
          //
          print("-------------------------------1");
          Get.to(HomeScreen());
          myServices.sharedPref.setString("step", "3");
        }
      } else {
        Get.defaultDialog(
            radius: 20,
            title: "ERROR",
            titleStyle:
                TextStyle(color: AppColor.red, fontWeight: FontWeight.bold),
            middleText: "Phone number or password not correct",
            middleTextStyle: TextStyle(color: AppColor.myprimarycolor),
            onCancel: () {},
            textCancel: "OK",
            buttonColor: AppColor.myprimarycolor,
            cancelTextColor: AppColor.myprimarycolor);
      }
    }
    update();
  }

  @override
  void onInit() {
    print("---login controller on init methos");
    /*  FirebaseMessaging.instance.getToken().then((value) {
      print("--value token : $value");
      String? token = value;
    });*/

    phonenumber = TextEditingController();
    password = TextEditingController();
    super.onInit();
    //checkXamppStatus();
  }
}
