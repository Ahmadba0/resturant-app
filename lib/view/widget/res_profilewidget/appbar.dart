import 'package:flutter/material.dart';
import 'package:restaurant/core/constant/color.dart';

class AppBarResProfile extends StatelessWidget {
  final ImageProvider<Object>? backgroundImage;
  const AppBarResProfile({super.key, this.backgroundImage});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          color: AppColor.myprimarycolor,
          height: 180,
        ),
        Positioned(
            top: 127,
            left: 135,
            child: CircleAvatar(
              radius: 60,
              backgroundImage: backgroundImage,
              /*  backgroundImage: NetworkImage(
                  "${AppLink.imagestatic}/${controller.resinfo[0]['res_image']}"),*/
            ))
      ],
    );
  }
}
