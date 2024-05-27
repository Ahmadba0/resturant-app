// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/core/class/crud.dart';
import 'package:restaurant/core/constant/color.dart';
import 'package:restaurant/core/function/getdefaultdialog.dart';
import 'package:restaurant/core/services/servises.dart';
import 'package:restaurant/linkapi.dart';
import 'package:restaurant/view/screen/HomeScreen.dart';

class ResDetailsController extends GetxController {
  String? selectedDate;
  String? selectedTimestart;
  String? selectedTimeend;
  MyServices myServices = Get.find();
  Curd curd = Curd();
  var resid;
  bool isloading = false;
  List listresbyid = [];
  int countimages = 0;

  getresbyid() async {
    print("---res details controller get res by id methos");
    listresbyid.clear();
    update();
    isloading = true;
    update();
    var response = await curd
        .postRequesrt(AppLink.getresbyid, {"res_id": resid.toString()});
    isloading = false;
    update();
    print(response['status']);
    if (response['status'] == 'success') {
      print(response['data']);
      listresbyid.addAll(response['data']);
      if (listresbyid[0]['res_img3'] != '') {
        countimages = 3;
      } else if (listresbyid[0]['res_img2'] != '') {
        countimages = 2;
      } else if (listresbyid[0]['res_img1'] != '') {
        countimages = 1;
      } else {
        countimages = 0;
      }
      print("count image in details $countimages");
    } else {
      print("empty details page");
    }
    update();
  }

  int currentimg = 1;

  plus() {
    if (currentimg == 3) {
      currentimg = 3;
    } else {
      currentimg = currentimg + 1;
    }
    update();
    print("current inage indetails $currentimg");
  }

  minus() {
    if (currentimg == 1) {
      currentimg = 1;
    } else {
      currentimg = currentimg - 1;
    }
    update();
    print("current inage indetails $currentimg");
  }

  bool isloadingcheck = false;
  bool islol = false;
  var count = 0;
  List countofreversinthisdate = [];
  //
  //
  checknum(var resphone) async {
    print("---res details controller check num methos");

    ///
    // count = 0;
    if (selectedDate != null && selectedTimestart != null) {
      isloadingcheck = true;
      update();
      var response = await curd.postRequesrt(AppLink.checknum, {
        "revers_date": selectedDate.toString(),
        "res_id": resid.toString(),
      });
      isloadingcheck = false;
      update();
      //print(selectedTimestart!.split(':').first);
      if (response['status'] == 'success') {
        countofreversinthisdate.addAll(response['data']);
        count = countofreversinthisdate[0]['COUNT(revers_id)'];
        print("count $count");
        print("res_capacity ${listresbyid[0]['res_capacity']}");
        if (count >= listresbyid[0]['res_capacity']) {
          print("---------- add waiting table");
          var response1;
          Get.defaultDialog(
              radius: 20,
              title: "Warning",
              titleStyle:
                  TextStyle(color: AppColor.red, fontWeight: FontWeight.bold),
              middleText: "your revers will be inserted in waiting queue",
              middleTextStyle: TextStyle(color: AppColor.myprimarycolor),
              onCancel: () {
                // Get.back();
              },
              textCancel: "Cancel",
              onConfirm: () async {
                Get.back();
                islol = true;
                update();
                response1 = await curd.postRequesrt(AppLink.addinwaiting, {
                  "waiting_date": selectedDate.toString(),
                  "waiting_starttime": selectedTimestart.toString(),
                  //"revers_endtime": selectedTimeend.toString(),
                  "users_id": myServices.sharedPref.getString("id").toString(),
                  "res_id": resid.toString(),
                  "res_phone": resphone.toString(),
                });

                islol = false;
                update();
                if (response1['status'] == 'success') {
                  Get.offAll(HomeScreen());
                  print("added in waiting table");
                } else {
                  print("error in add waiting table");
                }
              },
              textConfirm: "OK",
              confirmTextColor: Colors.white,
              buttonColor: AppColor.myprimarycolor,
              cancelTextColor: AppColor.myprimarycolor);
        } else {
          Get.defaultDialog(
              radius: 20,
              title: "Warning",
              titleStyle:
                  TextStyle(color: AppColor.red, fontWeight: FontWeight.bold),
              middleText:
                  "your revers will be inserted in reverse \n and if you lating after half hour \n your reverse will be canceled",
              middleTextStyle: TextStyle(color: AppColor.myprimarycolor),
              onCancel: () {
                //Get.back();
              },
              textCancel: "Cancel",
              onConfirm: () async {
                Get.back();
                islol = true;
                update();
                var response1 = await curd.postRequesrt(AppLink.addrevers, {
                  "revers_date": selectedDate.toString(),
                  "revers_starttime": selectedTimestart.toString(),
                  //"revers_endtime": selectedTimeend.toString(),
                  "users_id": myServices.sharedPref.getString("id").toString(),
                  "res_id": resid.toString(),
                  "res_phone": resphone.toString(),
                });
                islol = false;

                update();
                if (response1['status'] == 'success') {
                  Get.offAll(HomeScreen());
                  print("added in revers table");
                } else {
                  print("error in add revers");
                }
              },
              textConfirm: "OK",
              confirmTextColor: Colors.white,
              buttonColor: AppColor.myprimarycolor,
              cancelTextColor: AppColor.myprimarycolor);

          print("---------- add revers table");
        }
      } else {
        print("error in check num");
      }
    } else {
      getdialog("Warning", "Pleas select the date", "Ok", "Cancel", () {
        Get.back();
      }, () {});
    }
    update();
  }

  @override
  void onInit() {
    print("---res details controller on init methos");
    resid = Get.arguments['resid'];
    getresbyid();
    print("res id in details page $resid");
    super.onInit();
  }
}
