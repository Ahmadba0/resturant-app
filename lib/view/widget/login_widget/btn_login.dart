import 'package:flutter/material.dart';
import 'package:restaurant/core/constant/color.dart';

class BTNlogin extends StatelessWidget {
  final void Function()? onPressed;
  final String? text;
  const BTNlogin({super.key, this.onPressed, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 60),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 18, horizontal: 80),
              //backgroundColor: AppColor.myprimarycolor,
              primary: AppColor.myprimarycolor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25))),
          child: Text(
            text!,
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
    );
  }
}
