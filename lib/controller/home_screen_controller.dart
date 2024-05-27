import 'package:get/get.dart';
import 'package:restaurant/core/class/crud.dart';
import 'package:restaurant/core/services/servises.dart';

class HomeScreenController extends GetxController {
  int currentindex = 0;
  MyServices myServices = Get.find();
  Curd curd = Curd();
  /* var usersimg;
  bool isloading = false;

  getusersdata() async {
    isloading = true;
    var response = await curd.postRequesrt(AppLink.getusersdata, {
      "users_id": myServices.sharedPref.getString("id"),
    });
    isloading = false;
    if (response['status'] == 'success') {
      usersimg = response['data']['users_image'];
      print(usersimg);
    } else {}
  }*/

  @override
  void onInit() {
    print("---home screen controller on init methos");
    super.onInit();
  }
}
