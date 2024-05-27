import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:restaurant/core/constant/color.dart';

class CustomTextFormAdd extends StatelessWidget {
  final String hine;
  final TextEditingController? controller;
  final bool isNumber;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final void Function()? ontapicon;
  final Widget? prefixIcon;
  final int milliseconds;
  const CustomTextFormAdd({
    super.key,
    required this.hine,
    this.controller,
    required this.isNumber,
    this.validator,
    this.obscureText,
    this.ontapicon,
    this.prefixIcon,
    required this.milliseconds,
  });

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: 0,
      child: SlideAnimation(
        duration: Duration(milliseconds: milliseconds),
        curve: Curves.easeInBack,
        verticalOffset: 100,
        child: FadeInAnimation(
          child: TextFormField(
            obscureText:
                obscureText == null || obscureText == false ? false : true,
            keyboardType: isNumber
                ? const TextInputType.numberWithOptions(decimal: true)
                : TextInputType.text,
            validator: validator,
            controller: controller,
            style: TextStyle(
              color: AppColor.myprimarycolor3,
              fontWeight: FontWeight.bold,
            ),
            cursorColor: AppColor.myprimarycolor,
            decoration: InputDecoration(
                prefixIcon: InkWell(
                  child: prefixIcon,
                  onTap: ontapicon,
                ),
                hintText: hine,
                hintStyle: TextStyle(fontWeight: FontWeight.bold),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: AppColor.myprimarycolor, width: 1.5),
                  borderRadius: BorderRadius.circular(25),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColor.red, width: 1.5),
                  borderRadius: BorderRadius.circular(25),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: AppColor.myprimarycolor2, width: 2),
                  borderRadius: BorderRadius.circular(25),
                )),
          ),
        ),
      ),
    );
  }
}
