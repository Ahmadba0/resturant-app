// ignore_for_file: sort_child_properties_last, unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant/controller/signup_controller.dart';
import 'package:restaurant/core/function/alertexitApp.dart';
import 'package:restaurant/core/function/validinput.dart';
import 'package:restaurant/view/screen/logintest.dart';
import 'package:restaurant/view/widget/login_widget/btn_login.dart';
import 'package:restaurant/view/widget/login_widget/image_login.dart';
import 'package:restaurant/view/widget/login_widget/label_text.dart';
import 'package:restaurant/view/widget/login_widget/text_asq.dart';
import 'package:restaurant/view/widget/login_widget/text_form_login.dart';

class SiginUp extends StatefulWidget {
  const SiginUp({super.key});

  @override
  State<SiginUp> createState() => _SiginUpState();
}

class _SiginUpState extends State<SiginUp> {
  @override
  Widget build(BuildContext context) {
    SignUpController controller = Get.put(SignUpController());
    return WillPopScope(
      child: Scaffold(
          body: GetBuilder<SignUpController>(
              builder: (controller) => controller.isloading == true
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
                                const LabelText(label: "Signup"),
                                const SizedBox(height: 8),
                                TextFormLogin(
                                  isNumber: false,
                                  validator: (value) {
                                    return ValidInput(
                                        value!, 8, 50, "password");
                                  },
                                  controller: controller.users_name,
                                  hint: "User Name",
                                  prefixIcon: Icon(Icons.abc),
                                ),
                                TextFormLogin(
                                  isNumber: true,
                                  validator: (value) {
                                    return ValidInput(
                                        value!, 8, 50, "phonenumber");
                                  },
                                  controller: controller.users_phone,
                                  hint: "Phone Number",
                                  prefixIcon:
                                      Icon(Icons.format_list_numbered_outlined),
                                ),
                                TextFormLogin(
                                  isNumber: false,
                                  validator: (value) {
                                    return ValidInput(
                                        value!, 8, 50, "password");
                                  },
                                  controller: controller.users_password,
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
                                TextAsq(
                                    onTap: () {
                                      Get.offAll(() => const Login());
                                    },
                                    text1: "Have account? ",
                                    text2: "Login"),

                                const SizedBox(height: 85),
                                BTNlogin(
                                  text: "Siginup",
                                  onPressed: () {
                                    controller.signup();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ))),
      onWillPop: ExitApp,
    );
  }
}
