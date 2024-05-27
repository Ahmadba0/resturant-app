import 'package:get/get.dart';
import 'package:restaurant/core/class/crud.dart';
import 'package:restaurant/core/services/servises.dart';
import 'package:restaurant/linkapi.dart';

class NotificationController extends GetxController {
  MyServices myServices = Get.find();
  Curd curd = Curd();
  bool isloading = false;
  List listNotification = [];
  List listNotificationmanager = [];
  List listNotificationusers = [];

  getnot() async {
    print("---notification controller get not methos");
    isloading = true;
    update();
    listNotification.clear();
    var response = await curd.postRequesrt(AppLink.viewnotification, {
      "res_phone": myServices.sharedPref.getString("phone"),
    });
    isloading = false;
    update();
    if (response['status'] == 'success') {
      listNotification.addAll(response['data']);

      print(listNotification);
      for (var i = 0; i < listNotification.length; i++) {
        if (listNotification[i]['notification_body'] ==
                "A new reverse in your restaurant" ||
            listNotification[i]['notification_body'] ==
                "A new waiting revers in your restaurant") {
          listNotificationmanager.add(listNotification[i]);
        } else {
          listNotificationusers.add(listNotification[i]);
        }
      }
      print("manager-------------------------------");
      print(listNotificationmanager);
      print("user----------------------------------");
      print(listNotificationusers);
    } else {
      print("no notifivation");
    }
    update();
  }

  getnotuser() async {
    print("---notification controller get not user methos");
    isloading = true;
    listNotification.clear();
    update();
    var response = await curd.postRequesrt(AppLink.viewnotificationuser, {
      "users_id": myServices.sharedPref.getString("id"),
    });
    isloading = false;
    update();
    if (response['status'] == 'success') {
      listNotification.addAll(response['data']);
      print(listNotification);
      for (var i = 0; i < listNotification.length; i++) {
        if (listNotification[i]['notification_body'] ==
                "A new reverse in your restaurant" ||
            listNotification[i]['notification_body'] ==
                "A new waiting revers in your restaurant") {
          listNotificationmanager.add(listNotification[i]);
        } else {
          listNotificationusers.add(listNotification[i]);
        }
      }
      print("manager-------------------------------");
      print(listNotificationmanager);
      print("user----------------------------------");
      print(listNotificationusers);
    } else {
      print("no notifivation");
    }
    update();
  }

  @override
  void onInit() {
    print("---notification controller on init methos");
    myServices.sharedPref.getString(("type")) == 1.toString()
        ? getnot()
        : getnotuser();
    super.onInit();
  }
}
