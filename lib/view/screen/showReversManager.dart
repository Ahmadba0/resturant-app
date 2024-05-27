import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:restaurant/controller/showreversebymanager_controller.dart';
import 'package:restaurant/core/constant/color.dart';
import 'package:restaurant/core/function/getdefaultdialog.dart';
import 'package:restaurant/linkapi.dart';
import 'package:restaurant/view/widget/cummonWidget/loading.dart';

class ShowReversManager extends StatefulWidget {
  const ShowReversManager({super.key});

  @override
  State<ShowReversManager> createState() => _ShowReversManagerState();
}

class _ShowReversManagerState extends State<ShowReversManager> {
  ShowReversByMangerController controller =
      Get.put(ShowReversByMangerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Restaurant Reverse",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
            onPressed: () {
              // Get.offAll(const HomeScreen());
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
        backgroundColor: AppColor.myprimarycolor,
        centerTitle: true,
      ),
      body: GetBuilder<ShowReversByMangerController>(
          builder: (controller) => controller.isloading
              ? const Loading()
              : ListView(
                  children: [
                    ...List.generate(
                      controller.listreversetoadmin.length,
                      (index) => AnimationConfiguration.staggeredList(
                        position: index,
                        child: SlideAnimation(
                          duration: Duration(milliseconds: 500),
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
                                    /////////////////
                                    () {
                                  controller.deletefromrevers(
                                      "${controller.listreversetoadmin[index]['revers_id']}");
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
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  height: 80,
                                  child: Row(
                                    children: [
                                      controller.listreversetoadmin[index]
                                                  ['users_image'] ==
                                              null
                                          ? const CircleAvatar(
                                              radius: 25,
                                              backgroundColor: AppColor.mygrey,
                                            )
                                          : CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  "${AppLink.imagestatic}/${controller.listreversetoadmin[index]['users_image']}"),
                                            ),
                                      const Spacer(),
                                      Column(
                                        children: [
                                          const SizedBox(height: 7),
                                          Text(
                                            "${controller.listreversetoadmin[index]['users_name']}",
                                            style: const TextStyle(
                                              color: AppColor.myprimarycolor2,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic,
                                              fontSize: 22,
                                            ),
                                          ),
                                          const SizedBox(height: 7),
                                          Text(
                                            "${controller.listreversetoadmin[index]['users_phone']}",
                                            style: const TextStyle(
                                              color: AppColor.myprimarycolor2,
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
                                            "${controller.listreversetoadmin[index]['revers_date']}",
                                            style: const TextStyle(
                                              color: AppColor.mygrey,
                                              fontSize: 15,
                                            ),
                                          ),
                                          Text(
                                            "${controller.listreversetoadmin[index]['revers_starttime']}",
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
                      ),
                    )
                  ],
                )),
    );
  }
}
