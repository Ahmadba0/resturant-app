import 'package:flutter/material.dart';
import 'package:restaurant/core/constant/color.dart';

class CustomBTNMoveRight extends StatelessWidget {
  final void Function()? onPressed;
  const CustomBTNMoveRight({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 60,
        right: 5,
        child: IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.arrow_circle_right_outlined,
              color: AppColor.mygrey,
              size: 35,
            )));
  }
}
