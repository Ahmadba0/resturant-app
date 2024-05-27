import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:restaurant/controller/add_res_controller.dart';
import 'package:restaurant/core/constant/color.dart';
import 'package:restaurant/core/function/validinput.dart';
import 'package:restaurant/view/widget/add_res_widget/custom_drop_down_add.dart';
import 'package:restaurant/view/widget/add_res_widget/text_title.dart';
import 'package:restaurant/view/widget/add_res_widget/textform_add.dart';
import 'package:restaurant/view/widget/cummonWidget/loading.dart';
import 'package:restaurant/view/widget/login_widget/btn_login.dart';

class AddRestaurant extends StatefulWidget {
  const AddRestaurant({super.key});

  @override
  State<AddRestaurant> createState() => _AddRestaurantState();
}

class _AddRestaurantState extends State<AddRestaurant> {
  AddResController controller = Get.put(AddResController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.myprimarycolor,
          title: const Text("Add Restaurant"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: AppColor.myprimarycolor2,
            onPressed: () {
              controller.add();
            },
            child: const Icon(
              Icons.add,
              size: 35,
            )),

        //
        body: GetBuilder<AddResController>(
          builder: (controller) => controller.isloading
              ? const Loading()
              : Container(
                  padding: const EdgeInsets.all(15),
                  child: Form(
                    key: controller.formState,
                    child: ListView(
                      children: [
                        ///
                        ///
                        ///
                        const TextTitle(
                            milliseconds: 400, text: "Name of restaurant: "),

                        ///
                        ///
                        ///
                        const SizedBox(height: 10),

                        ///
                        ///
                        ///
                        CustomTextFormAdd(
                          milliseconds: 450,
                          prefixIcon: const Icon(
                            Icons.ac_unit_rounded,
                            color: AppColor.mygrey,
                          ),
                          controller: controller.namecontroller,
                          hine: "name",
                          isNumber: false,
                          validator: (value) {
                            return ValidInput(value!, 5, 50, "password");
                          },
                        ),

                        ///
                        ///
                        ///
                        const SizedBox(height: 10),

                        ///
                        ///
                        ///
                        const TextTitle(
                            milliseconds: 500, text: "Name of manager: "),

                        ///
                        ///
                        ///
                        const SizedBox(height: 10),

                        ///
                        ///
                        ///
                        CustomTextFormAdd(
                          milliseconds: 550,
                          prefixIcon: const Icon(
                            Icons.ac_unit_rounded,
                            color: AppColor.mygrey,
                          ),
                          controller: controller.nameManagercontroller,
                          hine: "name of manager",
                          isNumber: false,
                          validator: (value) {
                            return ValidInput(value!, 5, 50, "password");
                          },
                        ),

                        ///
                        ///
                        ///
                        const SizedBox(height: 10),

                        ///
                        ///
                        ///
                        const TextTitle(milliseconds: 600, text: "Location: "),

                        ///
                        ///
                        ///
                        const SizedBox(height: 10),

                        ///
                        ///
                        ///
                        CustomDropDownAdd(
                          milliseconds: 650,
                          hint: "location",
                          item: controller.itemlocation,
                          onChanged: (p0) {
                            controller.onchangedlocatoin(p0);
                          },
                          valuee: controller.valuee1,
                        ),

                        ///
                        ///
                        ///
                        const SizedBox(height: 10),

                        ///
                        ///
                        ///
                        const TextTitle(milliseconds: 700, text: "Phone: "),

                        ///
                        ///
                        ///
                        const SizedBox(height: 10),

                        ///
                        ///
                        ///
                        CustomTextFormAdd(
                          milliseconds: 750,
                          prefixIcon: const Icon(
                            Icons.ac_unit_rounded,
                            color: AppColor.mygrey,
                          ),
                          controller: controller.phonecontroller,
                          hine: "phone",
                          isNumber: true,
                          validator: (value) {
                            return ValidInput(value!, 5, 50, "phonenumber");
                          },
                        ),

                        ///
                        ///
                        ///
                        const SizedBox(height: 10),

                        ///
                        ///
                        ///
                        const TextTitle(milliseconds: 800, text: "Password: "),

                        ///
                        ///
                        ///
                        const SizedBox(height: 10),

                        ///
                        ///
                        ///
                        CustomTextFormAdd(
                          milliseconds: 850,
                          // prefixIcon: Icon(Icons.format_list_numbered_rounded),
                          obscureText: controller.isshowpassword,
                          prefixIcon: controller.isshowpassword == true
                              ? const Icon(
                                  Icons.visibility,
                                  //color: Color.fromARGB(255, 4, 54, 95),
                                )
                              : const Icon(
                                  Icons.visibility_off,
                                  color: AppColor.mygrey,
                                ),
                          ontapicon: () {
                            controller.showPassword();
                          },
                          controller: controller.passwordcontroller,
                          hine: "password",
                          isNumber: false,
                          validator: (value) {
                            return ValidInput(value!, 8, 50, "password");
                          },
                        ),

                        ///
                        ///
                        ///
                        const SizedBox(height: 10),

                        ///
                        ///
                        ///
                        const TextTitle(milliseconds: 900, text: "Type: "),

                        ///
                        ///
                        ///
                        const SizedBox(height: 10),

                        ///
                        ///
                        ///
                        CustomDropDownAdd(
                          milliseconds: 1000,
                          hint: "type",
                          item: controller.itemtype,
                          onChanged: (p0) {
                            controller.onchangedtype(p0);
                          },
                          valuee: controller.valuee,
                        ),

                        ///
                        ///
                        ///
                        const SizedBox(height: 10),

                        ///
                        ///
                        ///
                        const TextTitle(milliseconds: 1050, text: "Rating: "),

                        ///
                        ///
                        ///
                        const SizedBox(height: 10),

                        ///
                        ///
                        ///
                        AnimationConfiguration.staggeredList(
                          position: 0,
                          child: SlideAnimation(
                            duration: Duration(milliseconds: 1100),
                            curve: Curves.easeInBack,
                            verticalOffset: 100,
                            child: FadeInAnimation(
                              child: Container(
                                height: 55,
                                margin:
                                    const EdgeInsets.only(left: 65, right: 65),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColor.myprimarycolor,
                                        width: 2),
                                    borderRadius: BorderRadius.circular(25)),
                                child: stars(
                                  value: controller.valuerating,
                                  onTap1: () {
                                    controller.valuerating == 1
                                        ? controller.valuerating = 0
                                        : controller.valuerating = 1;
                                    setState(() {});
                                  },
                                  onTap2: () {
                                    controller.valuerating = 2;
                                    setState(() {});
                                  },
                                  onTap3: () {
                                    controller.valuerating = 3;
                                    setState(() {});
                                  },
                                  onTap4: () {
                                    controller.valuerating = 4;
                                    setState(() {});
                                  },
                                  onTap5: () {
                                    controller.valuerating = 5;
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),

                        ///
                        ///
                        ///
                        const SizedBox(height: 10),

                        ///
                        ///
                        ///
                        const TextTitle(milliseconds: 1150, text: "Image: "),

                        ///
                        ///
                        ///
                        const SizedBox(height: 10),

                        ///
                        ///
                        ///
                        BTNlogin(
                          text: "Add Image",
                          onPressed: () {
                            controller.addImageGallery();
                          },
                        ),

                        ///
                        ///
                        ///
                        const SizedBox(height: 10),

                        ///
                        ///
                        ///
                        Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColor.myprimarycolor, width: 2),
                            ),
                            child: controller.myfile != null
                                ? Container(
                                    height: 250,
                                    child: Image.file(
                                      controller.myfile!,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : null),

                        ///
                        ///
                        ///
                      ],
                    ),
                  ),
                ),
        ));
  }
}

class stars extends StatelessWidget {
  final value;
  final void Function()? onTap1;
  final void Function()? onTap2;
  final void Function()? onTap3;
  final void Function()? onTap4;
  final void Function()? onTap5;
  const stars(
      {super.key,
      this.value,
      this.onTap1,
      this.onTap2,
      this.onTap3,
      this.onTap4,
      this.onTap5});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: onTap1,
              child: value >= 1
                  ? const Icon(
                      Icons.star,
                      color: AppColor.myprimarycolor2,
                      size: 30,
                    )
                  : const Icon(
                      Icons.star_border,
                      color: AppColor.myprimarycolor2,
                      size: 30,
                    ),
            ),
            GestureDetector(
              onTap: onTap2,
              child: value >= 2
                  ? const Icon(
                      Icons.star,
                      color: AppColor.myprimarycolor2,
                      size: 30,
                    )
                  : const Icon(
                      Icons.star_border,
                      color: AppColor.myprimarycolor2,
                      size: 30,
                    ),
            ),
            GestureDetector(
              onTap: onTap3,
              child: value >= 3
                  ? const Icon(
                      Icons.star,
                      color: AppColor.myprimarycolor2,
                      size: 30,
                    )
                  : const Icon(
                      Icons.star_border,
                      color: AppColor.myprimarycolor2,
                      size: 30,
                    ),
            ),
            GestureDetector(
              onTap: onTap4,
              child: value >= 4
                  ? const Icon(
                      Icons.star,
                      color: AppColor.myprimarycolor2,
                      size: 30,
                    )
                  : const Icon(
                      Icons.star_border,
                      color: AppColor.myprimarycolor2,
                      size: 30,
                    ),
            ),
            GestureDetector(
              onTap: onTap5,
              child: value >= 5
                  ? const Icon(
                      Icons.star,
                      color: AppColor.myprimarycolor2,
                      size: 30,
                    )
                  : const Icon(
                      Icons.star_border,
                      color: AppColor.myprimarycolor2,
                      size: 30,
                    ),
            )
          ],
        ),
      ),
    );
  }
}
