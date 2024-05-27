import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant/controller/verify_signup_controller.dart';
import 'package:restaurant/core/constant/color.dart';
import 'package:restaurant/view/screen/siginup.dart';
import 'package:restaurant/view/widget/login_widget/image_login.dart';
import 'package:restaurant/view/widget/login_widget/label_text.dart';
import 'package:restaurant/view/widget/login_widget/text_asq.dart';

class VerifyCodeSignup extends StatefulWidget {
  const VerifyCodeSignup({super.key});

  @override
  State<VerifyCodeSignup> createState() => _VerifyCodeSignupState();
}

class _VerifyCodeSignupState extends State<VerifyCodeSignup> {
  VerifySignupController controller = Get.put(VerifySignupController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VerifySignupController>(
        builder: (controller) => Scaffold(
              body: controller.isloadingVerifySignup
                  ? Center(
                      child: Lottie.asset("assets/lottie/l1.json",
                          width: 150, height: 150),
                    )
                  : Container(
                      padding: const EdgeInsets.all(10),
                      child: ListView(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 50),
                              //  Image.asset("assets/images/cooker1.png"),
                              const LoginImage(),

                              const SizedBox(height: 50),
                              const LabelText(label: "Verify Signup"),
                              const SizedBox(height: 8),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "0932892707",
                                    style: TextStyle(
                                        color: AppColor.myprimarycolor2,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )
                                ],
                              ),
                              const SizedBox(height: 20),
                              OtpTextField(
                                borderRadius: BorderRadius.circular(25),
                                enabledBorderColor: AppColor.myprimarycolor,
                                cursorColor: AppColor.myprimarycolor2,
                                numberOfFields: 5,
                                borderColor: const Color(0xFF512DA8),
                                showFieldAsBox: true,
                                onCodeChanged: (String code) {},
                                onSubmit: (String verificationCode) {
                                  controller.gotosuccessPage(verificationCode);
                                  print(verificationCode);
                                },
                              ),
                              const SizedBox(height: 20),
                              GetBuilder<VerifySignupController>(
                                builder: (controller) => TextAsq(
                                  text1: "Remain time: ",
                                  text2: "${controller.i}",
                                  onTap: () {
                                    //controller.resend();
                                  },
                                ),
                              ),
                              const SizedBox(height: 8),

                              TextAsq(
                                  onTap: () {
                                    controller.resend();
                                  },
                                  text1: "Don't recive code? ",
                                  text2: "Resend"),
                              const SizedBox(height: 8),
                              TextAsq(
                                  onTap: () {
                                    Get.offAll(() => const SiginUp());
                                  },
                                  text1: "Do you want change imformation? ",
                                  text2: "Change"),
                              const SizedBox(height: 110),
                            ],
                          ),
                        ],
                      ),
                    ),
            ));
  }
}
