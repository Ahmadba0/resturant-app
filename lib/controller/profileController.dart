// ignore_for_file: avoid_print, file_names

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurant/core/class/crud.dart';
import 'package:restaurant/core/services/servises.dart';
import 'package:restaurant/linkapi.dart';

class ProfileController extends GetxController {
  MyServices myServices = Get.find();
  GlobalKey<FormState> formstate = GlobalKey();
  Curd curd = Curd();
  var usersimg;
  bool isloading = false;
  bool isloading1 = false;
  TextEditingController? usersnameCon;
  bool isloading2 = false;
  TextEditingController? usersphoneCon;
  File? myfile;
  bool ll = false;

  updatenameres() async {
    print("---profile controller update name res methos");
    isloading1 = true;
    update();
    var response = await curd.postRequesrt(AppLink.updatenameprofile, {
      "users_id": myServices.sharedPref.getString("id").toString(),
      "users_name": usersnameCon!.text,
    });
    isloading1 = false;
    update();
    if (response['status'] == 'success') {
      var id = myServices.sharedPref.getString("id");
      var phone = myServices.sharedPref.getString("phone");
      var type = myServices.sharedPref.getString("type");
      myServices.sharedPref.clear();
      myServices.sharedPref.setString("id", id.toString());
      myServices.sharedPref.setString("name", usersnameCon!.text);
      myServices.sharedPref.setString("phone", phone.toString());
      print(myServices.sharedPref.getString("phone"));
      myServices.sharedPref.setString("type", type.toString());
      Get.back();
    } else {
      print("error");
    }
    update();
  }

  updatephoneres() async {
    print("---profile controller update phone res methos");
    isloading2 = true;
    update();
    var response = await curd.postRequesrt(AppLink.updatephoneprofile, {
      "res_id": myServices.sharedPref.getString("resid").toString(),
      "res_phone": usersphoneCon!.text,
      "users_id": myServices.sharedPref.getString("id").toString()
    });
    isloading2 = false;
    update();
    if (response['status'] == 'success') {
      var id = myServices.sharedPref.getString("id");
      var name = myServices.sharedPref.getString("name");
      var type = myServices.sharedPref.getString("type");
      myServices.sharedPref.clear();
      myServices.sharedPref.setString("id", id.toString());
      myServices.sharedPref.setString("name", name.toString());
      myServices.sharedPref.setString("phone", usersphoneCon!.text);
      myServices.sharedPref.setString("type", type.toString());
      print(myServices.sharedPref.getString("phone"));
      Get.back();
    } else {
      print("error");
    }
    update();
  }

  getusersdata() async {
    print("---profile controller get user data methos");
    isloading = true;
    update();
    var response = await curd.postRequesrt(AppLink.getusersdata, {
      "users_id": myServices.sharedPref.getString("id"),
    });
    isloading = false;
    update();
    if (response['status'] == 'success') {
      print(response['data']);
      usersimg = response['data']['users_image'];
      print("usersimg $usersimg**************************");
    } else {}
    update();
  }

  addImageGallery() async {
    print("---profile controller add image gallery methos");
    ll = true;
    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    //Get.back();
    print(xfile);
    if (xfile != null) {
      usersimg = null;
      myfile = null;
      myfile = File(xfile.path);
    } else {}
    if (myfile == null) {
      Get.back();
    } else {
      var response = await postRequsetWithFile(
          AppLink.addimgprofile,
          {
            "users_id": myServices.sharedPref.getString("id"),
          },
          myfile!);
      //Get.to(ProfilePage());
      if (response["status"] == "success") {
        getusersdata();

        print("--add img");

        Timer(const Duration(seconds: 5), () {
          ll = false;
          print("ll $ll");
          update();
        });
      } else {
        print("sss");
      }
    }
    update();
  }

  @override
  void onInit() {
    print("---profile controller on init methos");
    usersnameCon = TextEditingController();
    usersphoneCon = TextEditingController();
    print("heloooooooooooo");
    super.onInit();
  }
}
