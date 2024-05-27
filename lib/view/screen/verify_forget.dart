import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant/controller/verifyforget_controller.dart';
import 'package:restaurant/core/constant/color.dart';
import 'package:restaurant/view/widget/login_widget/image_login.dart';
import 'package:restaurant/view/widget/login_widget/label_text.dart';
import 'package:restaurant/view/widget/login_widget/text_asq.dart';

class VerifyForget extends StatefulWidget {
  const VerifyForget({super.key});

  @override
  State<VerifyForget> createState() => _VerifyForgetState();
}

class _VerifyForgetState extends State<VerifyForget> {
  VerifyForgetController controller = Get.put(VerifyForgetController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VerifyForgetController>(
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
                        const LoginImage(),
                        const SizedBox(height: 50),
                        const LabelText(label: "Verify Forget"),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${controller.phone}",
                              style: const TextStyle(
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
                          },
                        ),
                        const SizedBox(height: 20),
                        GetBuilder<VerifyForgetController>(
                          builder: (controller) => TextAsq(
                            text1: "Remain time: ",
                            text2: "${controller.i}",
                            onTap: () {},
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextAsq(
                            onTap: () {
                              controller.resend();
                            },
                            text1: "Don't recive code? ",
                            text2: "Resend"),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
