import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurant/core/class/crud.dart';
import 'package:restaurant/core/constant/color.dart';
import 'package:restaurant/core/services/servises.dart';
import 'package:restaurant/linkapi.dart';
import 'package:restaurant/view/screen/HomeScreen.dart';
import 'package:restaurant/view/screen/add_restaurant.dart';

class AddResController extends GetxController {
  Curd curd = Curd();
  MyServices myServices = Get.find();
  GlobalKey<FormState> formState = GlobalKey();
  bool isloading = false;
  TextEditingController? namecontroller;
  TextEditingController? nameManagercontroller;
  TextEditingController? phonecontroller;
  TextEditingController? passwordcontroller;
  File? myfile;
  var type;
  var location;
  int valuerating = 0;
  var valuee;
  List itemtype = ["eastern", "western", "both"];
  var valuee1;
  List itemlocation = ["Damas", "Ref Damas", "Homs", "Aleppo", "Latakia"];
  bool isshowpassword = true;

  showPassword() {
    print("---add res controller show password meyhos");
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  onchangedtype(var value) {
    type = null;
    type = value;
    update();
    print("type: $type");
  }

  onchangedlocatoin(var value) {
    location = null;
    location = value;
    update();
    print("location: $location");
  }

  add() async {
    print("---add res controller add  meyhos");
    if (myfile != null) {
      if (formState.currentState!.validate()) {
        isloading = true;
        update();
        var response = await postRequsetWithFile(
            AppLink.addres,
            {
              "res_name": namecontroller!.text,
              "res_location": location,
              "res_phone": phonecontroller!.text,
              "res_type": type,
              "res_rating": valuerating.toString(),
              "res_password": passwordcontroller!.text,
            },
            myfile!);
        var response1 = await curd.postRequesrt(AppLink.signupres, {
          "users_name": nameManagercontroller!.text,
          "users_phone": phonecontroller!.text,
          "users_password": passwordcontroller!.text,
          "users_check": 1.toString(),
          "users_type": 1.toString(),
        });
        isloading = false;
        update();
        if (response['status'] == 'success' &&
            response1['status'] == 'success') {
          Get.offAll(HomeScreen());
        } else {
          Get.defaultDialog(
              radius: 20,
              title: "ERROR",
              titleStyle: const TextStyle(
                  color: AppColor.red, fontWeight: FontWeight.bold),
              middleText: "number phone is already exists ",
              middleTextStyle: const TextStyle(color: AppColor.myprimarycolor),
              onCancel: () {},
              textCancel: "OK",
              buttonColor: AppColor.myprimarycolor,
              cancelTextColor: AppColor.myprimarycolor);
        }
      }
    } else {
      Get.defaultDialog(
          radius: 20,
          title: "ERROR",
          titleStyle:
              const TextStyle(color: AppColor.red, fontWeight: FontWeight.bold),
          middleText: "add image ",
          middleTextStyle: const TextStyle(color: AppColor.myprimarycolor),
          onCancel: () {},
          textCancel: "OK",
          buttonColor: AppColor.myprimarycolor,
          cancelTextColor: AppColor.myprimarycolor);
    }
    update();
  }

  addImageGallery() async {
    print("---add res controller add Image Gallery meyhos");
    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    Get.to(() => const AddRestaurant());
    print(xfile);
    if (xfile != null) {
      myfile = File(xfile.path);
    } else {}
    update();
    print(myfile);
  }

  @override
  void onInit() {
    print("---add res controller on init meyhos");
    namecontroller = TextEditingController();
    nameManagercontroller = TextEditingController();
    phonecontroller = TextEditingController();
    passwordcontroller = TextEditingController();
    super.onInit();
  }
}
