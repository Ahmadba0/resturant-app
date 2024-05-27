import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/core/class/crud.dart';
import 'package:restaurant/core/services/servises.dart';
import 'package:restaurant/linkapi.dart';

class SearchControllerrrrrr extends GetxController {
  TextEditingController? searchCon;
  GlobalKey<FormState> formstate = GlobalKey();
  bool isloading = false;
  Curd curd = Curd();
  MyServices myServices = Get.find();
  bool gosearch = false;
  List listResSearch = [];
  changeGoSearch() {
    print("---search controller controller change go search methos");
    searchCon!.text != '' ? gosearch = true : false;
    if (searchCon!.text != '') {
      gosearch = true;
      searchres();
    } else {
      gosearch = false;
    }
    update();
    print("gosearch $gosearch");
  }

  searchres() async {
    print("---search controller controller search res methos");
    isloading = true;
    update();

    var response = await curd.postRequesrt(AppLink.search, {
      "search": searchCon!.text,
    });
    isloading = false;
    update();
    if (response['status'] == 'success') {
      listResSearch.clear();
      print(response['data']);
      listResSearch.addAll(response['data']);
      searchCon!.clear();
    } else {
      print("no res in serach");
      searchCon!.clear();
    }
    update();
  }

  @override
  void onInit() {
    print("---search controller controller on init methos");
    searchCon = TextEditingController();
    super.onInit();
  }
}
