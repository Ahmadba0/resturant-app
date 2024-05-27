import 'package:flutter/material.dart';
import 'package:restaurant/core/constant/color.dart';

class CustomText2 extends StatelessWidget {
  const CustomText2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Find Restaurant Find Restaurant \n Find Restaurant ",
      style: TextStyle(
          fontSize: 18,
          //fontWeight: FontWeight.bold,
          color: AppColor.mygrey),
      textAlign: TextAlign.center,
    );
  }
}
