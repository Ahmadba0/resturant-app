import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:restaurant/controller/notification_controller.dart';
import 'package:restaurant/core/constant/color.dart';
import 'package:restaurant/linkapi.dart';
import 'package:restaurant/view/screen/HomeScreen.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  NotificationController controller = Get.put(NotificationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Notification",
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
        ), //"A new waiting revers in your restaurant"
        body: GetBuilder<NotificationController>(
          builder: (controller) => Container(
              padding: EdgeInsets.all(10),
              child: controller.myServices.sharedPref.getString("type") ==
                      1.toString()
                  ? ListView(
                      children: [
                        ...List.generate(
                            controller.listNotificationmanager.length,
                            (index) => AnimationConfiguration.staggeredList(
                                  position: index,
                                  child: SlideAnimation(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeInBack,
                                    verticalOffset: 100,
                                    child: FadeInAnimation(
                                      child: InkWell(
                                        onTap: () {},
                                        child: Card(
                                          elevation: 15,
                                          child: Column(
                                            children: [
                                              SizedBox(height: 10),
                                              Row(
                                                children: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.all(8),
                                                    child: controller.listNotification[
                                                                    index][
                                                                'users_image'] ==
                                                            null
                                                        ? const CircleAvatar(
                                                            radius: 25,
                                                            backgroundColor:
                                                                AppColor.mygrey,
                                                          )
                                                        : CircleAvatar(
                                                            radius: 28,
                                                            backgroundColor:
                                                                Colors.grey,
                                                            backgroundImage:
                                                                NetworkImage(
                                                                    "${AppLink.imagestatic}/${controller.listNotificationmanager[index]['users_image']}"),
                                                          ),
                                                  ),
                                                  //   const SizedBox(width: 65),
                                                  Flexible(
                                                    fit: FlexFit.tight,
                                                    child: Wrap(
                                                      children: [
                                                        Text(
                                                          "${controller.listNotificationmanager[index]['notification_body']}",
                                                          style:
                                                              const TextStyle(
                                                            color: AppColor
                                                                .myprimarycolor2,
                                                            fontSize: 18,
                                                            fontStyle: FontStyle
                                                                .italic,
                                                            //fontWeight: FontWeight.bold
                                                          ),
                                                        ),
                                                        Text(
                                                          "${controller.listNotificationmanager[index]['users_name']}",
                                                          style:
                                                              const TextStyle(
                                                            color:
                                                                AppColor.mygrey,
                                                            fontSize: 18,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(width: 15),
                                                  Column(
                                                    children: [
                                                      Text(
                                                        "${index + 1}",
                                                        style: const TextStyle(
                                                          color:
                                                              AppColor.mygrey,
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                      Text(
                                                        "${controller.listNotification[index]['notification_time'].toString().split(" ").last}",
                                                        style: const TextStyle(
                                                          color:
                                                              AppColor.mygrey,
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                      Text(
                                                        "${controller.listNotification[index]['notification_time'].toString().split(" ").first}",
                                                        style: const TextStyle(
                                                          color:
                                                              AppColor.mygrey,
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 15),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ))
                      ],
                    )
                  : ListView(
                      children: [
                        ...List.generate(
                            controller.listNotificationusers.length,
                            (index) => AnimationConfiguration.staggeredList(
                                  position: index,
                                  child: SlideAnimation(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeInBack,
                                    verticalOffset: 100,
                                    child: FadeInAnimation(
                                      child: InkWell(
                                        onTap: () {},
                                        child: Card(
                                          elevation: 15,
                                          child: Column(
                                            children: [
                                              SizedBox(height: 10),
                                              Row(
                                                children: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.all(8),
                                                    child: controller.listNotificationusers[
                                                                    index]
                                                                ['res_image'] ==
                                                            null
                                                        ? const CircleAvatar(
                                                            radius: 25,
                                                            backgroundColor:
                                                                AppColor.mygrey,
                                                          )
                                                        : CircleAvatar(
                                                            radius: 28,
                                                            backgroundColor:
                                                                Colors.grey,
                                                            backgroundImage:
                                                                NetworkImage(
                                                                    "${AppLink.imagestatic}/${controller.listNotificationusers[index]['res_image']}"),
                                                          ),
                                                  ),
                                                  const SizedBox(width: 40),
                                                  Flexible(
                                                    fit: FlexFit.tight,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "${controller.listNotificationusers[index]['notification_body']}",
                                                          style:
                                                              const TextStyle(
                                                            color: AppColor
                                                                .myprimarycolor2,
                                                            fontSize: 18,
                                                            fontStyle: FontStyle
                                                                .italic,
                                                            //fontWeight: FontWeight.bold
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        Text(
                                                          "       ${controller.listNotificationusers[index]['res_name']}",
                                                          style:
                                                              const TextStyle(
                                                            color:
                                                                AppColor.mygrey,
                                                            fontSize: 18,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Column(
                                                    children: [
                                                      Text(
                                                        "${index + 1}",
                                                        style: const TextStyle(
                                                          color:
                                                              AppColor.mygrey,
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                      Text(
                                                        "${controller.listNotification[index]['notification_time'].toString().split(" ").last}",
                                                        style: const TextStyle(
                                                          color:
                                                              AppColor.mygrey,
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                      Text(
                                                        "${controller.listNotification[index]['notification_time'].toString().split(" ").first}",
                                                        style: const TextStyle(
                                                          color:
                                                              AppColor.mygrey,
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 15),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ))
                      ],
                    )),
        ));
  }
}
