// ignore_for_file: file_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/controller/onBoarding_controller.dart';
import 'package:restaurant/core/data/data_source/static/static.dart';

class CustomPageView extends GetView<onBoardingControllerImp> {
  const CustomPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPageChanged(value);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            const SizedBox(height: 80),
            Container(
              child: Image.asset(
                onBoardingList[index].image!,
                // fit: BoxFit.cover,
                width: Get.width - 30,
              ),
            ),

            /* Text(
              onBoardingList[index].title!,
              style: Theme.of(context).textTheme.headline1,
            ),*/
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
          ],
        );
      },
    );
  }
}
