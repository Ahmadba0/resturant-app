import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/core/constant/color.dart';
import 'package:restaurant/view/screen/notification.dart';
import 'package:restaurant/view/screen/showReversManager.dart';

class AppBarHome extends StatelessWidget {
  final void Function()? onPressedsearch;
  final textcondition1;
  final textcondition2;
  const AppBarHome(
      {super.key,
      this.onPressedsearch,
      required this.textcondition1,
      this.textcondition2});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      color: AppColor.myprimarycolor,
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: IconButton(
                  onPressed: onPressedsearch,
                  icon: const Icon(
                    Icons.search_outlined,
                    color: Colors.white,
                  ))),
          const Spacer(),
          const Spacer(),
          textcondition2 == 1.toString() ? const Spacer() : Container(),
          Expanded(
              flex: 3,
              child:
                  /*controller.myServices.sharedPref.getString("type")*/
                  textcondition1 == 0.toString()
                      ? const Text("restaurant",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic))
                      : /* controller.myServices.sharedPref
                                          .getString("type")*/

                      textcondition1 == 1.toString()
                          ? const Text("manager",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic))
                          : const Text(
                              "admin",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                            )),
          const Spacer(),
          /*controller.myServices.sharedPref.getString("type")*/
          /* textcondition2 == 1.toString()
              ? Expanded(
                  flex: 1,
                  child: IconButton(
                      onPressed: () {
                        Get.to(() => const ShowWaitingByManager());
                      },
                      icon: const Icon(
                        Icons.history_toggle_off_outlined,
                        color: Colors.white,
                      )))
              : Container(),*/
          textcondition2 == 1.toString()
              ? Expanded(
                  flex: 1,
                  child: IconButton(
                      onPressed: () {
                        Get.to(() => const ShowReversManager());
                      },
                      icon: const Icon(
                        Icons.book,
                        color: Colors.white,
                      )))
              : Container(),
          textcondition1 == 2.toString()
              ? Container()
              : Expanded(
                  flex: 1,
                  child: IconButton(
                      onPressed: () {
                        Get.to(() => const NotificationPage());
                      },
                      icon: const Icon(
                        Icons.notifications_active_outlined,
                        color: Colors.white,
                      ))),
        ],
      ),
    );
  }
}
