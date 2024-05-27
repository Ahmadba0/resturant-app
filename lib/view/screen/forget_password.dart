import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant/controller/forgetpassword_controller.dart';
import 'package:restaurant/core/function/validinput.dart';
import 'package:restaurant/view/widget/login_widget/btn_login.dart';
import 'package:restaurant/view/widget/login_widget/image_login.dart';
import 'package:restaurant/view/widget/login_widget/label_text.dart';
import 'package:restaurant/view/widget/login_widget/text_form_login.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  ForgetPasswordController controller = Get.put(ForgetPasswordController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPasswordController>(
      builder: (controller) => Scaffold(
        body: controller.isLoading
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
                          LoginImage(),
                          const SizedBox(height: 30),
                          LabelText(label: "Forget Password"),
                          SizedBox(height: 8),
                          TextFormLogin(
                            controller: controller.phoneCon,
                            isNumber: true,
                            validator: (value) {
                              return ValidInput(value!, 8, 50, "password");
                            },
                            hint: "Phone Number",
                            prefixIcon:
                                Icon(Icons.format_list_numbered_outlined),
                          ),

                          SizedBox(height: 200),
                          BTNlogin(
                            text: "Check",
                            onPressed: () {
                              controller.checkEmail();
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
