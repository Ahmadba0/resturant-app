import 'package:flutter/material.dart';
import 'package:restaurant/core/constant/imageasset.dart';

class CustomBTN extends StatelessWidget {
  final void Function()? onTap;
  final int currentpage;
  const CustomBTN({super.key, this.onTap, required this.currentpage});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: currentpage == 2
            ? Container(
                width: 160,
                child: Image.asset(
                  AppImagesAsset.onBoardingImagebtn2,
                  fit: BoxFit.contain,
                ),
              )
            : Container(
                width: 100,
                child: Image.asset(
                  AppImagesAsset.onBoardingImagebtn1,
                  fit: BoxFit.contain,
                ),
              ));
  }
}
