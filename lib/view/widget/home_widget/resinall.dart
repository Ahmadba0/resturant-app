import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:restaurant/core/constant/color.dart';
import 'package:restaurant/view/screen/add_restaurant.dart';
import 'package:restaurant/view/widget/cummonWidget/loading.dart';

class ResStargged extends StatelessWidget {
  final int length;
  final bool isloading;
  final void Function()? onTap;
  final String src;
  final dynamic valueToStar;
  final String textName;
  final String textLoaction;
  final myservicesType;
  final void Function()? onPressedDeleteForAdmin;
  final conditionIfFav;
  final void Function()? onPressedAddFav;
  final void Function()? onPressedRemoveFav;
  const ResStargged(
      {super.key,
      required this.length,
      required this.isloading,
      this.onTap,
      required this.src,
      this.valueToStar,
      required this.textName,
      required this.textLoaction,
      this.myservicesType,
      this.onPressedDeleteForAdmin,
      this.conditionIfFav,
      this.onPressedAddFav,
      this.onPressedRemoveFav});

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 2,
      children: [
        ...List.generate(
            //  controller.allres.length,
            length,
            (index) => isloading
                //controller.isloading
                ? Loading()
                : Stack(
                    children: [
                      InkWell(
                        /* onTap: () {
                                                    Get.to(
                                                        () =>
                                                            const ResDetails(),
                                                        arguments: {
                                                          "resid": controller
                                                                  .allres[index]
                                                              ['res_id'],
                                                        });
                                                  },*/
                        onTap: onTap,
                        child: Container(
                          margin: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColor.myprimarycolor, width: 2)),
                          child: Column(
                            children: [
                              //"${linkApi.linkImage}/${controller.detailsdata[index]['policeReport_image']}"
                              /*  Image.network(
                                                            "${AppLink.imagestatic}/${controller.allres[index]['res_image']}"),*/

                              Image.network(src),
                              /* stars(
                                                            value: controller
                                                                        .allres[
                                                                    index]
                                                                ['res_rating']),*/
                              stars(
                                value: valueToStar,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "name: ",
                                    style: TextStyle(
                                        color: AppColor.mygrey, fontSize: 18),
                                  ),
                                  Text(
                                    //  "${controller.allres[index]['res_name']}",
                                    textName,
                                    style: const TextStyle(
                                        color: AppColor.myprimarycolor2,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "location: ",
                                    style: TextStyle(
                                        color: AppColor.mygrey, fontSize: 18),
                                  ),
                                  Text(
                                    //  "${controller.allres[index]['res_location']}",
                                    textLoaction,
                                    style: const TextStyle(
                                        color: AppColor.myprimarycolor2,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 25),
                            ],
                          ),
                        ),
                      ),
                      /*controller.myServices.sharedPref
                                                            .getString(
                                                                "type")*/
                      myservicesType == 2.toString()
                          ? Positioned(
                              right: 3,
                              child: IconButton(
                                  /* onPressed: () {
                                                              Get.defaultDialog(
                                                                  radius: 20,
                                                                  title:
                                                                      "Warning",
                                                                  titleStyle: const TextStyle(
                                                                      color: AppColor
                                                                          .red,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                  middleText:
                                                                      "Do you want to delete this restaurant",
                                                                  middleTextStyle:
                                                                      const TextStyle(
                                                                          color: AppColor
                                                                              .myprimarycolor),
                                                                  onCancel: () {
                                                                    //
                                                                    //
                                                                    //
                                                                    controller
                                                                        .deleteresifadmin(
                                                                            "${controller.allres[index]['res_phone']}");
                                                                    Get.offAll(
                                                                        const HomeScreen());
                                                                  },
                                                                  textCancel:
                                                                      "OK",
                                                                  buttonColor:
                                                                      AppColor
                                                                          .myprimarycolor,
                                                                  cancelTextColor:
                                                                      AppColor
                                                                          .myprimarycolor);
                                                            },*/
                                  onPressed: onPressedDeleteForAdmin,
                                  icon: const Icon(
                                    Icons.close,
                                    color: AppColor.red,
                                  )))
                          : Positioned(
                              right: 3,
                              child:
                                  /* favController.listresfavid.contains(
                                      controller.allres[index]['res_id'])*/
                                  conditionIfFav
                                      ? IconButton(
                                          onPressed: onPressedRemoveFav,
                                          icon: const Icon(
                                            Icons.favorite,
                                            color: AppColor.red,
                                          ))
                                      : IconButton(
                                          /* onPressed: () {
                                        favController.addfav(
                                            controller.allres[index]['res_id']);
                                        Get.offAll(const HomeScreen());
                                      },*/
                                          onPressed: onPressedAddFav,
                                          icon: const Icon(
                                            Icons.favorite_border,
                                            color: AppColor.red,
                                          )))
                    ],
                  ))
      ],
    );
  }
}
