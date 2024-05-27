import 'package:flutter/material.dart';
import 'package:restaurant/core/constant/color.dart';

class CustomThreeImage extends StatelessWidget {
  final Widget? child1;
  final Widget? child2;
  final Widget? child3;
  final int currnetimage1;
  final int currnetimage2;
  const CustomThreeImage(
      {super.key,
      this.child1,
      this.child2,
      this.child3,
      required this.currnetimage1,
      required this.currnetimage2});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.myprimarycolor,
      height: 200,
      child: currnetimage1 == 1
          ? Container(
              width: double.infinity,
              /*child: Image.network(
                "${AppLink.imagestatic}/${controller.resinfo[0]['res_img1']}",
                fit: BoxFit.cover,
              ),*/
              child: child1,
            )
          : currnetimage2 == 2
              ? Container(
                  width: double.infinity,
                  /* child: Image.network(
                    "${AppLink.imagestatic}/${controller.resinfo[0]['res_img2']}",
                    fit: BoxFit.cover,
                  ),*/
                  child: child2,
                )
              : Container(
                  width: double.infinity,
                  /* child: Image.network(
                    "${AppLink.imagestatic}/${controller.resinfo[0]['res_img3']}",
                    fit: BoxFit.cover,
                  ),*/
                  child: child3,
                ),
    );
  }
}
