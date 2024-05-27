// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurant/core/constant/routename.dart';
import 'package:restaurant/core/services/servises.dart';

class MyMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPref.getString("step") == "3") {
      return const RouteSettings(name: AppRoutes.home);
    }
    if (myServices.sharedPref.getString("step") == "2") {
      return const RouteSettings(name: AppRoutes.verifyCodeSignup);
    }
    if (myServices.sharedPref.getString("step") == "1") {
      return const RouteSettings(name: AppRoutes.login);
    }

    // return null;
  }
}
