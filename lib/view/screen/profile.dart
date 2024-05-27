import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant/controller/profileController.dart';
import 'package:restaurant/core/constant/color.dart';
import 'package:restaurant/core/function/alertexitApp.dart';
import 'package:restaurant/linkapi.dart';
import 'package:restaurant/view/screen/logintest.dart';
import 'package:restaurant/view/widget/cummonWidget/loading.dart';
import 'package:restaurant/view/widget/res_profilewidget/card_res_profile.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ProfileController controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: GetBack,
      child: GetBuilder<ProfileController>(
        builder: (controller) => controller.isloading1 || controller.isloading2
            ? Center(
                child: Lottie.asset("assets/lottie/l1.json",
                    width: 150, height: 150),
              )
            : Container(
                child: Form(
                  key: controller.formstate,
                  child: ListView(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            color: AppColor.myprimarycolor,
                            height: 180,
                          ),
                          Positioned(
                            top: 127,
                            left: 135,
                            child: controller.ll == true
                                ? Loading()
                                : controller.usersimg != null
                                    ? Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(60),
                                            border: Border.all(
                                                color: Colors.white, width: 3)),
                                        child: controller.usersimg != ''
                                            ? CircleAvatar(
                                                radius: 60,
                                                backgroundColor:
                                                    AppColor.myprimarycolor2,
                                                backgroundImage: NetworkImage(
                                                    "${AppLink.imagestatic}/${controller.usersimg}"),
                                              )
                                            : const CircleAvatar(
                                                radius: 60,
                                                backgroundImage: AssetImage(
                                                    "assets/images/images.png"),
                                              ),
                                      )
                                    : const CircleAvatar(
                                        radius: 60,
                                        backgroundColor:
                                            AppColor.myprimarycolor2,
                                        /*  backgroundImage: AssetImage(
                                              "assets/images/images.png"),*/
                                      ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              onPressed: () {
                                controller.addImageGallery();
                              },
                              icon: const Icon(
                                Icons.camera_alt_outlined,
                                color: AppColor.mygrey,
                                size: 30,
                              ),
                            ),
                          ),
                          Spacer(),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                              onPressed: () {
                                String userid = controller.myServices.sharedPref
                                    .getString("phone")
                                    .toString();
                                FirebaseMessaging.instance
                                    .unsubscribeFromTopic("users");
                                FirebaseMessaging.instance
                                    .unsubscribeFromTopic("users${userid}");
                                controller.myServices.sharedPref.clear();
                                Get.offAll(Login());
                              },
                              icon: const Icon(
                                Icons.logout_outlined,
                                color: AppColor.mygrey,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),

                      ///
                      ///
                      ///
                      ///
                      CardResProfile(
                          milliseconds: 500,
                          onConfirm: () => controller.updatenameres(),
                          content: TextFormField(
                            controller: controller.usersnameCon,
                            decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColor.myprimarycolor2))),
                          ),
                          text:
                              "${controller.myServices.sharedPref.getString("name")}",
                          titledialoge: "Edit name"),
                      const SizedBox(height: 12),

                      ///
                      ///
                      ///
                      CardResProfile(
                          milliseconds: 550,
                          onConfirm: () => controller.updatephoneres(),
                          content: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: controller.usersphoneCon,
                            decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColor.myprimarycolor2))),
                          ),
                          text:
                              "${controller.myServices.sharedPref.getString("phone")}",
                          titledialoge: "Edit phone"),
                      const SizedBox(height: 12),

                      ///
                      ///
                      ///
                      CardResProfile(
                          milliseconds: 600,
                          isshowedit: false,
                          text: controller.myServices.sharedPref
                                      .getString("type") ==
                                  0.toString()
                              ? "Users"
                              : controller.myServices.sharedPref
                                          .getString("type") ==
                                      1.toString()
                                  ? "Manager"
                                  : "Admin",
                          titledialoge: "Edit name"),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
