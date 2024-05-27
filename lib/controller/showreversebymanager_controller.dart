import 'package:get/get.dart';
import 'package:restaurant/core/class/crud.dart';
import 'package:restaurant/core/services/servises.dart';
import 'package:restaurant/linkapi.dart';

class ShowReversByMangerController extends GetxController {
  MyServices myServices = Get.find();
  Curd curd = Curd();
  List listreversetoadmin = [];
  bool isloading = false;

  getrevers() async {
    print("---show revers by manager controller controller get revers methos");
    isloading = true;
    listreversetoadmin.clear();
    update();
    var response = await curd.postRequesrt(AppLink.showreversbyadmin, {
      "res_phone": myServices.sharedPref.getString("phone"),
    });
    isloading = false;
    update();
    if (response['status'] == 'success') {
      listreversetoadmin.addAll(response['data']);
      print(listreversetoadmin);
    } else {
      print("no reverse");
    }
    update();
  }

  deletefromrevers(var reversid) async {
    print(
        "---show revers by manager controller controller delete from revers methos");
    isloading = true;
    update();
    var responce = await curd.postRequesrt(AppLink.deletefromreversbyadmin, {
      "revers_id": reversid,
    });
    isloading = false;
    update();
    if (responce['status'] == 'success') {
      print("---------------------------------------");
      getrevers();
      // Get.off(ShowWaitingByManager());
    } else {
      print("error in delete from revers");
    }
  }

  @override
  void onInit() {
    print("---show revers by manager controller controller on init methos");
    getrevers();
    super.onInit();
  }
}
