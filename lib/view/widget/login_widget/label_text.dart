import 'package:flutter/material.dart';
import 'package:restaurant/core/constant/color.dart';

class LabelText extends StatelessWidget {
  final String label;
  const LabelText({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
          fontSize: 35,
          color: AppColor.myprimarycolor2,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.italic),
    );
  }
}
