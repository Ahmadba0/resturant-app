// ignore_for_file: unused_local_variable, avoid_print

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';
import 'package:restaurant/controller/revers_controller.dart';

requestPermissionNotification() async {
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmConfig() {
  FirebaseMessaging.onMessage.listen((message) {
    print("--------notification");
    print(message.notification!.title);
    print(message.notification!.body);
    FlutterRingtonePlayer.playNotification();
    Get.snackbar(message.notification!.title!, message.notification!.body!,
        duration: const Duration(seconds: 3));
    refreshPageNotification(message.data);
  });
}

refreshPageNotification(data) {
  print("--------pageid");
  print(data['pageid']);
  print("--------pagename");
  print(data['pagename']);
  print("--------currentroute");
  print(Get.currentRoute);

  if (Get.currentRoute == '/HomeScreen' && data['pagename'] == "homescreen") {
    ReversController controller = Get.find();
    controller.getrevers();
  }
  /*TestController con = Get.find();
  con.refreshDetails();*/
/*
  if (Get.currentRoute == "/DetailsBalagPolice" &&
      data['pagename'] == "refreshDetaielsPage") {
    print("--------refresh");
    DetailsController controller = Get.find();
    controller.refreshDetails();
  }*/
/*
  if (Get.currentRoute == "/TestNew" &&
      data['pagename'] == "refreshDetaielsPage") {
    print("--------refresh");
    DetailsNEWController con = Get.find();
    con.refreshDetails();
    /*PolicePageController conn = Get.find();
    conn.refreshh();*/
    /*MuniPageController connn = Get.find();
    connn.refreshh();*/
  }*/
/*
  if (Get.currentRoute == "/PolicePage" &&
      data['pagename'] == "refreshDetaielsPage") {
    print("--------refresh");
    PolicePageController con = Get.find();
    con.refreshh();
  }*/
/*
  if (Get.currentRoute == "/MuniPage" &&
      data['pagename'] == "refreshDetaielsPage") {
    print("--------refresh");
    MuniPageController con = Get.find();
    con.refreshh();
  }*/
}
