import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurant/core/class/crud.dart';
import 'package:restaurant/core/constant/color.dart';
import 'package:restaurant/core/services/servises.dart';
import 'package:restaurant/linkapi.dart';

class AddProductController extends GetxController {
  MyServices myServices = Get.find();
  Curd curd = Curd();
  bool isloading = false;
  TextEditingController? nameController;
  TextEditingController? noteController;
  TextEditingController? priceController;
  List listproduct = [];
  File? myfile;
  GlobalKey<FormState> formState = GlobalKey();
  var res_id;

  clearData() {
    print("---add product controller clear data meyhos");
    myfile = null;
    nameController!.clear();
    noteController!.clear();
    priceController!.clear();
    update();
  }

  addImageGallery() async {
    print("---add product controller add Image Gallery meyhos");
    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    // Get.back();
    update();
    print(xfile);
    if (xfile != null) {
      myfile = File(xfile.path);
    } else {}
    update();
    print("myfile $myfile");
  }

  addProduct() async {
    print("---add product controller add product meyhos");
    if (myfile != null) {
      if (formState.currentState!.validate()) {
        isloading = true;
        update();
        var response = await postRequsetWithFile(
            AppLink.addProduct,
            {
              "product_name": nameController!.text,
              "product_note": noteController!.text,
              "product_price": priceController!.text,
              "res_id": res_id,
            },
            myfile!);

        isloading = false;
        update();
        if (response['status'] == 'success') {
          getProduct();
          Get.back();
        } else {
          Get.defaultDialog(
              radius: 20,
              title: "ERROR",
              titleStyle: const TextStyle(
                  color: AppColor.red, fontWeight: FontWeight.bold),
              middleText: "Check your information",
              middleTextStyle: const TextStyle(color: AppColor.myprimarycolor),
              onCancel: () {},
              textCancel: "OK",
              buttonColor: AppColor.myprimarycolor,
              cancelTextColor: AppColor.myprimarycolor);
        }
      }
    } else {
      Get.defaultDialog(
          radius: 20,
          title: "ERROR",
          titleStyle:
              const TextStyle(color: AppColor.red, fontWeight: FontWeight.bold),
          middleText: "add image ",
          middleTextStyle: const TextStyle(color: AppColor.myprimarycolor),
          onCancel: () {},
          textCancel: "OK",
          buttonColor: AppColor.myprimarycolor,
          cancelTextColor: AppColor.myprimarycolor);
    }
    update();
  }

  getProduct() async {
    print("---add product controller get product meyhos");
    isloading = true;
    listproduct.clear();
    var response = await curd.postRequesrt(AppLink.getProduct, {
      "res_id": myServices.sharedPref.getString("resid"), //34.toString
    });
    isloading = false;
    if (response['status'] == 'success') {
      listproduct.addAll(response['data']);
      print(listproduct);
    } else {
      print("error");
    }
    update();
  }

  deleteProduct(String productid) async {
    print("---add product controller delete product meyhos");
    isloading = true;
    var response = await curd.postRequesrt(AppLink.deleteProduct, {
      "product_id": productid,
    });
    if (response['status'] == 'success') {
      print("deleted product");
      getProduct();
    } else {
      print("not deleted product");
    }
    update();
  }

  //
  @override
  void onInit() {
    print("---add product controller on Init meyhos");
    super.onInit();
    getProduct();
    res_id = Get.arguments['res_id'];
    print("res_id $res_id");
    print(res_id.runtimeType);
    nameController = TextEditingController();
    noteController = TextEditingController();
    priceController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameController!.dispose();
    noteController!.dispose();
    priceController!.dispose();
  }
}
