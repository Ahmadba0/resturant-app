import 'package:flutter/material.dart';
import 'package:restaurant/core/constant/color.dart';

class CustomTextFormHome extends StatefulWidget {
  const CustomTextFormHome({super.key});

  @override
  State<CustomTextFormHome> createState() => _CustomTextFormHomeState();
}

class _CustomTextFormHomeState extends State<CustomTextFormHome> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: TextFormField(
        decoration: InputDecoration(
            hintText: "Search",
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColor.myprimarycolor, width: 2))),
      ),
    );
  }
}
