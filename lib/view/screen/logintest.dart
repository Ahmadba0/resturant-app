import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant/controller/login_controller.dart';
import 'package:restaurant/core/function/validinput.dart';
import 'package:restaurant/view/screen/forget_password.dart';
import 'package:restaurant/view/screen/siginup.dart';
import 'package:restaurant/view/widget/login_widget/btn_login.dart';
import 'package:restaurant/view/widget/login_widget/image_login.dart';
import 'package:restaurant/view/widget/login_widget/label_text.dart';
import 'package:restaurant/view/widget/login_widget/text_asq.dart';
import 'package:restaurant/view/widget/login_widget/text_form_login.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) => Scaffold(
          body: controller.isloading
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
                            LabelText(label: "Login"),
                            SizedBox(height: 8),
                            TextFormLogin(
                              controller: controller.phonenumber,
                              isNumber: true,
                              validator: (value) {
                                return ValidInput(value!, 8, 50, "password");
                              },
                              hint: "Phone Number",
                              //controller: ,
                              prefixIcon:
                                  Icon(Icons.format_list_numbered_rounded),
                            ),
                            GetBuilder<LoginController>(
                              builder: (controller) => TextFormLogin(
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
                            ),
                            TextAsq(
                                onTap: () {
                                  Get.to(() => const ForgetPassword());
                                },
                                text1: "Forget password? ",
                                text2: "Reset"),
                            SizedBox(height: 8),
                            TextAsq(
                                onTap: () {
                                  Get.to(() => const SiginUp());
                                },
                                text1: "Dont't have an account? ",
                                text2: "Create account"),
                            SizedBox(height: 110),
                            BTNlogin(
                              text: "Login",
                              onPressed: () {
                                controller.login();
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
    );
  }
}
