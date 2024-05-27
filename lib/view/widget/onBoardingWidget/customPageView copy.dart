// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/controller/onBoarding_controller.dart';
import 'package:restaurant/core/constant/color.dart';
import 'package:restaurant/core/data/data_source/static/static.dart';

class CustomPageViewText extends GetView<onBoardingControllerImp> {
  const CustomPageViewText({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPageChanged(value);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, index) {
        return Text(
          onBoardingList[index].title!,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: AppColor.myprimarycolor),
        );
        //const SizedBox(height: 10),
        /*  Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text(
                onBoardingList[index].body!,
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
            ),*/
      },
    );
  }
}
