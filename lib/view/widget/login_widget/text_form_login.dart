import 'package:flutter/material.dart';
import 'package:restaurant/core/constant/color.dart';

class TextFormLogin extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool? isNumber;
  final bool? obscureText;
  final void Function()? ontapicon;
  final Widget? prefixIcon;
  const TextFormLogin(
      {super.key,
      required this.hint,
      this.controller,
      this.validator,
      required this.isNumber,
      this.obscureText,
      this.ontapicon,
      this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: TextFormField(
        obscureText: obscureText == null || obscureText == false ? false : true,
        keyboardType: isNumber!
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: validator,
        controller: controller,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        //a textDirection: TextDirection.rtl,
        cursorColor: AppColor.myprimarycolor,
        decoration: InputDecoration(
            prefixIcon: InkWell(
              child: prefixIcon,
              onTap: ontapicon,
            ),
            hintText: hint,
            hintStyle: TextStyle(fontWeight: FontWeight.bold),
            //   border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColor.myprimarycolor, width: 1.5),
              borderRadius: BorderRadius.circular(25),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.red, width: 1.5),
              borderRadius: BorderRadius.circular(25),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColor.myprimarycolor2, width: 2),
              borderRadius: BorderRadius.circular(25),
            )),
      ),
    );
  }
}
