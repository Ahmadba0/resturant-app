// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:restaurant/controller/add_product_controller.dart';
import 'package:restaurant/core/constant/color.dart';
import 'package:restaurant/core/function/getdefaultdialog.dart';
import 'package:restaurant/linkapi.dart';
import 'package:restaurant/view/widget/cummonWidget/empty.dart';
import 'package:restaurant/view/widget/cummonWidget/loading.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  AddProductController controller = Get.put(AddProductController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.myprimarycolor,
          title: const Text(
            "Products",
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
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(const AddPro());
                  controller.clearData();
                },
                icon: const Icon(
                  Icons.add,
                  size: 30,
                )),
            const SizedBox(width: 8)
          ],
        ),
        body: controller.isloading
            ? Loading()
            : controller.listproduct.isEmpty
                ? Empty()
                : Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: ListView(
                      children: [
                        StaggeredGrid.count(
                          crossAxisCount: 2,
                          children: [
                            ...List.generate(
                                controller.listproduct.length,
                                (index) => InkWell(
                                      onLongPress: () {
                                        getdialog(
                                            "Warning",
                                            "Delete this product",
                                            "Ok",
                                            "Cancel", () {
                                          controller.deleteProduct(
                                              "${controller.listproduct[index]['product_id']}");
                                          Get.back();
                                        }, () {});
                                      },
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
                                                SizedBox(width: 10),
                                                Text(
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
                                                    style: TextStyle(
                                                        color: AppColor
                                                            .myprimarycolor2,
                                                        fontSize: 17),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              color: AppColor.mygrey,
                                              height: 1,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SizedBox(width: 10),
                                                Text(
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
                                                    style: TextStyle(
                                                        color: AppColor
                                                            .myprimarycolor2,
                                                        fontSize: 17),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              color: AppColor.mygrey,
                                              height: 1,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SizedBox(width: 10),
                                                Text(
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
                                                    style: TextStyle(
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
                      ],
                    ),
                  ),
      ),
    );
  }
}

class AddPro extends StatefulWidget {
  const AddPro({super.key});

  @override
  State<AddPro> createState() => _AddProState();
}

class _AddProState extends State<AddPro> {
  @override
  Widget build(BuildContext context) {
    Get.put(AddProductController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.myprimarycolor,
        title: const Text(
          " Add Products",
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
      body: GetBuilder<AddProductController>(
        builder: (controller) => controller.isloading
            ? Loading()
            : Container(
                padding: const EdgeInsets.only(right: 20, left: 20),
                // width: Get.width / 1.2,
                height: double.infinity,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Form(
                      key: controller.formState,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              const Expanded(flex: 1, child: Text("Name: ")),
                              Expanded(
                                  flex: 5,
                                  child: Container(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: TextFormField(
                                      controller: controller.nameController,
                                      decoration: const InputDecoration(
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 2,
                                                  color: AppColor
                                                      .myprimarycolor))),
                                    ),
                                  ))
                            ],
                          ),
                          Row(
                            children: [
                              const Expanded(flex: 1, child: Text("Note: ")),
                              Expanded(
                                  flex: 5,
                                  child: Container(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: TextFormField(
                                      controller: controller.noteController,
                                      decoration: const InputDecoration(
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 2,
                                                  color: AppColor
                                                      .myprimarycolor))),
                                    ),
                                  ))
                            ],
                          ),
                          Row(
                            children: [
                              const Expanded(flex: 1, child: Text("Price: ")),
                              Expanded(
                                  flex: 5,
                                  child: Container(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: TextFormField(
                                      controller: controller.priceController,
                                      decoration: const InputDecoration(
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 2,
                                                  color: AppColor
                                                      .myprimarycolor))),
                                    ),
                                  ))
                            ],
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton.icon(
                            onPressed: () => controller.addImageGallery(),
                            icon: const Icon(Icons.camera),
                            label: const Text("Add Image"),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.myprimarycolor),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            child: controller.myfile != null
                                ? Container(
                                    width: 290,
                                    height: 200,
                                    child: Image.file(
                                      controller.myfile!,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : null,
                          ),
                          const SizedBox(height: 40),
                          ElevatedButton(
                            onPressed: () => controller.addProduct(),
                            child: const Text("Add Product"),
                            style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 100),
                                backgroundColor: AppColor.myprimarycolor),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
