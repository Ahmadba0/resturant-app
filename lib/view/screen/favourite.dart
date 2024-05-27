import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant/controller/fav_controller.dart';
import 'package:restaurant/core/constant/color.dart';
import 'package:restaurant/core/function/alertexitApp.dart';
import 'package:restaurant/linkapi.dart';
import 'package:restaurant/view/screen/HomeScreen.dart';
import 'package:restaurant/view/screen/add_restaurant.dart';
import 'package:restaurant/view/screen/res_details.dart';
import 'package:restaurant/view/widget/cummonWidget/loading.dart';

class Favoutite extends StatefulWidget {
  const Favoutite({super.key});

  @override
  State<Favoutite> createState() => _FavoutiteState();
}

class _FavoutiteState extends State<Favoutite> {
  FavController controller = Get.put(FavController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: GetBack,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.myprimarycolor,
            title: const Text(
              "Favorite",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 20,
              ),
            ),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Get.offAll(HomeScreen());
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                )),
          ),
          body: GetBuilder<FavController>(
            builder: (controller) => Container(
              padding: const EdgeInsets.all(10),
              child: controller.isloadingfav
                  ? Loading()
                  : ListView(
                      children: [
                        StaggeredGrid.count(
                          crossAxisCount: 2,
                          children: [
                            ...List.generate(
                                controller.listresfav.length,
                                (index) => controller.isloadingfav
                                    ? Center(
                                        child: Lottie.asset(
                                            "assets/lottie/l1.json",
                                            width: 150,
                                            height: 150),
                                      )
                                    : AnimationConfiguration.staggeredList(
                                        position: index,
                                        child: SlideAnimation(
                                          duration: Duration(milliseconds: 600),
                                          curve: Curves.easeInBack,
                                          verticalOffset: 100,
                                          child: FadeInAnimation(
                                            child: Stack(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Get.to(
                                                        () =>
                                                            const ResDetails(),
                                                        arguments: {
                                                          "resid": controller
                                                                  .listresfav[
                                                              index]['res_id'],
                                                        });
                                                  },
                                                  child: Container(
                                                    margin:
                                                        const EdgeInsets.all(3),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: AppColor
                                                                .myprimarycolor,
                                                            width: 2)),
                                                    child: Column(
                                                      children: [
                                                        Image.network(
                                                            "${AppLink.imagestatic}/${controller.listresfav[index]['res_image']}"),
                                                        stars(
                                                            value: controller
                                                                        .listresfav[
                                                                    index]
                                                                ['res_rating']),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            const Text(
                                                              "name: ",
                                                              style: TextStyle(
                                                                  color: AppColor
                                                                      .mygrey,
                                                                  fontSize: 18),
                                                            ),
                                                            Text(
                                                              "${controller.listresfav[index]['res_name']}",
                                                              style: const TextStyle(
                                                                  color: AppColor
                                                                      .myprimarycolor2,
                                                                  fontSize: 18),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            const Text(
                                                              "location: ",
                                                              style: TextStyle(
                                                                  color: AppColor
                                                                      .mygrey,
                                                                  fontSize: 18),
                                                            ),
                                                            Text(
                                                              "${controller.listresfav[index]['res_location']}",
                                                              style: const TextStyle(
                                                                  color: AppColor
                                                                      .myprimarycolor2,
                                                                  fontSize: 18),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                            height: 25),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                    right: 3,
                                                    child: IconButton(
                                                        onPressed: () {
                                                          controller.deletefav(
                                                              "${controller.listresfav[index]['res_id']}");
                                                        },
                                                        icon: const Icon(
                                                          Icons.favorite,
                                                          color: AppColor.red,
                                                        )))
                                              ],
                                            ),
                                          ),
                                        ),
                                      ))
                          ],
                        ),
                      ],
                    ),
            ),
          )),
    );
  }
}
