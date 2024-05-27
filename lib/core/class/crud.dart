// ignore_for_file: avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as p;

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:restaurant/core/constant/color.dart';

class Curd {
  getRequesrt(String url) async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        return responsebody;
      } else {
        print("Error ${response.statusCode}");
      }
    } catch (e) {
      print("Error catch $e");
    }
  }

  postRequesrt(String url, Map data) async {
    try {
      var response = await http.post(Uri.parse(url), body: data);
      if (response.statusCode == 200) {
        print("response status code ${response.statusCode}");
        var responsebody = jsonDecode(response.body);
        return responsebody;
      } else {
        Get.defaultDialog(
            radius: 20,
            title: "ERROR",
            titleStyle:
                TextStyle(color: AppColor.red, fontWeight: FontWeight.bold),
            middleText: "status code",
            middleTextStyle: TextStyle(color: AppColor.myprimarycolor),
            onCancel: () {},
            textCancel: "OK",
            buttonColor: AppColor.myprimarycolor,
            cancelTextColor: AppColor.myprimarycolor);
        print("Error Post Req ${response.statusCode}");
      }
    } catch (e) {
      /*  Get.defaultDialog(
          radius: 20,
          title: "تنبيه",
          titleStyle:
              TextStyle(color: AppColor.red, fontWeight: FontWeight.bold),
          middleText: "اتصالك بالإنترنت ضعيف يرجى إعادة المحاولة",
          middleTextStyle: TextStyle(color: AppColor.myprimarycolor),
          onCancel: () {
            exit(0);
          },
          textCancel: "OK",
          buttonColor: AppColor.myprimarycolor,
          cancelTextColor: AppColor.myprimarycolor);*/
      print("Error catch AA $e");
    }
  }
}

postRequsetWithFile(String url, Map data, File file) async {
  try {
    var request = http.MultipartRequest("POST", Uri.parse(url));

    var length = await file.length();

    var stream = http.ByteStream(file.openRead());

    var multiPartFile = http.MultipartFile("file", stream, length,
        filename: p.basename(file.path));

    request.files.add(multiPartFile);

    data.forEach((key, value) {
      request.fields[key] = value;
    });

    var myrequest = await request.send();

    var response = await http.Response.fromStream(myrequest);

    if (myrequest.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print("Error Post Req With File ${myrequest.statusCode}");
    }
  } catch (e) {
    print("Error catch AA $e");
  }
}
