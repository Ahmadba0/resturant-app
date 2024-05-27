import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:restaurant/core/constant/color.dart';
import 'package:restaurant/view/screen/add_restaurant.dart';

class CardResProfileRating extends StatelessWidget {
  final value;
  final int milliseconds;
  const CardResProfileRating(
      {super.key, this.value, required this.milliseconds});

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
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 10, right: 10),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColor.myprimarycolor, width: 2)),
              child: stars(
                value: value,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
