import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:restaurant/controller/brrowse_menu_controller.dart';
import 'package:restaurant/core/constant/color.dart';
import 'package:restaurant/linkapi.dart';
import 'package:restaurant/view/widget/cummonWidget/empty.dart';
import 'package:restaurant/view/widget/cummonWidget/loading.dart';

class BrowseMenu extends StatefulWidget {
  const BrowseMenu({super.key});

  @override
  State<BrowseMenu> createState() => _BrowseMenuState();
}

class _BrowseMenuState extends State<BrowseMenu> {
  BrowseMenuController controller = Get.put(BrowseMenuController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.myprimarycolor,
          title: const Text(
            "Browse Menu",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              )),
        ),
        body: GetBuilder<BrowseMenuController>(
          builder: (controller) => controller.isloading
              ? const Loading()
              : controller.listproduct.isEmpty
                  ? const Empty()
                  : Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      child: StaggeredGrid.count(
                        crossAxisCount: 2,
                        children: [
                          ...List.generate(
                              controller.listproduct.length,
                              (index) => InkWell(
                                    child: Container(
                                      margin: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColor.myprimarycolor,
                                              width: 2)),
                                      child: Column(
                                        children: [
                                          Image.network(
                                              "${AppLink.imagestatic}/${controller.listproduct[index]['product_image']}"),
                                          const SizedBox(height: 8),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const SizedBox(width: 10),
                                              const Text(
                                                "Name: ",
                                                style: TextStyle(
                                                    color: AppColor.mygrey,
                                                    fontSize: 15),
                                              ),
                                              Flexible(
                                                fit: FlexFit.tight,
                                                child: Text(
                                                  /*"${controller.allres[index]['res_name']}",*/
                                                  "${controller.listproduct[index]['product_name']}",
                                                  style: const TextStyle(
                                                      color: AppColor
                                                          .myprimarycolor2,
                                                      fontSize: 17),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 8),
                                            color: AppColor.mygrey,
                                            height: 1,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const SizedBox(width: 10),
                                              const Text(
                                                "Note: ",
                                                style: TextStyle(
                                                    color: AppColor.mygrey,
                                                    fontSize: 15,
                                                    letterSpacing: 1.5),
                                              ),
                                              Flexible(
                                                fit: FlexFit.tight,
                                                child: Text(
                                                  /*"${controller.allres[index]['res_name']}",*/
                                                  "${controller.listproduct[index]['product_note']}",
                                                  style: const TextStyle(
                                                      color: AppColor
                                                          .myprimarycolor2,
                                                      fontSize: 17),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 8),
                                            color: AppColor.mygrey,
                                            height: 1,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const SizedBox(width: 10),
                                              const Text(
                                                "Price: ",
                                                style: TextStyle(
                                                    color: AppColor.mygrey,
                                                    fontSize: 15,
                                                    letterSpacing: 1),
                                              ),
                                              Flexible(
                                                fit: FlexFit.tight,
                                                child: Text(
                                                  /*"${controller.allres[index]['res_name']}",*/
                                                  "${controller.listproduct[index]['product_price']}",
                                                  style: const TextStyle(
                                                      color: AppColor
                                                          .myprimarycolor2,
                                                      fontSize: 17),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 15),
                                        ],
                                      ),
                                    ),
                                  ))
                        ],
                      ),
                    ),
        ));
  }
}
