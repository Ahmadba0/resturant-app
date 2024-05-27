import 'package:get/get.dart';
import 'package:restaurant/core/function/checkinternet.dart';
import 'package:restaurant/core/function/fcm.dart';

class MainController extends GetxController {
  @override
  void onInit() {
    print("---main controller on init methos");
    //checkXamppStatus();
    checkInterntet();
    fcmConfig();
    requestPermissionNotification();
    super.onInit();
  }
}
