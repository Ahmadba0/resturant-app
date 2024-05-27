import 'package:flutter/material.dart';
import 'package:restaurant/core/constant/color.dart';

class CustomNotificationBTN extends StatelessWidget {
  const CustomNotificationBTN({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        height: 57,
        decoration: BoxDecoration(
            border: Border.all(color: AppColor.myprimarycolor, width: 2)),
        child: Icon(
          Icons.notifications_active_outlined,
          color: AppColor.myprimarycolor,
        ),
      ),
    );
  }
}
