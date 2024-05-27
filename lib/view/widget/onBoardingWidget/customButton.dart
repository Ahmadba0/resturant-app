import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/controller/onBoarding_controller.dart';
import 'package:restaurant/core/constant/color.dart';

class CustomButton extends GetView<onBoardingControllerImp> {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          controller.next();
        },
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
            backgroundColor: AppColor.myprimarycolor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35))),
        child: Text("9".tr),
      ),
    );
  }
}
