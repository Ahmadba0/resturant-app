// ignore_for_file: sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/controller/fav_controller.dart';
import 'package:restaurant/controller/home_screen_controller.dart';
import 'package:restaurant/controller/profileController.dart';
import 'package:restaurant/controller/revers_controller.dart';
import 'package:restaurant/core/constant/color.dart';
import 'package:restaurant/view/screen/Home.dart';
import 'package:restaurant/view/screen/add_restaurant.dart';
import 'package:restaurant/view/screen/favourite.dart';
import 'package:restaurant/view/screen/profile.dart';
import 'package:restaurant/view/screen/res_profile.dart';
import 'package:restaurant/view/screen/reserve.dart';
import 'package:restaurant/view/widget/home_screen_widget/custom_button_nav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenController controller = Get.put(HomeScreenController());
  //ResProfileController resProfileController = Get.put(ResProfileController());
  ProfileController profileController = Get.put(ProfileController());
  ReversController reversController = Get.put(ReversController());
  FavController favController = Get.put(FavController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
      builder: (controller) => Scaffold(
        body: controller.currentindex == 0
            ? const Home()
            : controller.currentindex == 1
                ? const Reserve()
                : controller.currentindex == 2
                    ? const Profile()
                    : const Favoutite(),
        //
        //
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        //
        //
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.myprimarycolor,
          onPressed: () {
            controller.myServices.sharedPref.getString("type") == 2.toString()
                ? Get.to(() => const AddRestaurant())
                : controller.myServices.sharedPref.getString("type") ==
                        1.toString()
                    ? Get.to(() => const ResProfile())
                    : null;
          },
          child: Icon(
            controller.myServices.sharedPref.getString("type") == 2.toString()
                ? Icons.add
                : Icons.restaurant,
            size: 35,
          ),
        ),
        //
        //
        bottomNavigationBar: BottomAppBar(
            notchMargin: 10,
            shape: const CircularNotchedRectangle(),
            elevation: 5,
            color: AppColor.myprimarycolor,
            child: Container(
              height: 60,
              child: Row(
                children: [
                  controller.myServices.sharedPref.getString("type") ==
                          2.toString()
                      ? const SizedBox(width: 70)
                      : const SizedBox(width: 18),
                  //
                  //
                  //
                  CustomButtonNav(
                    onTap: () {
                      controller.currentindex = 0;
                      setState(() {});
                      Get.offAll(HomeScreen());
                    },
                    text: "Home",
                    icon: Icons.home,
                    color: controller.currentindex == 0
                        ? AppColor.myprimarycolor3
                        : Colors.white,
                  ),
                  //
                  //
                  //
                  const SizedBox(width: 30),
                  //
                  //
                  //
                  controller.myServices.sharedPref.getString("type") ==
                          2.toString()
                      ? Container()
                      : CustomButtonNav(
                          onTap: () {
                            controller.currentindex = 1;
                            setState(() {});
                            reversController.getrevers();
                            print(controller.currentindex);
                          },
                          text: "Reserve",
                          icon: Icons.table_restaurant_outlined,
                          color: controller.currentindex == 1
                              ? AppColor.myprimarycolor3
                              : Colors.white,
                        ),
                  //
                  //
                  //
                  controller.myServices.sharedPref.getString("type") ==
                          2.toString()
                      ? const SizedBox(width: 150)
                      : const SizedBox(width: 115),
                  //
                  //
                  //
                  CustomButtonNav(
                    onTap: () {
                      controller.currentindex = 2;
                      setState(() {
                        profileController.getusersdata();
                      });
                    },
                    text: "Profile",
                    icon: Icons.person_3_outlined,
                    color: controller.currentindex == 2
                        ? AppColor.myprimarycolor3
                        : Colors.white,
                  ),
                  //
                  //
                  //
                  const SizedBox(width: 30),
                  //
                  //
                  //
                  controller.myServices.sharedPref.getString("type") ==
                          2.toString()
                      ? Container()
                      : CustomButtonNav(
                          onTap: () {
                            controller.currentindex = 3;
                            setState(() {});
                            favController.getfav();
                          },
                          text: "Favourite",
                          icon: Icons.favorite,
                          color: controller.currentindex == 3
                              ? AppColor.myprimarycolor3
                              : Colors.white,
                        )
                  //
                  //
                  //
                ],
              ),
            )),
      ),
    );
  }
}
