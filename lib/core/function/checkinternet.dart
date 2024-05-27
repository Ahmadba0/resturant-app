import 'dart:io';

import 'package:get/get.dart';

checkInterntet() async {
  try {
    var result = await InternetAddress.lookup("google.com");
    if (result.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    Get.defaultDialog(title: "check internet");
    return false;
  }
}
