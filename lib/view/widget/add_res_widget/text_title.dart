import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:restaurant/core/constant/color.dart';

class TextTitle extends StatelessWidget {
  final String text;
  final int milliseconds;
  const TextTitle({super.key, required this.text, required this.milliseconds});

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: 0,
      child: SlideAnimation(
        duration: Duration(milliseconds: milliseconds),
        curve: Curves.easeInBack,
        verticalOffset: 100,
        child: FadeInAnimation(
          child: Text(
            text,
            style: TextStyle(
                color: AppColor.myprimarycolor,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
