import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant/controller/reset_password_controller.dart';
import 'package:restaurant/core/function/validinput.dart';
import 'package:restaurant/view/widget/login_widget/btn_login.dart';
import 'package:restaurant/view/widget/login_widget/image_login.dart';
import 'package:restaurant/view/widget/login_widget/label_text.dart';
import 'package:restaurant/view/widget/login_widget/text_form_login.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  ResetPasswordController controller = Get.put(ResetPasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<ResetPasswordController>(
      builder: (controller) => controller.isLoading
          ? Center(
              child: Lottie.asset("assets/lottie/l1.json",
                  width: 150, height: 150),
            )
          : Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              child: ListView(
                children: [
                  Form(
                    key: controller.formState,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 50),
                        //  Image.asset("assets/images/cooker1.png"),
                        const LoginImage(),
                        const SizedBox(height: 30),
                        const LabelText(label: "Reset Password"),
                        const SizedBox(height: 8),
                        //--1
                        TextFormLogin(
                          controller: controller.password,
                          isNumber: false,
                          validator: (value) {
                            return ValidInput(value!, 8, 50, "password");
                          },
                          hint: "Password",
                          prefixIcon: controller.isshowpassword == true
                              ? const Icon(
                                  Icons.visibility,
                                  //color: Color.fromARGB(255, 4, 54, 95),
                                )
                              : const Icon(
                                  Icons.visibility_off,
                                  //color: Color.fromARGB(255, 4, 54, 95),
                                ),
                          ontapicon: () {
                            controller.showPassword();
                          },
                          obscureText: controller.isshowpassword,
                        ),
                        //--2
                        TextFormLogin(
                          controller: controller.re_password,
                          isNumber: false,
                          validator: (value) {
                            return ValidInput(value!, 8, 50, "password");
                          },
                          hint: "re_Password",
                          prefixIcon: controller.isshowpassword1 == true
                              ? const Icon(
                                  Icons.visibility,
                                  //color: Color.fromARGB(255, 4, 54, 95),
                                )
                              : const Icon(
                                  Icons.visibility_off,
                                  //color: Color.fromARGB(255, 4, 54, 95),
                                ),
                          ontapicon: () {
                            controller.showPassword1();
                          },
                          obscureText: controller.isshowpassword1,
                        ),

                        const SizedBox(height: 130),
                        BTNlogin(
                          text: "Reset",
                          onPressed: () {
                            controller.resetPassword();
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
    ));
  }
}
