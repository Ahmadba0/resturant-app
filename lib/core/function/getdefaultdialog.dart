import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/core/constant/color.dart';

getdialog(String text1, String text2, String textok, String textcancel,
    void Function() onconfirm, void Function() oncancel) {
  return Get.defaultDialog(
      radius: 20,
      title: text1,
      titleStyle: TextStyle(color: AppColor.red, fontWeight: FontWeight.bold),
      middleText: text2,
      middleTextStyle: TextStyle(color: AppColor.myprimarycolor),
      onCancel: oncancel,
      textCancel: textcancel,
      textConfirm: textok,
      onConfirm: onconfirm,
      confirmTextColor: Colors.white,
      buttonColor: AppColor.myprimarycolor,
      cancelTextColor: AppColor.myprimarycolor);
}
