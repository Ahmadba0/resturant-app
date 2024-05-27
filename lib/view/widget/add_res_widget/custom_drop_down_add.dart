import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:restaurant/core/constant/color.dart';

class CustomDropDownAdd extends StatelessWidget {
  final List item;
  final valuee;
  final void Function(Object?)? onChanged;
  final String hint;
  final int milliseconds;
  const CustomDropDownAdd(
      {super.key,
      required this.item,
      this.valuee,
      this.onChanged,
      required this.hint,
      required this.milliseconds});

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: 0,
      child: SlideAnimation(
        duration: Duration(milliseconds: milliseconds),
        curve: Curves.easeInBack,
        verticalOffset: 100,
        child: FadeInAnimation(
          child: Container(
            height: 60,
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.myprimarycolor, width: 2),
                //  color: Color.fromARGB(255, 4, 45, 95),
                borderRadius: BorderRadius.circular(25)),
            child: DropdownButtonFormField(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 70),
              hint: Text(
                hint,
                style: const TextStyle(
                    color: AppColor.mygrey,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              items: item
                  .map((e) => DropdownMenuItem(

                      // ignore: sort_child_properties_last
                      child: Center(
                        child: Text(
                          e.toString(),
                          style: const TextStyle(
                              // height: 0,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: AppColor.myprimarycolor3),
                        ),
                      ),
                      value: e))
                  .toList(),
              onChanged: onChanged,
              dropdownColor: AppColor.myprimarycolor,
              isExpanded: true,
              icon: const Icon(
                Icons.arrow_drop_down,
                color: AppColor.myprimarycolor2,
              ),
              value: valuee,
              decoration: const InputDecoration(enabled: false),
              iconEnabledColor: const Color.fromARGB(255, 247, 237, 158),
            ),
          ),
        ),
      ),
    );
  }
}
