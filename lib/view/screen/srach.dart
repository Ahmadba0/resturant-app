import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:restaurant/controller/searchController.dart';
import 'package:restaurant/core/constant/color.dart';
import 'package:restaurant/linkapi.dart';
import 'package:restaurant/view/screen/res_details.dart';
import 'package:restaurant/view/widget/cummonWidget/empty.dart';
import 'package:restaurant/view/widget/cummonWidget/loading.dart';
import 'package:restaurant/view/widget/cummonWidget/searchLottie.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchControllerrrrrr controller = Get.put(SearchControllerrrrrr());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<SearchControllerrrrrr>(
      builder: (controller) => Container(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: controller.formstate,
          child: ListView(
            children: [
              const SizedBox(height: 18),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                elevation: 55,
                child: TextFormField(
                  style: const TextStyle(
                      color: AppColor.myprimarycolor2,
                      fontWeight: FontWeight.bold),
                  controller: controller.searchCon,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: AppColor.myprimarycolor, width: 1.5),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: AppColor.myprimarycolor2, width: 2),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    prefixIcon: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColor.myprimarycolor,
                      ),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.changeGoSearch();
                      },
                      icon: const Icon(
                        Icons.search,
                        color: AppColor.myprimarycolor,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              controller.gosearch
                  ? controller.isloading
                      ? Loading()
                      : Container(
                          child: controller.listResSearch.isEmpty
                              ? const Empty()
                              : Column(
                                  children: [
                                    ...List.generate(
                                        controller.listResSearch.length,
                                        (index) => AnimationConfiguration
                                                .staggeredList(
                                              position: index,
                                              child: SlideAnimation(
                                                duration:
                                                    Duration(milliseconds: 600),
                                                curve: Curves.easeInBack,
                                                horizontalOffset: 100,
                                                child: FadeInAnimation(
                                                  child: InkWell(
                                                    onTap: () {
                                                      Get.to(
                                                          () =>
                                                              const ResDetails(),
                                                          arguments: {
                                                            "resid": controller
                                                                    .listResSearch[
                                                                index]['res_id'],
                                                          });
                                                    },
                                                    child: Card(
                                                      elevation: 15,
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .all(8),
                                                            child: CircleAvatar(
                                                              radius: 28,
                                                              backgroundImage:
                                                                  NetworkImage(
                                                                      "${AppLink.imagestatic}/${controller.listResSearch[index]['res_image']}"),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              width: 65),
                                                          Flexible(
                                                            fit: FlexFit.tight,
                                                            child: Column(
                                                              children: [
                                                                Text(
                                                                  "${controller.listResSearch[index]['res_name']}",
                                                                  style: const TextStyle(
                                                                      color: AppColor
                                                                          .myprimarycolor2,
                                                                      fontSize:
                                                                          20,
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .italic,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                Text(
                                                                  "${controller.listResSearch[index]['res_location']}",
                                                                  style:
                                                                      const TextStyle(
                                                                    color: AppColor
                                                                        .myprimarycolor2,
                                                                    fontSize:
                                                                        18,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              width: 55),
                                                          Text(
                                                            "${controller.listResSearch[index]['res_type']}",
                                                            style:
                                                                const TextStyle(
                                                              color: AppColor
                                                                  .mygrey,
                                                              fontSize: 18,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ))
                                  ],
                                ))
                  : Container(
                      child: const SearchLottie(),
                    )
            ],
          ),
        ),
      ),
    ));
  }
}
