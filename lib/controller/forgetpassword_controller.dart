// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/core/class/crud.dart';
import 'package:restaurant/core/constant/color.dart';
import 'package:restaurant/linkapi.dart';
import 'package:restaurant/view/screen/verify_forget.dart';

class ForgetPasswordController extends GetxController {
  TextEditingController? phoneCon;
  GlobalKey<FormState> formState = GlobalKey();
  Curd curd = Curd();
  bool isLoading = false;

  checkEmail() async {
    print("---forget password controller check email meyhos");
    if (formState.currentState!.validate()) {
      isLoading = true;
      update();
      var response = await curd.postRequesrt(
          //email!.text
          AppLink.checkPassword,
          {
            "users_phone": phoneCon!.text,
          });
      isLoading = false;

      if (response['status'] == "success") {
        //  data.addAll(response['data']);
        Get.off(const VerifyForget(), arguments: {"phone": phoneCon!.text});
      } else {
        Get.defaultDialog(
            radius: 20,
            title: "ERROR",
            titleStyle:
                TextStyle(color: AppColor.red, fontWeight: FontWeight.bold),
            middleText: "Phone number is not found",
            middleTextStyle: TextStyle(color: AppColor.myprimarycolor),
            onCancel: () {},
            textCancel: "OK",
            buttonColor: AppColor.myprimarycolor,
            cancelTextColor: AppColor.myprimarycolor);
      }
      update();
    } else {
      print("not valid forgetpassword");
    }
  }

  @override
  void onInit() {
    print("---forget password controller on init meyhos");
    phoneCon = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    phoneCon!.dispose();
    super.dispose();
  }
}
