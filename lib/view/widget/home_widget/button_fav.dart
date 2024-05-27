import 'package:flutter/material.dart';
import 'package:restaurant/core/constant/color.dart';

class ButtonFav extends StatelessWidget {
  final void Function() onAddFav;
  final void Function() onRemoveFav;
  final condition;
  const ButtonFav(
      {super.key,
      required this.onAddFav,
      required this.onRemoveFav,
      this.condition});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 3,
        child: condition
            /*favController.listresfavid
                .contains(controller.allres[index]['res_id'])*/
            ? IconButton(
                onPressed: onRemoveFav,
                icon: const Icon(
                  Icons.favorite,
                  color: AppColor.red,
                ))
            : IconButton(
                /* onPressed: () {
                  favController.addfav(controller.allres[index]['res_id']);
                  Get.offAll(const HomeScreen());
                },*/
                onPressed: onAddFav,
                icon: const Icon(
                  Icons.favorite_border,
                  color: AppColor.red,
                )));
  }
}
