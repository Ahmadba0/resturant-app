import 'package:get/get.dart';
import 'package:restaurant/core/class/crud.dart';
import 'package:restaurant/core/services/servises.dart';
import 'package:restaurant/linkapi.dart';

class ReversController extends GetxController {
  MyServices myServices = Get.find();
  Curd curd = Curd();
  List listreverseodusers = [];
  bool isloading = false;

  getrevers() async {
    print("---revers controller controller get revers methos");
    listreverseodusers.clear();
    isloading = true;
    update();
    var response = await curd.postRequesrt(AppLink.getrevers, {
      "users_id": myServices.sharedPref.getString("id").toString(),
    });
    isloading = false;
    update();
    if (response['status'] == 'success') {
      listreverseodusers.addAll(response['data']);
      print(listreverseodusers);
    } else {
      print("error in get revers");
    }
    update();
  }

  deletefromreversbyuser(var reversid) async {
    print("---revers controller controller delete from reverse by user methos");
    isloading = true;
    update();
    var responce = await curd.postRequesrt(AppLink.deletereversebyuser, {
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
    print("---revers controller controller on init methos");
    getrevers();
    super.onInit();
  }
}
