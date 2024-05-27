// ignore_for_file: file_names, camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurant/core/constant/routename.dart';
import 'package:restaurant/core/data/data_source/static/static.dart';
import 'package:restaurant/core/services/servises.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class onBoardingControllerImp extends OnBoardingController {
  int currentPage = 0;
  PageController? pageController;
  MyServices myservices = Get.find();
  @override
  next() {
    update();
    print(currentPage);
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      myservices.sharedPref.setString("step", "1");
      Get.offAllNamed(AppRoutes.login);
    } else {
      pageController!.animateToPage(currentPage,
          duration: const Duration(milliseconds: 800), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }
}
