import 'package:flutter/material.dart';
import 'package:restaurant/core/constant/color.dart';

class CustomText1 extends StatelessWidget {
  final String text;
  const CustomText1({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: AppColor.myprimarycolor),
    );
  }
}
