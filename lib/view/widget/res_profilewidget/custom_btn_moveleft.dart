import 'package:flutter/material.dart';
import 'package:restaurant/core/constant/color.dart';

class CustomBTNMoveLeft extends StatelessWidget {
  final void Function()? onPressed;
  const CustomBTNMoveLeft({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 60,
        left: 5,
        child: IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.arrow_circle_left_outlined,
              color: AppColor.mygrey,
              size: 35,
            )));
  }
}
