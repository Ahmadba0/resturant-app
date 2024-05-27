import 'package:flutter/material.dart';
import 'package:restaurant/core/constant/color.dart';

class TextAsq extends StatelessWidget {
  final String text1;
  final String text2;
  final void Function() onTap;
  const TextAsq(
      {super.key,
      required this.text1,
      required this.text2,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text1,
          style: TextStyle(color: AppColor.mygrey, fontSize: 17),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            text2,
            style: TextStyle(color: AppColor.myprimarycolor, fontSize: 18),
          ),
        )
      ],
    );
  }
}
