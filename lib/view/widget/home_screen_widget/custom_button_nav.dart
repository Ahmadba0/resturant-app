import 'package:flutter/material.dart';

class CustomButtonNav extends StatelessWidget {
  final void Function()? onTap;
  final Color? color;
  final IconData? icon;
  final String text;
  const CustomButtonNav(
      {super.key, this.onTap, this.color, this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      /*  onTap: () {
        controller.currentindex = 0;
        setState(() {});
      },*/
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(height: 8),
          GestureDetector(
            child: Icon(
              icon,
              /*  color: controller.currentindex == 0
                  ? AppColor.myprimarycolor3
                  : Colors.white,*/
              color: color,
              size: 30,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              /* color: controller.currentindex == 0
                  ? AppColor.myprimarycolor3
                  : Colors.white,*/
              color: color,
            ),
          )
        ],
      ),
    );
  }
}
