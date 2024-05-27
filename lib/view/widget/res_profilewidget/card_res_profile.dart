import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:restaurant/core/constant/color.dart';

class CardResProfile extends StatelessWidget {
  final String text;
  final String titledialoge;
  final Widget? content;
  final void Function()? onConfirm;
  final bool? isshowedit;
  final int milliseconds;
  const CardResProfile(
      {super.key,
      required this.text,
      required this.titledialoge,
      this.content,
      this.onConfirm,
      this.isshowedit,
      required this.milliseconds});

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: 0,
      child: SlideAnimation(
        duration: Duration(milliseconds: milliseconds),
        curve: Curves.easeInBack,
        horizontalOffset: 100,
        child: FadeInAnimation(
          child: Card(
            elevation: 5,
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColor.myprimarycolor2, width: 2)),
                  child: Text(
                    text,
                    style:
                        TextStyle(color: AppColor.myprimarycolor, fontSize: 30),
                  ),
                ),
                isshowedit == false
                    ? Container()
                    : Positioned(
                        right: 5,
                        child: IconButton(
                            onPressed: () {
                              Get.defaultDialog(
                                  title: titledialoge,
                                  titleStyle: TextStyle(
                                      color: AppColor.myprimarycolor2,
                                      fontWeight: FontWeight.bold),
                                  content: content,
                                  onCancel: () {},
                                  onConfirm: onConfirm,
                                  buttonColor: AppColor.myprimarycolor,
                                  confirmTextColor: Colors.white,
                                  cancelTextColor: AppColor.myprimarycolor);
                            },
                            icon: Icon(
                              Icons.edit,
                              color: AppColor.myprimarycolor2,
                            )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
