import 'package:flutter/material.dart';

class CustomRegionBTN extends StatelessWidget {
  final void Function()? onPressed;
  final Color? backgroundColor;
  final String text;
  const CustomRegionBTN(
      {super.key, this.onPressed, this.backgroundColor, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      /*onPressed: () {
        controller.currentRes = 0;
        setState(() {});
      },*/
      onPressed: onPressed,
      child: Text(text),
      style: ElevatedButton.styleFrom(
          /*     backgroundColor: controller.currentRes == 0
            ? AppColor.myprimarycolor3
            : AppColor.myprimarycolor,*/
          backgroundColor: backgroundColor),
    );
  }
}
