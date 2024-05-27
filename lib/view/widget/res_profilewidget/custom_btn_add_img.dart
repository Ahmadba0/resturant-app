import 'package:flutter/material.dart';
import 'package:restaurant/core/constant/color.dart';

class CustomBTNAddImage extends StatelessWidget {
  final countimage;
  final void Function()? onPressed;
  const CustomBTNAddImage({super.key, this.countimage, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: countimage != 3
          ? IconButton(
              onPressed: onPressed,
              icon: const Icon(
                Icons.camera_alt_outlined,
                size: 30,
                color: AppColor.mygrey,
              ))
          : Container(
              height: 42,
            ),
    );
  }
}
