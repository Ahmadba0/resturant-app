// ignore_for_file: file_names, non_constant_identifier_names, duplicate_ignore, avoid_print, prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurant/core/class/crud.dart';
import 'package:restaurant/core/class/crud1.dart';
import 'package:restaurant/core/class/statusRequest.dart';
import 'package:restaurant/core/constant/color.dart';
import 'package:restaurant/core/data/data_source/remote/signup_data.dart';
import 'package:restaurant/core/services/servises.dart';
import 'package:restaurant/linkapi.dart';
import 'package:restaurant/view/screen/verify_code_siginup.dart';

class SignUpController extends GetxController {
  TextEditingController? users_phone;
  TextEditingController? users_name;
  TextEditingController? users_password;
  GlobalKey<FormState> formState = GlobalKey();

  bool isshowpassword = true;
  List data = [];
  SignupData signupData = SignupData(Get.find());
  StatusRequest? statusRequest = StatusRequest.none;
  Crud crud = Crud();
  bool isloading = false;
  Curd curd = Curd();
  MyServices myServices = Get.find();

  //---methods

  signup() async {
    print("---signup controller controller signup methos");
    print("---start save info method");
    if (formState.currentState!.validate()) {
      isloading = true;
      update();
      var response = await curd.postRequesrt(AppLink.signup, {
        "users_name": users_name!.text,
        "users_phone": users_phone!.text,
        "users_password": users_password!.text,
      });
      isloading = false;
      update();
      myServices.sharedPref.setString("usersname", users_name!.text);
      print(
          "---page signup- usersname is ${myServices.sharedPref.getString("usersname")}");
      myServices.sharedPref.setString("usersphone", users_phone!.text);
      print(
          "---page signup- usersphone is ${myServices.sharedPref.getString("usersphone")}");
      print("${myServices.sharedPref.getString('usersphone')}");
      print("*-------${response['status']}");
      if (response['status'] == 'success') {
        myServices.sharedPref.setString("step", "2");
        Get.offAll(() => const VerifyCodeSignup());
      } else {
        Get.defaultDialog(
            radius: 20,
            title: "ERROR",
            titleStyle:
                TextStyle(color: AppColor.red, fontWeight: FontWeight.bold),
            middleText: "Phone number is exists already",
            middleTextStyle: TextStyle(color: AppColor.myprimarycolor),
            onCancel: () {},
            textCancel: "OK",
            buttonColor: AppColor.myprimarycolor,
            cancelTextColor: AppColor.myprimarycolor);
      }
    }
    print("---end save signup method");
  }

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  //--on Init

  @override
  void onInit() {
    print("---signup controller controller on init methos");
    users_phone = TextEditingController();
    users_name = TextEditingController();
    users_password = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    users_phone!.dispose();
    users_name!.dispose();
    users_password!.dispose();
    super.dispose();
  }
}
