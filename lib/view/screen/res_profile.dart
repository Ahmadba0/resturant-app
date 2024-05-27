import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant/controller/res_profile_controller.dart';
import 'package:restaurant/core/constant/color.dart';
import 'package:restaurant/linkapi.dart';
import 'package:restaurant/view/screen/add_product.dart';
import 'package:restaurant/view/widget/add_res_widget/custom_drop_down_add.dart';
import 'package:restaurant/view/widget/cummonWidget/loading.dart';
import 'package:restaurant/view/widget/res_profilewidget/card_res_profile.dart';
import 'package:restaurant/view/widget/res_profilewidget/card_res_profile_rating.dart';
import 'package:restaurant/view/widget/res_profilewidget/custom_3img.dart';
import 'package:restaurant/view/widget/res_profilewidget/custom_btn_add_img.dart';
import 'package:restaurant/view/widget/res_profilewidget/custom_btn_moveleft.dart';
import 'package:restaurant/view/widget/res_profilewidget/custom_btn_moveright.dart';
import 'package:restaurant/view/widget/res_profilewidget/custom_image.dart';

class ResProfile extends StatefulWidget {
  const ResProfile({super.key});

  @override
  State<ResProfile> createState() => _ResProfileState();
}

class _ResProfileState extends State<ResProfile> {
  ResProfileController controller = Get.put(ResProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ResProfileController>(
        builder: (controller) => controller.isloading
            ? const Loading()
            : controller.resinfo.isEmpty
                ? Container()
                : Container(
                    child: Form(
                    key: controller.formstate,
                    child: ListView(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            controller.lolo
                                ? Container(
                                    color: AppColor.myprimarycolor,
                                    height: 200,
                                    child: Center(
                                      child: Lottie.asset(
                                          "assets/lottie/l1.json",
                                          width: 150,
                                          height: 150),
                                    ),
                                  )
                                : CustomThreeImage(
                                    currnetimage1: controller.currentimg,
                                    currnetimage2: controller.currentimg,
                                    child1: controller.resinfo[0]['res_img1'] ==
                                            null
                                        ? Container()
                                        : Image.network(
                                            "${AppLink.imagestatic}/${controller.i}",
                                            fit: BoxFit.cover,
                                          ),
                                    child2: controller.resinfo[0]['res_img2'] ==
                                            null
                                        ? Container()
                                        : Image.network(
                                            "${AppLink.imagestatic}/${controller.ii}",
                                            fit: BoxFit.cover,
                                          ),
                                    child3: controller.resinfo[0]['res_img3'] ==
                                            null
                                        ? Container()
                                        : Image.network(
                                            "${AppLink.imagestatic}/${controller.iii}",
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                            CustomImage(
                              backgroundImage: NetworkImage(
                                  "${AppLink.imagestatic}/${controller.resinfo[0]['res_image']}"),
                            ),
                            controller.currentimg == 3
                                ? Container()
                                : CustomBTNMoveRight(
                                    onPressed: () {
                                      controller.plus();
                                    },
                                  ),
                            controller.currentimg == 1
                                ? Container()
                                : CustomBTNMoveLeft(onPressed: () {
                                    controller.mins();
                                  }),
                          ],
                        ),
                        const SizedBox(height: 10),
                        controller.sumimg == 0
                            ? CustomBTNAddImage(
                                countimage: controller.sumimg,
                                onPressed: () {
                                  controller.addImageGalleryi();
                                },
                              )
                            : controller.sumimg == 1
                                ? CustomBTNAddImage(
                                    countimage: controller.sumimg,
                                    onPressed: () {
                                      controller.addImageGalleryii();
                                    },
                                  )
                                : controller.sumimg == 2
                                    ? CustomBTNAddImage(
                                        countimage: controller.sumimg,
                                        onPressed: () {
                                          controller.addImageGalleryiii();
                                        },
                                      )
                                    : controller.sumimg == 3
                                        ? Container(
                                            height: 39,
                                          )
                                        : Container(),
                        const SizedBox(height: 10),

                        CardResProfileRating(
                          milliseconds: 450,
                          value: controller.resinfo[0]['res_rating'],
                        ),
                        const SizedBox(height: 12),
                        //
                        //name
                        //
                        CardResProfile(
                            milliseconds: 500,
                            onConfirm: () {
                              controller.updatenameres();
                            },
                            content: TextFormField(
                              controller: controller.resnameCon,
                              decoration: const InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColor.myprimarycolor2))),
                            ),
                            titledialoge: "Edit the name",
                            text: "${controller.resinfo[0]['res_name']}"),

                        const SizedBox(height: 12),
                        //
                        //phone
                        //
                        CardResProfile(
                            milliseconds: 550,
                            onConfirm: () => controller.updatephoneres(),
                            content: TextFormField(
                              controller: controller.resphoneCon,
                              decoration: const InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColor.myprimarycolor2))),
                            ),
                            titledialoge: "Edit the number",
                            text:
                                "${controller.myServices.sharedPref.getString("phone")}"),
                        const SizedBox(height: 12),
                        //
                        //type
                        //
                        CardResProfile(
                            milliseconds: 600,
                            onConfirm: () => controller.updatetyperes(),
                            content: CustomDropDownAdd(
                              milliseconds: 0,
                              hint: "type",
                              item: controller.itemtype,
                              onChanged: (p0) {
                                controller.onchangedtype(p0);
                              },
                              valuee: controller.valuee,
                            ),
                            titledialoge: "Edit the type",
                            text: "${controller.resinfo[0]['res_type']}"),
                        const SizedBox(height: 12),
                        //
                        //location
                        //
                        CardResProfile(
                            milliseconds: 650,
                            onConfirm: () => controller.updatelocationres(),
                            content: CustomDropDownAdd(
                              milliseconds: 0,
                              hint: "location",
                              item: controller.itemlocation,
                              onChanged: (p0) {
                                controller.onchangedlocatoin(p0);
                              },
                              valuee: controller.valuee1,
                            ),
                            titledialoge: "Edit the location",
                            text: "${controller.resinfo[0]['res_location']}"),
                        const SizedBox(height: 12),
                        //
                        //capacity
                        //
                        CardResProfile(
                            milliseconds: 700,
                            onConfirm: () => controller.updatecapacityres(),
                            content: TextFormField(
                              controller: controller.rescapacityCon,
                              decoration: const InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColor.myprimarycolor2))),
                            ),
                            titledialoge: "Edit the capacity",
                            text: controller.resinfo[0]['res_capacity'] == null
                                ? "0 tabels"
                                : "${controller.resinfo[0]['res_capacity']} tables"),
                        AnimationConfiguration.staggeredList(
                          position: 0,
                          child: SlideAnimation(
                            duration: const Duration(milliseconds: 750),
                            curve: Curves.easeInBack,
                            horizontalOffset: 100,
                            child: FadeInAnimation(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 15),
                                child: ElevatedButton(
                                  onPressed: () => Get.to(AddProduct(),
                                      arguments: {
                                        "res_id":
                                            "${controller.resinfo[0]['res_id']}"
                                      }),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColor.myprimarycolor2,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 15)),
                                  child: const Text("Add Product"),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
      ),
    );
  }
}
