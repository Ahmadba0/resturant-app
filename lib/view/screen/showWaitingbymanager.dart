import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:restaurant/controller/showWaitingbymanager_controller.dart';
import 'package:restaurant/core/constant/color.dart';
import 'package:restaurant/core/function/getdefaultdialog.dart';
import 'package:restaurant/linkapi.dart';
import 'package:restaurant/view/screen/HomeScreen.dart';
import 'package:restaurant/view/widget/cummonWidget/loading.dart';

class ShowWaitingByManager extends StatefulWidget {
  const ShowWaitingByManager({super.key});

  @override
  State<ShowWaitingByManager> createState() => _ShowWaitingByManagerState();
}

class _ShowWaitingByManagerState extends State<ShowWaitingByManager> {
  ShowWaitingByMangerController controller =
      Get.put(ShowWaitingByMangerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Restaurant Waiting",
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
      body: GetBuilder<ShowWaitingByMangerController>(
          builder: (controller) => controller.isloading
              ? const Loading()
              : ListView(
                  children: [
                    ...List.generate(
                      controller.listwaitingtoadmin.length,
                      (index) => AnimationConfiguration.staggeredList(
                        position: index,
                        child: SlideAnimation(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInBack,
                          verticalOffset: 100,
                          child: FadeInAnimation(
                            child: InkWell(
                              onLongPress: () => getdialog(
                                  "Warning",
                                  "what is your action you will be do?",
                                  "Add to revers",
                                  "Delete",
                                  ////////
                                  () {
                                controller.movetorevers(
                                    "${controller.listwaitingtoadmin[index]['waiting_id']}",
                                    "${controller.listwaitingtoadmin[index]['waiting_date']}",
                                    "${controller.listwaitingtoadmin[index]['waiting_starttime']}",
                                    "${controller.listwaitingtoadmin[index]['users_id']}",
                                    "${controller.listwaitingtoadmin[index]['res_id']}",
                                    "${controller.listwaitingtoadmin[index]['res_phone']}",
                                    "${controller.listwaitingtoadmin[index]['users_phone']}");
                                Get.back();
                              },
                                  //////////////
                                  () {
                                controller.deletefromwaiting(
                                  "${controller.listwaitingtoadmin[index]['waiting_id']}",
                                );
                                //Get.back();
                              }),
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
                                      controller.listwaitingtoadmin[index]
                                                  ['users_image'] ==
                                              null
                                          ? const CircleAvatar(
                                              radius: 25,
                                              backgroundColor: AppColor.mygrey,
                                            )
                                          : CircleAvatar(
                                              radius: 25,
                                              backgroundColor: AppColor.mygrey,
                                              backgroundImage: NetworkImage(
                                                  "${AppLink.imagestatic}/${controller.listwaitingtoadmin[index]['users_image']}"),
                                            ),
                                      const Spacer(),
                                      Column(
                                        children: [
                                          const SizedBox(height: 7),
                                          Text(
                                            "${controller.listwaitingtoadmin[index]['users_name']}",
                                            style: const TextStyle(
                                              color: AppColor.myprimarycolor2,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic,
                                              fontSize: 22,
                                            ),
                                          ),
                                          const SizedBox(height: 7),
                                          Text(
                                            "${controller.listwaitingtoadmin[index]['users_phone']}",
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
                                            "${controller.listwaitingtoadmin[index]['waiting_date']}",
                                            style: const TextStyle(
                                              color: AppColor.mygrey,
                                              fontSize: 15,
                                            ),
                                          ),
                                          Text(
                                            "${controller.listwaitingtoadmin[index]['waiting_starttime']}",
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
