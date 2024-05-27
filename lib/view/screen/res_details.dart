import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant/controller/res_deatils_controller.dart';
import 'package:restaurant/core/constant/color.dart';
import 'package:restaurant/linkapi.dart';
import 'package:restaurant/view/screen/browse_menu.dart';
import 'package:restaurant/view/widget/cummonWidget/loading.dart';

class ResDetails extends StatefulWidget {
  const ResDetails({super.key});

  @override
  State<ResDetails> createState() => _ResDetailsState();
}

class _ResDetailsState extends State<ResDetails> {
  ResDetailsController controller = Get.put(ResDetailsController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResDetailsController>(
      builder: (controller) => controller.isloading
          ? Scaffold(
              body: Center(
                child: Lottie.asset("assets/lottie/l1.json",
                    width: 150, height: 150),
              ),
            )
          : Scaffold(
              appBar: AppBar(
                backgroundColor: AppColor.myprimarycolor,
                title: Text(
                  "${controller.listresbyid[0]['res_name']}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                  ),
                ),
                centerTitle: true,
                leading: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    )),
              ),
              body: controller.islol
                  ? Loading()
                  : Container(
                      child: ListView(
                        children: [
                          controller.listresbyid[0]['res_img1'] == null
                              ? Container(
                                  alignment: Alignment.center,
                                  height: 200,
                                  color: AppColor.mygrey,
                                  child: const Text(
                                    "No Images Yet",
                                    style: TextStyle(
                                        color: AppColor.myprimarycolor2,
                                        fontSize: 35),
                                  ),
                                )
                              : controller.currentimg == 1
                                  ? Container(
                                      //color: const Color.fromARGB(255, 42, 5, 5),
                                      height: 200,
                                      width: double.infinity,
                                      child: Image.network(
                                        "${AppLink.imagestatic}/${controller.listresbyid[0]['res_img1']}",
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : controller.currentimg == 2
                                      ? Container(
                                          //color: const Color.fromARGB(255, 111, 85, 166),
                                          height: 200,
                                          width: double.infinity,
                                          child: controller.listresbyid[0]
                                                      ['res_img2'] !=
                                                  null
                                              ? Image.network(
                                                  "${AppLink.imagestatic}/${controller.listresbyid[0]['res_img2']}",
                                                  fit: BoxFit.cover,
                                                )
                                              : Container(
                                                  alignment: Alignment.center,
                                                  color: AppColor.mygrey,
                                                  child: const Text(
                                                    "No Images Yet",
                                                    style: TextStyle(
                                                        color: AppColor
                                                            .myprimarycolor2,
                                                        fontSize: 35),
                                                  ),
                                                ),
                                        )
                                      : Container(
                                          //color: const Color.fromARGB(255, 7, 42, 5),
                                          height: 200,
                                          width: double.infinity,
                                          child: controller.listresbyid[0]
                                                      ['res_img3'] !=
                                                  null
                                              ? Image.network(
                                                  "${AppLink.imagestatic}/${controller.listresbyid[0]['res_img3']}",
                                                  fit: BoxFit.cover,
                                                )
                                              : Container(
                                                  alignment: Alignment.center,
                                                  color: AppColor.mygrey,
                                                  child: const Text(
                                                    "No Images Yet",
                                                    style: TextStyle(
                                                        color: AppColor
                                                            .myprimarycolor2,
                                                        fontSize: 35),
                                                  ),
                                                ),
                                        ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: Row(
                              children: [
                                controller.currentimg != 1
                                    ? IconButton(
                                        onPressed: () {
                                          controller.minus();
                                        },
                                        icon: const Icon(
                                          Icons.arrow_circle_left_outlined,
                                          color: AppColor.mygrey,
                                          size: 35,
                                        ))
                                    : Container(),
                                const Spacer(),
                                controller.currentimg != 3
                                    ? IconButton(
                                        onPressed: () {
                                          controller.plus();
                                        },
                                        icon: const Icon(
                                          Icons.arrow_circle_right_outlined,
                                          color: AppColor.mygrey,
                                          size: 35,
                                        ))
                                    : Container(),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.location_on_outlined,
                                      color: Color.fromARGB(255, 4, 45, 95),
                                      size: 35,
                                    )),
                                Text(
                                  "${controller.listresbyid[0]['res_location']}",
                                  style: const TextStyle(
                                      color: AppColor.myprimarycolor2,
                                      fontSize: 22),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.phone,
                                      color: Color.fromARGB(255, 4, 45, 95),
                                      size: 35,
                                    )),
                                Text(
                                  "${controller.listresbyid[0]['res_phone']}",
                                  style: const TextStyle(
                                      color: AppColor.myprimarycolor2,
                                      fontSize: 22),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.restaurant_menu_rounded,
                                      color: Color.fromARGB(255, 4, 45, 95),
                                      size: 35,
                                    )),
                                Text(
                                  "${controller.listresbyid[0]['res_type']}" ==
                                          "both"
                                      ? "western & eastern"
                                      : "${controller.listresbyid[0]['res_type']}",
                                  style: const TextStyle(
                                      color: AppColor.myprimarycolor2,
                                      fontSize: 22),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.table_bar_outlined,
                                      color: Color.fromARGB(255, 4, 45, 95),
                                      size: 35,
                                    )),
                                /* TweenAnimationBuilder(
                                  curve: Curves.easeInBack,
                                  tween: IntTween(
                                      begin: 0,
                                      end: controller.listresbyid[0]
                                          ['res_capacity']),
                                  duration: Duration(seconds: 1),
                                  builder: (context, value, child) {
                                    return Text(
                                      "$value tabels",
                                      style: const TextStyle(
                                          color: AppColor.myprimarycolor2,
                                          fontSize: 22),
                                    );
                                  },
                                )*/
                                Text(
                                  "${controller.listresbyid[0]['res_capacity']}",
                                  style: const TextStyle(
                                      color: AppColor.myprimarycolor2,
                                      fontSize: 22),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => const BrowseMenu(), arguments: {
                                "resid": controller.resid,
                              });
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.menu_book_outlined,
                                        color: Color.fromARGB(255, 4, 45, 95),
                                        size: 33,
                                      )),
                                  Text(
                                    "Browse menu",
                                    style: const TextStyle(
                                        color: AppColor.myprimarycolor2,
                                        fontSize: 22),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            child: DateTimePicker(
                              //  initialValue: DateTime.now().toString(),
                              dateMask: 'dd:MM:yyyy',
                              type: DateTimePickerType.date,
                              firstDate: DateTime(2024),
                              lastDate: DateTime(2030),
                              onChanged: (value) {
                                setState(() {
                                  // controller.selectedDate = DateTime.parse(value);
                                  /*  controller.selectedDate = DateTime.parse(value);*/
                                  controller.selectedDate = value;
                                  print(value);
                                  print(controller.selectedDate);
                                });
                              },
                              style: const TextStyle(
                                  color: AppColor.mygrey,
                                  fontWeight: FontWeight.bold),
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                labelText: 'Choose Date',
                                labelStyle: TextStyle(
                                    color: AppColor.myprimarycolor2,
                                    fontWeight: FontWeight.bold),
                                prefixIcon: Icon(
                                  Icons.calendar_today,
                                  color: Color.fromARGB(255, 4, 45, 95),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            child: DateTimePicker(
                              initialValue: '',
                              type: DateTimePickerType.time,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                              onChanged: (value) {
                                setState(() {
                                  //   controller.selectedTime = DateTime.parse(value);
                                  /*    controller.selectedTimestart =
                                DateTime.parse(value);*/
                                  controller.selectedTimestart = value;
                                  print(value);
                                  print(controller.selectedTimestart);
                                });
                              },
                              style: const TextStyle(
                                  color: AppColor.mygrey,
                                  fontWeight: FontWeight.bold),
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                labelText: 'Choose time',
                                labelStyle: TextStyle(
                                    color: AppColor.myprimarycolor2,
                                    fontWeight: FontWeight.bold),
                                prefixIcon: Icon(
                                  Icons.access_time,
                                  color: Color.fromARGB(255, 4, 45, 95),
                                ),
                              ),
                            ),
                          ),
                          /* Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: DateTimePicker(
                        initialValue: '',
                        type: DateTimePickerType.time,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        onChanged: (value) {
                          setState(() {
                            /*  controller.selectedTimeend = DateTime.parse(value);*/
                            controller.selectedTimeend = value;
                            print(value);
                            print(controller.selectedTimeend);
                          });
                        },
                        style: const TextStyle(
                            color: AppColor.mygrey,
                            fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                          border:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                          labelText: 'end time',
                          labelStyle: TextStyle(
                              color: AppColor.myprimarycolor2,
                              fontWeight: FontWeight.bold),
                          prefixIcon: Icon(
                            Icons.access_time,
                            color: Color.fromARGB(255, 4, 45, 95),
                          ),
                        ),
                      ),
                    ),*/
                          const SizedBox(height: 25),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            child: controller.isloadingcheck
                                ? Center(child: CircularProgressIndicator())
                                : ElevatedButton(
                                    onPressed: () {
                                      controller.checknum(
                                          "${controller.listresbyid[0]['res_phone']}");
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            AppColor.myprimarycolor2,
                                        padding: const EdgeInsets.only(
                                            left: 30,
                                            right: 30,
                                            top: 14,
                                            bottom: 14)),
                                    child: const Text("add reverse"),
                                  ),
                          ),
                        ],
                      ),
                    ),
            ),
    );
  }
}
