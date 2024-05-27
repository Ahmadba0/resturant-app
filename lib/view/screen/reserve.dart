// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:restaurant/controller/revers_controller.dart';
import 'package:restaurant/core/constant/color.dart';
import 'package:restaurant/core/function/alertexitApp.dart';
import 'package:restaurant/core/function/getdefaultdialog.dart';
import 'package:restaurant/linkapi.dart';
import 'package:restaurant/view/screen/HomeScreen.dart';
import 'package:restaurant/view/widget/cummonWidget/loading.dart';

class Reserve extends StatefulWidget {
  const Reserve({super.key});

  @override
  State<Reserve> createState() => _ReserveState();
}

class _ReserveState extends State<Reserve> {
  ReversController controller = Get.put(ReversController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: GetBack,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Reverse",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 20,
              ),
            ),
            leading: IconButton(
                onPressed: () {
                  Get.offAll(const HomeScreen());
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                )),
            backgroundColor: AppColor.myprimarycolor,
            centerTitle: true,
          ),
          body: Container(
              child: GetBuilder<ReversController>(
            builder: (controller) => controller.isloading
                ? const Loading()
                : ListView(
                    children: [
                      ...List.generate(
                        controller.listreverseodusers.length,
                        (index) => Builder(builder: (context) {
                          return AnimationConfiguration.staggeredList(
                            position: 0,
                            child: SlideAnimation(
                              duration: Duration(milliseconds: 600),
                              curve: Curves.easeInBack,
                              verticalOffset: 100,
                              child: FadeInAnimation(
                                child: InkWell(
                                  onLongPress: () {
                                    getdialog(
                                        "Warning",
                                        "Are you sure you want to delete this revers?",
                                        "Delete",
                                        "Cancel",
                                        ///////////
                                        () {
                                      controller.deletefromreversbyuser(
                                          "${controller.listreverseodusers[index]['revers_id']}");
                                      Get.back();
                                    }, () {
                                      print("cancel");
                                    });
                                  },
                                  child: Card(
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: AppColor.mygrey,
                                                  width: 1))),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      height: 80,
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 25,
                                            backgroundImage: NetworkImage(
                                                "${AppLink.imagestatic}/${controller.listreverseodusers[index]['res_image']}"),
                                          ),
                                          const Spacer(),
                                          Column(
                                            children: [
                                              const SizedBox(height: 7),
                                              Text(
                                                "${controller.listreverseodusers[index]['res_name']}",
                                                style: const TextStyle(
                                                  color:
                                                      AppColor.myprimarycolor2,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle: FontStyle.italic,
                                                  fontSize: 22,
                                                ),
                                              ),
                                              const SizedBox(height: 7),
                                              Text(
                                                "${controller.listreverseodusers[index]['res_location']}",
                                                style: const TextStyle(
                                                  color:
                                                      AppColor.myprimarycolor2,
                                                  fontWeight: FontWeight.w400,
                                                  //fontStyle: FontStyle.italic,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          Column(
                                            children: [
                                              const SizedBox(height: 10),
                                              Text(
                                                "${index + 1}",
                                                style: const TextStyle(
                                                  color: AppColor.mygrey,
                                                  fontSize: 15,
                                                ),
                                              ),
                                              Text(
                                                "${controller.listreverseodusers[index]['revers_date']}",
                                                style: const TextStyle(
                                                  color: AppColor.mygrey,
                                                  fontSize: 15,
                                                ),
                                              ),
                                              Text(
                                                "${controller.listreverseodusers[index]['revers_starttime']}",
                                                style: const TextStyle(
                                                  color: AppColor.mygrey,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      )
                    ],
                  ),
          )),
        ));
  }
}
