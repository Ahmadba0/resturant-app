import 'package:flutter/material.dart';
import 'package:restaurant/core/constant/color.dart';

class CustomImage extends StatelessWidget {
  final ImageProvider<Object>? backgroundImage;
  const CustomImage({super.key, this.backgroundImage});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 135,
        left: 135,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 5),
              borderRadius: BorderRadius.circular(60)),
          child: CircleAvatar(
            radius: 60,
            backgroundColor: AppColor.myprimarycolor,
            backgroundImage: backgroundImage,
            /*backgroundImage: NetworkImage(
                "${AppLink.imagestatic}/${controller.resinfo[0]['res_image']}"),*/
          ),
        ));
  }
}
