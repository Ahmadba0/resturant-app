import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/controller/onBoarding_controller.dart';
import 'package:restaurant/core/constant/color.dart';
import 'package:restaurant/core/data/data_source/static/static.dart';

class DotController extends StatelessWidget {
  const DotController({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<onBoardingControllerImp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
              onBoardingList.length,
              (index) => AnimatedContainer(
                    margin: const EdgeInsets.all(2),
                    duration: const Duration(milliseconds: 800),
                    width: controller.currentPage == index ? 15 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                        color: AppColor.myprimarycolor,
                        borderRadius: BorderRadius.circular(10)),
                  ))
        ],
      ),
    );
  }
}
