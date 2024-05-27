import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/core/constant/color.dart';

class ButtonIfAdmin extends StatelessWidget {
  final void Function()? onPressed;
  const ButtonIfAdmin({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 3,
        child: IconButton(
            //   onPressed: onPressed,
            onPressed: () {
              Get.defaultDialog(
                  radius: 20,
                  title: "Warning",
                  titleStyle: const TextStyle(
                      color: AppColor.red, fontWeight: FontWeight.bold),
                  middleText: "Do you want to delete this restaurant",
                  middleTextStyle:
                      const TextStyle(color: AppColor.myprimarycolor),
                  /*  onCancel: () {
                    //
                    //
                    //
                    controller.deleteresifadmin(
                        "${controller.allres[index]['res_phone']}");
                    Get.offAll(const HomeScreen());
                  },*/
                  onCancel: onPressed,
                  textCancel: "OK",
                  buttonColor: AppColor.myprimarycolor,
                  cancelTextColor: AppColor.myprimarycolor);
            },
            icon: const Icon(
              Icons.close,
              color: AppColor.red,
            )));
  }
}
