// ignore_for_file: avoid_unnecessary_containers, unused_local_variable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/controller/onBoarding_controller.dart';
import 'package:restaurant/view/widget/onBoardingWidget/Custom_btn.dart';
import 'package:restaurant/view/widget/onBoardingWidget/customPageView.dart';
import 'package:restaurant/view/widget/onBoardingWidget/custom_text1.dart';
import 'package:restaurant/view/widget/onBoardingWidget/custom_text2.dart';
import 'package:restaurant/view/widget/onBoardingWidget/dotcontroller.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    onBoardingControllerImp controller = Get.put(onBoardingControllerImp());
    return Scaffold(
      body: Container(
        //   padding: const EdgeInsets.only(top: 140, left: 30, right: 30),
        child: Column(
          children: [
            const Expanded(flex: 3, child: CustomPageView()),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  const DotController(),
                  const SizedBox(height: 25),
                  GetBuilder<onBoardingControllerImp>(
                    builder: (controller) {
                      return Column(
                        children: [
                          controller.currentPage == 0
                              ? const CustomText1(
                                  text: "Find Restaurant",
                                )
                              : controller.currentPage == 1
                                  ? const CustomText1(
                                      text: 'Order Your Food',
                                    )
                                  : const CustomText1(
                                      text: "Enjoy with Your Friend",
                                    ),
                          const SizedBox(height: 15),
                          const CustomText2(),
                          const SizedBox(height: 35),
                          CustomBTN(
                            currentpage: controller.currentPage,
                            onTap: () => controller.next(),
                          ),
                        ],
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
