// ignore_for_file: avoid_unnecessary_containers

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:restaurant/controller/fav_controller.dart';
import 'package:restaurant/controller/home_controller.dart';
import 'package:restaurant/core/constant/color.dart';
import 'package:restaurant/core/function/alertexitApp.dart';
import 'package:restaurant/linkapi.dart';
import 'package:restaurant/view/screen/HomeScreen.dart';
import 'package:restaurant/view/screen/res_details.dart';
import 'package:restaurant/view/screen/srach.dart';
import 'package:restaurant/view/widget/cummonWidget/empty.dart';
import 'package:restaurant/view/widget/cummonWidget/loading.dart';
import 'package:restaurant/view/widget/home_widget/Inf_about_res.dart';
import 'package:restaurant/view/widget/home_widget/appbarinhome.dart';
import 'package:restaurant/view/widget/home_widget/button_fav.dart';
import 'package:restaurant/view/widget/home_widget/button_if_admin.dart';
import 'package:restaurant/view/widget/home_widget/custom_region_btn.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeController controller = Get.put(HomeController());
  FavController favController = Get.put(FavController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => WillPopScope(
        onWillPop: ExitApp,
        child: Container(
          child: ListView(
            children: [
              //
              //app bar
              //
              AppBarHome(
                textcondition1:
                    controller.myServices.sharedPref.getString("type"),
                textcondition2:
                    controller.myServices.sharedPref.getString("type"),
                onPressedsearch: () {
                  Get.to(() => const SearchPage());
                },
              ),
              //
              //button of city
              //
              Container(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 10),
                height: 50,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    //1
                    CustomRegionBTN(
                      text: "All",
                      backgroundColor: controller.currentRes == 0
                          ? AppColor.myprimarycolor3
                          : AppColor.myprimarycolor,
                      onPressed: () {
                        controller.currentRes = 0;
                        setState(() {});
                      },
                    ),
                    const SizedBox(width: 8),
                    //2
                    CustomRegionBTN(
                      text: "Damas",
                      backgroundColor: controller.currentRes == 1
                          ? AppColor.myprimarycolor3
                          : AppColor.myprimarycolor,
                      onPressed: () {
                        controller.currentRes = 1;
                        controller.getresbylocation("Damas");
                        setState(() {});
                      },
                    ),
                    const SizedBox(width: 8),
                    //3
                    CustomRegionBTN(
                      text: "Ref Damas",
                      backgroundColor: controller.currentRes == 2
                          ? AppColor.myprimarycolor3
                          : AppColor.myprimarycolor,
                      onPressed: () {
                        controller.currentRes = 2;
                        controller.getresbylocation("Ref Damas");
                        setState(() {});
                      },
                    ),
                    const SizedBox(width: 8),
                    //4
                    CustomRegionBTN(
                      text: "Homs",
                      backgroundColor: controller.currentRes == 3
                          ? AppColor.myprimarycolor3
                          : AppColor.myprimarycolor,
                      onPressed: () {
                        controller.currentRes = 3;
                        controller.getresbylocation("Homs");
                        setState(() {});
                      },
                    ),
                    const SizedBox(width: 8),
                    //5
                    CustomRegionBTN(
                      text: "Aleppo",
                      backgroundColor: controller.currentRes == 4
                          ? AppColor.myprimarycolor3
                          : AppColor.myprimarycolor,
                      onPressed: () {
                        controller.currentRes = 4;
                        controller.getresbylocation("Aleppo");
                        setState(() {});
                      },
                    ),
                    const SizedBox(width: 8),
                    //6
                    CustomRegionBTN(
                      text: "Daraa",
                      backgroundColor: controller.currentRes == 5
                          ? AppColor.myprimarycolor3
                          : AppColor.myprimarycolor,
                      onPressed: () {
                        controller.currentRes = 5;
                        controller.getresbylocation("Daraa");
                        setState(() {});
                      },
                    ),
                    const SizedBox(width: 8),
                    //7
                    CustomRegionBTN(
                      text: "Latakia",
                      backgroundColor: controller.currentRes == 6
                          ? AppColor.myprimarycolor3
                          : AppColor.myprimarycolor,
                      onPressed: () {
                        controller.currentRes = 6;
                        controller.getresbylocation("Latakia");
                        setState(() {});
                      },
                    ),
                    const SizedBox(width: 8),
                    //8
                    CustomRegionBTN(
                      text: "Tartous",
                      backgroundColor: controller.currentRes == 7
                          ? AppColor.myprimarycolor3
                          : AppColor.myprimarycolor,
                      onPressed: () {
                        controller.currentRes = 7;
                        controller.getresbylocation("Tartous");
                        setState(() {});
                      },
                    ),
                    const SizedBox(width: 8),
                    //9
                    CustomRegionBTN(
                      text: "Hamah",
                      backgroundColor: controller.currentRes == 8
                          ? AppColor.myprimarycolor3
                          : AppColor.myprimarycolor,
                      onPressed: () {
                        controller.currentRes = 8;
                        controller.getresbylocation("Hamah");
                        setState(() {});
                      },
                    ),
                    const SizedBox(width: 8),
                    //10
                    CustomRegionBTN(
                      text: "Edleb",
                      backgroundColor: controller.currentRes == 9
                          ? AppColor.myprimarycolor3
                          : AppColor.myprimarycolor,
                      onPressed: () {
                        controller.currentRes = 9;
                        controller.getresbylocation("Edleb");
                        setState(() {});
                      },
                    ),
                    const SizedBox(width: 8),
                    //11
                    CustomRegionBTN(
                      text: "Raqqa",
                      backgroundColor: controller.currentRes == 10
                          ? AppColor.myprimarycolor3
                          : AppColor.myprimarycolor,
                      onPressed: () {
                        controller.currentRes = 10;
                        controller.getresbylocation("Raqqa");
                        setState(() {});
                      },
                    ),
                    const SizedBox(width: 8),
                    //12
                    CustomRegionBTN(
                      text: "Dir AlZor",
                      backgroundColor: controller.currentRes == 11
                          ? AppColor.myprimarycolor3
                          : AppColor.myprimarycolor,
                      onPressed: () {
                        controller.currentRes = 11;
                        controller.getresbylocation("Dir AlZor");
                        setState(() {});
                      },
                    ),
                    const SizedBox(width: 8),
                    //12
                    CustomRegionBTN(
                      text: "AlSwaidaa",
                      backgroundColor: controller.currentRes == 12
                          ? AppColor.myprimarycolor3
                          : AppColor.myprimarycolor,
                      onPressed: () {
                        controller.currentRes = 12;
                        controller.getresbylocation("AlSwaidaa");
                        setState(() {});
                      },
                    ),

                    const SizedBox(width: 8),
                  ],
                ),
              ),

              ///all
              controller.currentRes == 0
                  ? controller.isloading
                      ? Center(child: const Loading())
                      : Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: controller.allres.isEmpty
                              ? const Empty()
                              : StaggeredGrid.count(
                                  crossAxisCount: 2,
                                  children: [
                                    ...List.generate(
                                        controller.allres.length,
                                        (index) => controller.isloading
                                            ? const Loading()
                                            : AnimationConfiguration
                                                .staggeredList(
                                                position: index,
                                                child: SlideAnimation(
                                                  duration: const Duration(
                                                      milliseconds: 600),
                                                  curve: Curves.easeInBack,
                                                  verticalOffset: 100,
                                                  child: FadeInAnimation(
                                                    child: Stack(
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            controller.myServices
                                                                        .sharedPref
                                                                        .getString(
                                                                            "type") ==
                                                                    2.toString()
                                                                ? null
                                                                : Get.to(
                                                                    () =>
                                                                        const ResDetails(),
                                                                    arguments: {
                                                                        "resid":
                                                                            controller.allres[index]['res_id'],
                                                                      });
                                                          },
                                                          child: Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .all(3),
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    color: AppColor
                                                                        .myprimarycolor,
                                                                    width: 2)),
                                                            child: InfAboutRes(
                                                                src:
                                                                    "${AppLink.imagestatic}/${controller.allres[index]['res_image']}",
                                                                valueOfStar: controller
                                                                            .allres[
                                                                        index][
                                                                    'res_rating'],
                                                                textName:
                                                                    "${controller.allres[index]['res_name']}",
                                                                textLoaction:
                                                                    "${controller.allres[index]['res_location']}"),
                                                          ),
                                                        ),
                                                        controller.myServices
                                                                    .sharedPref
                                                                    .getString(
                                                                        "type") ==
                                                                2.toString()
                                                            ? ButtonIfAdmin(
                                                                onPressed: () {
                                                                  print(
                                                                      "${controller.allres[index]['res_phone']}");
                                                                  controller
                                                                      .deleteresifadmin(
                                                                          "${controller.allres[index]['res_phone']}",
                                                                          index);
                                                                  Timer(
                                                                      Duration(
                                                                          seconds:
                                                                              2),
                                                                      () {
                                                                    Get.offAll(
                                                                        HomeScreen());
                                                                  });
                                                                },
                                                              )
                                                            : ButtonFav(
                                                                condition: favController
                                                                    .listresfavid
                                                                    .contains(controller
                                                                            .allres[index]
                                                                        [
                                                                        'res_id']),
                                                                onAddFav: () {
                                                                  favController.addfav(
                                                                      controller
                                                                              .allres[index]
                                                                          [
                                                                          'res_id']);

                                                                  Timer(
                                                                      const Duration(
                                                                          seconds:
                                                                              1),
                                                                      () {
                                                                    Get.offAll(
                                                                        const HomeScreen());
                                                                  });
                                                                },
                                                                onRemoveFav:
                                                                    () {
                                                                  favController.deletefav(
                                                                      controller
                                                                              .allres[index]
                                                                          [
                                                                          'res_id']);

                                                                  Timer(
                                                                      const Duration(
                                                                          seconds:
                                                                              1),
                                                                      () {
                                                                    Get.offAll(
                                                                        const HomeScreen());
                                                                  });
                                                                },
                                                              )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ))
                                  ],
                                ),
                        )
                  //damas
                  : controller.currentRes == 1
                      ? controller.isloading
                          ? const Loading()
                          : Container(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: controller.resbylocation.isEmpty
                                  ? const Empty()
                                  : StaggeredGrid.count(
                                      crossAxisCount: 2,
                                      children: [
                                        ...List.generate(
                                            controller.resbylocation.length,
                                            (index) => AnimationConfiguration
                                                    .staggeredList(
                                                  position: index,
                                                  child: SlideAnimation(
                                                    duration: const Duration(
                                                        milliseconds: 600),
                                                    curve: Curves.easeInBack,
                                                    verticalOffset: 100,
                                                    child: FadeInAnimation(
                                                      child: Stack(
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              controller.myServices
                                                                          .sharedPref
                                                                          .getString(
                                                                              "type") ==
                                                                      2
                                                                          .toString()
                                                                  ? null
                                                                  : Get.to(
                                                                      () =>
                                                                          const ResDetails(),
                                                                      arguments: {
                                                                          "resid":
                                                                              controller.resbylocation[index]['res_id'],
                                                                        });
                                                            },
                                                            child: Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .all(3),
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      color: AppColor
                                                                          .myprimarycolor,
                                                                      width:
                                                                          2)),
                                                              child: InfAboutRes(
                                                                  src:
                                                                      "${AppLink.imagestatic}/${controller.resbylocation[index]['res_image']}",
                                                                  valueOfStar: controller
                                                                              .resbylocation[
                                                                          index]
                                                                      [
                                                                      'res_rating'],
                                                                  textName:
                                                                      "${controller.resbylocation[index]['res_name']}",
                                                                  textLoaction:
                                                                      "${controller.resbylocation[index]['res_location']}"),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ))
                                      ],
                                    ),
                            )
                      : controller.currentRes == 2
                          ? controller.isloading
                              ? const Loading()
                              : Container(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: controller.resbylocation.isEmpty
                                      ? const Empty()
                                      : StaggeredGrid.count(
                                          crossAxisCount: 2,
                                          children: [
                                            ...List.generate(
                                                controller.resbylocation.length,
                                                (index) =>
                                                    AnimationConfiguration
                                                        .staggeredList(
                                                      position: index,
                                                      child: SlideAnimation(
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    600),
                                                        curve:
                                                            Curves.easeInBack,
                                                        verticalOffset: 100,
                                                        child: FadeInAnimation(
                                                          child: Stack(
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  controller.myServices.sharedPref.getString(
                                                                              "type") ==
                                                                          2
                                                                              .toString()
                                                                      ? null
                                                                      : Get.to(
                                                                          () =>
                                                                              const ResDetails(),
                                                                          arguments: {
                                                                              "resid": controller.resbylocation[index]['res_id'],
                                                                            });
                                                                },
                                                                child:
                                                                    Container(
                                                                  margin:
                                                                      const EdgeInsets
                                                                          .all(3),
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color: AppColor
                                                                              .myprimarycolor,
                                                                          width:
                                                                              2)),
                                                                  child:
                                                                      InfAboutRes(
                                                                    src:
                                                                        "${AppLink.imagestatic}/${controller.resbylocation[index]['res_image']}",
                                                                    valueOfStar:
                                                                        controller.resbylocation[index]
                                                                            [
                                                                            'res_rating'],
                                                                    textName:
                                                                        "${controller.resbylocation[index]['res_name']}",
                                                                    textLoaction:
                                                                        "${controller.resbylocation[index]['res_location']}",
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ))
                                          ],
                                        ),
                                )
                          : controller.currentRes == 3
                              ? controller.isloading
                                  ? const Loading()
                                  : Container(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: controller.resbylocation.isEmpty
                                          ? const Empty()
                                          : StaggeredGrid.count(
                                              crossAxisCount: 2,
                                              children: [
                                                ...List.generate(
                                                    controller
                                                        .resbylocation.length,
                                                    (index) => Stack(
                                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                controller.myServices
                                                                            .sharedPref
                                                                            .getString(
                                                                                "type") ==
                                                                        2
                                                                            .toString()
                                                                    ? null
                                                                    : Get.to(
                                                                        () =>
                                                                            const ResDetails(),
                                                                        arguments: {
                                                                            "resid":
                                                                                controller.resbylocation[index]['res_id'],
                                                                          });
                                                              },
                                                              child: Container(
                                                                margin:
                                                                    const EdgeInsets
                                                                        .all(3),
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        color: AppColor
                                                                            .myprimarycolor,
                                                                        width:
                                                                            2)),
                                                                child:
                                                                    InfAboutRes(
                                                                  src:
                                                                      "${AppLink.imagestatic}/${controller.resbylocation[index]['res_image']}",
                                                                  valueOfStar: controller
                                                                              .resbylocation[
                                                                          index]
                                                                      [
                                                                      'res_rating'],
                                                                  textName:
                                                                      "${controller.resbylocation[index]['res_name']}",
                                                                  textLoaction:
                                                                      "${controller.resbylocation[index]['res_location']}",
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ))
                                              ],
                                            ),
                                    )
                              : controller.currentRes == 4
                                  ? controller.isloading
                                      ? const Loading()
                                      : Container(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child:
                                              controller.resbylocation.isEmpty
                                                  ? const Empty()
                                                  : StaggeredGrid.count(
                                                      crossAxisCount: 2,
                                                      children: [
                                                        ...List.generate(
                                                            controller
                                                                .resbylocation
                                                                .length,
                                                            (index) => Stack(
                                                                  children: [
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        controller.myServices.sharedPref.getString("type") ==
                                                                                2.toString()
                                                                            ? null
                                                                            : Get.to(() => const ResDetails(), arguments: {
                                                                                "resid": controller.resbylocation[index]['res_id'],
                                                                              });
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        margin:
                                                                            const EdgeInsets.all(3),
                                                                        decoration:
                                                                            BoxDecoration(border: Border.all(color: AppColor.myprimarycolor, width: 2)),
                                                                        child:
                                                                            InfAboutRes(
                                                                          src:
                                                                              "${AppLink.imagestatic}/${controller.resbylocation[index]['res_image']}",
                                                                          valueOfStar:
                                                                              controller.resbylocation[index]['res_rating'],
                                                                          textName:
                                                                              "${controller.resbylocation[index]['res_name']}",
                                                                          textLoaction:
                                                                              "${controller.resbylocation[index]['res_location']}",
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ))
                                                      ],
                                                    ),
                                        )
                                  : controller.currentRes == 5
                                      ? controller.isloading
                                          ? const Loading()
                                          : Container(
                                              padding: const EdgeInsets.only(
                                                  left: 10, right: 10),
                                              child:
                                                  controller
                                                          .resbylocation.isEmpty
                                                      ? const Empty()
                                                      : StaggeredGrid.count(
                                                          crossAxisCount: 2,
                                                          children: [
                                                            ...List.generate(
                                                                controller
                                                                    .resbylocation
                                                                    .length,
                                                                (index) =>
                                                                    Stack(
                                                                      children: [
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            Get.to(() => const ResDetails(), arguments: {
                                                                              "resid": controller.resbylocation[index]['res_id'],
                                                                            });
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            margin:
                                                                                const EdgeInsets.all(3),
                                                                            decoration:
                                                                                BoxDecoration(border: Border.all(color: AppColor.myprimarycolor, width: 2)),
                                                                            child:
                                                                                InfAboutRes(
                                                                              src: "${AppLink.imagestatic}/${controller.resbylocation[index]['res_image']}",
                                                                              valueOfStar: controller.resbylocation[index]['res_rating'],
                                                                              textName: "${controller.resbylocation[index]['res_name']}",
                                                                              textLoaction: "${controller.resbylocation[index]['res_location']}",
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ))
                                                          ],
                                                        ),
                                            )
                                      : controller.currentRes == 6
                                          ? controller.isloading
                                              ? const Loading()
                                              : Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  child:
                                                      controller.resbylocation
                                                              .isEmpty
                                                          ? const Empty()
                                                          : StaggeredGrid.count(
                                                              crossAxisCount: 2,
                                                              children: [
                                                                ...List
                                                                    .generate(
                                                                        controller
                                                                            .resbylocation
                                                                            .length,
                                                                        (index) =>
                                                                            Stack(
                                                                              children: [
                                                                                InkWell(
                                                                                  onTap: () {
                                                                                    Get.to(() => const ResDetails(), arguments: {
                                                                                      "resid": controller.resbylocation[index]['res_id'],
                                                                                    });
                                                                                  },
                                                                                  child: Container(
                                                                                    margin: const EdgeInsets.all(3),
                                                                                    decoration: BoxDecoration(border: Border.all(color: AppColor.myprimarycolor, width: 2)),
                                                                                    child: InfAboutRes(
                                                                                      src: "${AppLink.imagestatic}/${controller.resbylocation[index]['res_image']}",
                                                                                      valueOfStar: controller.resbylocation[index]['res_rating'],
                                                                                      textName: "${controller.resbylocation[index]['res_name']}",
                                                                                      textLoaction: "${controller.resbylocation[index]['res_location']}",
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ))
                                                              ],
                                                            ),
                                                )
                                          : controller.currentRes == 7
                                              ? controller.isloading
                                                  ? const Loading()
                                                  : Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10,
                                                              right: 10),
                                                      child:
                                                          controller
                                                                  .resbylocation
                                                                  .isEmpty
                                                              ? const Empty()
                                                              : StaggeredGrid
                                                                  .count(
                                                                  crossAxisCount:
                                                                      2,
                                                                  children: [
                                                                    ...List.generate(
                                                                        controller.resbylocation.length,
                                                                        (index) => Stack(
                                                                              children: [
                                                                                InkWell(
                                                                                  onTap: () {
                                                                                    Get.to(() => const ResDetails(), arguments: {
                                                                                      "resid": controller.resbylocation[index]['res_id'],
                                                                                    });
                                                                                  },
                                                                                  child: Container(
                                                                                    margin: const EdgeInsets.all(3),
                                                                                    decoration: BoxDecoration(border: Border.all(color: AppColor.myprimarycolor, width: 2)),
                                                                                    child: InfAboutRes(
                                                                                      src: "${AppLink.imagestatic}/${controller.resbylocation[index]['res_image']}",
                                                                                      valueOfStar: controller.resbylocation[index]['res_rating'],
                                                                                      textName: "${controller.resbylocation[index]['res_name']}",
                                                                                      textLoaction: "${controller.resbylocation[index]['res_location']}",
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ))
                                                                  ],
                                                                ),
                                                    )
                                              : controller.currentRes == 8
                                                  ? controller.isloading
                                                      ? const Loading()
                                                      : Container(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 10,
                                                                  right: 10),
                                                          child: controller
                                                                  .resbylocation
                                                                  .isEmpty
                                                              ? const Empty()
                                                              : StaggeredGrid
                                                                  .count(
                                                                  crossAxisCount:
                                                                      2,
                                                                  children: [
                                                                    ...List.generate(
                                                                        controller.resbylocation.length,
                                                                        (index) => Stack(
                                                                              children: [
                                                                                InkWell(
                                                                                  onTap: () {
                                                                                    Get.to(() => const ResDetails(), arguments: {
                                                                                      "resid": controller.resbylocation[index]['res_id'],
                                                                                    });
                                                                                  },
                                                                                  child: Container(
                                                                                    margin: const EdgeInsets.all(3),
                                                                                    decoration: BoxDecoration(border: Border.all(color: AppColor.myprimarycolor, width: 2)),
                                                                                    child: InfAboutRes(
                                                                                      src: "${AppLink.imagestatic}/${controller.resbylocation[index]['res_image']}",
                                                                                      valueOfStar: controller.resbylocation[index]['res_rating'],
                                                                                      textName: "${controller.resbylocation[index]['res_name']}",
                                                                                      textLoaction: "${controller.resbylocation[index]['res_location']}",
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ))
                                                                  ],
                                                                ),
                                                        )
                                                  : controller.currentRes == 9
                                                      ? controller.isloading
                                                          ? const Loading()
                                                          : Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 10,
                                                                      right:
                                                                          10),
                                                              child: controller
                                                                      .resbylocation
                                                                      .isEmpty
                                                                  ? const Empty()
                                                                  : StaggeredGrid
                                                                      .count(
                                                                      crossAxisCount:
                                                                          2,
                                                                      children: [
                                                                        ...List.generate(
                                                                            controller.resbylocation.length,
                                                                            (index) => Stack(
                                                                                  children: [
                                                                                    InkWell(
                                                                                      onTap: () {
                                                                                        Get.to(() => const ResDetails(), arguments: {
                                                                                          "resid": controller.resbylocation[index]['res_id'],
                                                                                        });
                                                                                      },
                                                                                      child: Container(
                                                                                        margin: const EdgeInsets.all(3),
                                                                                        decoration: BoxDecoration(border: Border.all(color: AppColor.myprimarycolor, width: 2)),
                                                                                        child: InfAboutRes(
                                                                                          src: "${AppLink.imagestatic}/${controller.resbylocation[index]['res_image']}",
                                                                                          valueOfStar: controller.resbylocation[index]['res_rating'],
                                                                                          textName: "${controller.resbylocation[index]['res_name']}",
                                                                                          textLoaction: "${controller.resbylocation[index]['res_location']}",
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ))
                                                                      ],
                                                                    ),
                                                            )
                                                      : controller.currentRes ==
                                                              10
                                                          ? controller.isloading
                                                              ? const Loading()
                                                              : Container(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 10,
                                                                      right:
                                                                          10),
                                                                  child: controller
                                                                          .resbylocation
                                                                          .isEmpty
                                                                      ? const Empty()
                                                                      : StaggeredGrid
                                                                          .count(
                                                                          crossAxisCount:
                                                                              2,
                                                                          children: [
                                                                            ...List.generate(
                                                                                controller.resbylocation.length,
                                                                                (index) => Stack(
                                                                                      children: [
                                                                                        InkWell(
                                                                                          onTap: () {
                                                                                            Get.to(() => const ResDetails(), arguments: {
                                                                                              "resid": controller.resbylocation[index]['res_id'],
                                                                                            });
                                                                                          },
                                                                                          child: Container(
                                                                                            margin: const EdgeInsets.all(3),
                                                                                            decoration: BoxDecoration(border: Border.all(color: AppColor.myprimarycolor, width: 2)),
                                                                                            child: InfAboutRes(
                                                                                              src: "${AppLink.imagestatic}/${controller.resbylocation[index]['res_image']}",
                                                                                              valueOfStar: controller.resbylocation[index]['res_rating'],
                                                                                              textName: "${controller.resbylocation[index]['res_name']}",
                                                                                              textLoaction: "${controller.resbylocation[index]['res_location']}",
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ))
                                                                          ],
                                                                        ),
                                                                )
                                                          : controller.currentRes ==
                                                                  11
                                                              ? controller
                                                                      .isloading
                                                                  ? const Loading()
                                                                  : Container(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          left:
                                                                              10,
                                                                          right:
                                                                              10),
                                                                      child: controller
                                                                              .resbylocation
                                                                              .isEmpty
                                                                          ? const Empty()
                                                                          : StaggeredGrid
                                                                              .count(
                                                                              crossAxisCount: 2,
                                                                              children: [
                                                                                ...List.generate(
                                                                                    controller.resbylocation.length,
                                                                                    (index) => Stack(
                                                                                          children: [
                                                                                            InkWell(
                                                                                              onTap: () {
                                                                                                Get.to(() => const ResDetails(), arguments: {
                                                                                                  "resid": controller.resbylocation[index]['res_id'],
                                                                                                });
                                                                                              },
                                                                                              child: Container(
                                                                                                margin: const EdgeInsets.all(3),
                                                                                                decoration: BoxDecoration(border: Border.all(color: AppColor.myprimarycolor, width: 2)),
                                                                                                child: InfAboutRes(
                                                                                                  src: "${AppLink.imagestatic}/${controller.resbylocation[index]['res_image']}",
                                                                                                  valueOfStar: controller.resbylocation[index]['res_rating'],
                                                                                                  textName: "${controller.resbylocation[index]['res_name']}",
                                                                                                  textLoaction: "${controller.resbylocation[index]['res_location']}",
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ))
                                                                              ],
                                                                            ),
                                                                    )
                                                              : Container(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 10,
                                                                      right:
                                                                          10),
                                                                  child: controller
                                                                          .resbylocation
                                                                          .isEmpty
                                                                      ? const Empty()
                                                                      : StaggeredGrid
                                                                          .count(
                                                                          crossAxisCount:
                                                                              2,
                                                                          children: [
                                                                            ...List.generate(
                                                                                controller.resbylocation.length,
                                                                                (index) => Stack(
                                                                                      children: [
                                                                                        InkWell(
                                                                                          onTap: () {
                                                                                            Get.to(() => const ResDetails(), arguments: {
                                                                                              "resid": controller.resbylocation[index]['res_id'],
                                                                                            });
                                                                                          },
                                                                                          child: Container(
                                                                                            margin: const EdgeInsets.all(3),
                                                                                            decoration: BoxDecoration(border: Border.all(color: AppColor.myprimarycolor, width: 2)),
                                                                                            child: InfAboutRes(
                                                                                              src: "${AppLink.imagestatic}/${controller.resbylocation[index]['res_image']}",
                                                                                              valueOfStar: controller.resbylocation[index]['res_rating'],
                                                                                              textName: "${controller.resbylocation[index]['res_name']}",
                                                                                              textLoaction: "${controller.resbylocation[index]['res_location']}",
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ))
                                                                          ],
                                                                        ),
                                                                )
            ],
          ),
        ),
      ),
    );
  }
}
