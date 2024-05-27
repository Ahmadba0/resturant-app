// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurant/core/class/crud.dart';
import 'package:restaurant/core/services/servises.dart';
import 'package:restaurant/linkapi.dart';

class ResProfileController extends GetxController {
  var resid;
  var i;
  var ii;
  var iii;
  File? myfilei;
  File? myfileii;
  File? myfileiii;
  bool lolo = false;
  GlobalKey<FormState> formstate = GlobalKey();
  List resinfo = [];
  MyServices myServices = Get.find();
  bool isloading = false;
  Curd curd = Curd();
  var type;
  var location;
  var valuee;
  var valuee1;
  var sumimg = 0;
  var currentimg = 1;
  bool isloading1 = false;
  TextEditingController? resnameCon;
  bool isloading2 = false;
  TextEditingController? resphoneCon;
  bool isloading3 = false;
  bool isloading4 = false;
  bool isloading5 = false;
  TextEditingController? rescapacityCon;

  List itemtype = ["eastern", "western", "both"];
  List itemlocation = ["Damas", "Ref Damas", "Homs", "Aleppo", "Latakia"];

  onchangedtype(var value) {
    type = null;
    type = value;
    update();
    print("type: $type");
  }

  onchangedlocatoin(var value) {
    location = null;
    location = value;
    update();
    print("location: $location");
  }

  getinfores() async {
    print("---res profile controller get info res methos");
    resinfo.clear();
    isloading = true;
    update();
    var response = await curd.postRequesrt(AppLink.getinfores,
        {"res_phone": myServices.sharedPref.getString("phone").toString()});
    isloading = false;
    update();
    if (response['status'] == 'success') {
      print(response['data']);

      resinfo.addAll(response['data']);
      myServices.sharedPref.setString("resid", "${resinfo[0]['res_id']}");
      print("resid: ${myServices.sharedPref.getString("resid")}");
      print("*****************************************************");
      print(resinfo[0]['res_img1']);
      print(resinfo[0]['res_img2']);
      print(resinfo[0]['res_img3']);
      i = resinfo[0]['res_img1'];
      ii = resinfo[0]['res_img2'];
      iii = resinfo[0]['res_img3'];
      print(i);
      print(ii);
      print(iii);
      print("*****************************************************");
      if (resinfo[0]['res_img3'] != null) {
        sumimg = 3;
      } else if (resinfo[0]['res_img2'] != null) {
        sumimg = 2;
      } else if (resinfo[0]['res_img1'] != null) {
        sumimg = 1;
      } else {
        sumimg = 0;
      }

      print("sumimg $sumimg");

      resid = resinfo[0]['res_id'];
      myServices.sharedPref.setString("resid", resid.toString());
    } else {
      print("empty");
    }
    update();
  }

  plus() {
    if (currentimg == 3) {
      currentimg = 3;
    } else {
      currentimg = currentimg + 1;
    }
    print("current image $currentimg");
    update();
  }

  mins() {
    if (currentimg == 1) {
      currentimg = 1;
    } else {
      currentimg = currentimg - 1;
    }
    print("current image $currentimg");
    update();
  }

  updatenameres() async {
    print("---res profile controller update name res methos");
    isloading1 = true;
    update();
    var response = await curd.postRequesrt(AppLink.updatenameres, {
      "res_id": resid.toString(),
      "res_name": resnameCon!.text,
    });
    isloading1 = false;
    update();
    if (response['status'] == 'success') {
      Get.back();
      resinfo.clear();
      getinfores();
    } else {
      print("error");
    }
    update();
  }

  updatephoneres() async {
    print("---res profile controller update phone res methos");
    isloading1 = true;
    update();
    var response = await curd.postRequesrt(AppLink.updatephoneres, {
      "res_id": resid.toString(),
      "res_phone": resphoneCon!.text,
      "users_id": myServices.sharedPref.getString("id").toString()
    });
    isloading2 = false;
    update();
    if (response['status'] == 'success') {
      var id = myServices.sharedPref.getString("id");
      var name = myServices.sharedPref.getString("name");
      var type = myServices.sharedPref.getString("type");
      myServices.sharedPref.clear();
      myServices.sharedPref.setString("id", id.toString());
      myServices.sharedPref.setString("name", name.toString());
      myServices.sharedPref.setString("phone", resphoneCon!.text);
      myServices.sharedPref.setString("type", type.toString());
      print(myServices.sharedPref.getString("phone"));
      Get.back();
      resinfo.clear();
      getinfores();
    } else {
      print("error");
    }
    update();
  }

  updatetyperes() async {
    print("---res profile controller update type res methos");
    isloading3 = true;
    update();
    var response = await curd.postRequesrt(AppLink.updatetyperes, {
      "res_id": resid.toString(),
      "res_type": type,
    });
    isloading3 = false;
    update();
    if (response['status'] == 'success') {
      Get.back();
      resinfo.clear();
      getinfores();
    } else {
      print("error");
    }
    update();
  }

  updatelocationres() async {
    print("---res profile controller update location res methos");
    isloading4 = true;
    update();
    var response = await curd.postRequesrt(AppLink.updatelocationres, {
      "res_id": resid.toString(),
      "res_location": location,
    });
    isloading4 = false;
    update();
    if (response['status'] == 'success') {
      Get.back();
      resinfo.clear();
      getinfores();
    } else {
      print("error");
    }
    update();
  }

  updatecapacityres() async {
    print("---res profile controller update capacity res methos");
    isloading4 = true;
    update();
    var response = await curd.postRequesrt(AppLink.updatecapacityres, {
      "res_id": resid.toString(),
      "res_capacity": rescapacityCon!.text,
    });
    isloading5 = false;
    update();
    if (response['status'] == 'success') {
      Get.back();
      resinfo.clear();
      getinfores();
    } else {
      print("error");
    }
    update();
  }

  addImageGalleryi() async {
    print("---res profile controller add image gallery i methos");
    lolo = true;
    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    //Get.back();
    print(xfile);
    if (xfile != null) {
      i = null;
      myfilei = null;
      myfilei = File(xfile.path);
    } else {}
    if (myfilei == null) {
      Get.back();
    } else {
      var response = await postRequsetWithFile(
          AppLink.addimg1,
          {
            "res_id": myServices.sharedPref.getString("resid"),
          },
          myfilei!);
      //Get.to(ProfilePage());
      if (response["status"] == "success") {
        getinfores();

        print("--add img");

        Timer(const Duration(seconds: 5), () {
          lolo = false;
          print("lolo $lolo");
          update();
        });
      } else {
        print("sss");
      }
    }
    update();
  }

  addImageGalleryii() async {
    print("---res profile controller add image gallery ii methos");
    lolo = true;
    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    //Get.back();
    print(xfile);
    if (xfile != null) {
      ii = null;
      myfileii = null;
      myfileii = File(xfile.path);
    } else {}
    if (myfileii == null) {
      Get.back();
    } else {
      var response = await postRequsetWithFile(
          AppLink.addimg2,
          {
            "res_id": myServices.sharedPref.getString("resid"),
          },
          myfileii!);
      //Get.to(ProfilePage());
      if (response["status"] == "success") {
        getinfores();

        print("--add img");

        Timer(const Duration(seconds: 5), () {
          lolo = false;
          print("lolo $lolo");
          update();
        });
      } else {
        print("sss");
      }
    }
    update();
  }

  addImageGalleryiii() async {
    print("---res profile controller add image gallery iii methos");
    lolo = true;
    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    //Get.back();
    print(xfile);
    if (xfile != null) {
      iii = null;
      myfileiii = null;
      myfileiii = File(xfile.path);
    } else {}
    if (myfileiii == null) {
      Get.back();
    } else {
      var response = await postRequsetWithFile(
          AppLink.addimg3,
          {
            "res_id": myServices.sharedPref.getString("resid"),
          },
          myfileiii!);
      //Get.to(ProfilePage());
      if (response["status"] == "success") {
        getinfores();

        print("--add img");

        Timer(const Duration(seconds: 5), () {
          lolo = false;
          print("lolo $lolo");
          update();
        });
      } else {
        print("sss");
      }
    }
    update();
  }

  @override
  void onInit() {
    print("---res profile controller on init methos");
    getinfores();
    print("ssss");
    resnameCon = TextEditingController();
    resphoneCon = TextEditingController();
    rescapacityCon = TextEditingController();
    super.onInit();
  }
}
