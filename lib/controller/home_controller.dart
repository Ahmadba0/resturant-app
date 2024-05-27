import 'package:get/get.dart';
import 'package:restaurant/core/class/crud.dart';
import 'package:restaurant/core/services/servises.dart';
import 'package:restaurant/linkapi.dart';

class HomeController extends GetxController {
  int currentRes = 0;

  MyServices myServices = Get.find();
  List allres = [];
  List resbylocation = [];
  Curd curd = Curd();
  bool isloading = false;

  getallres() async {
    print("---home controller get all res methos");
    isloading = true;
    update();
    var response = await curd.postRequesrt(AppLink.getres, {});
    isloading = false;
    update();
    if (response['status'] == 'success') {
      allres.addAll(response['data']);
    } else {
      print("error");
    }
    update();
  }

  getresbylocation(var location) async {
    print("---home controller get res by location methos");
    resbylocation.clear();
    update();
    isloading = true;
    update();
    var response = await curd.postRequesrt(
        AppLink.getresbylocation, {"res_location": location.toString()});
    isloading = false;
    update();
    if (response['status'] == 'success') {
      print("yes");
      resbylocation.addAll(response['data']);
    } else {
      print("empty");
    }
    update();
  }

  deleteresifadmin(var phone, int index) async {
    print("---home controller delete res if admin methos");
    isloading = true;
    update();
    allres.removeAt(index);
    var response = await curd.postRequesrt(AppLink.deleteres,
        {"res_phone": phone.toString(), "users_phone": phone.toString()});
    isloading = false;
    update();
    if (response['status'] == 'success') {
      print("deleted res");
      getallres();
    } else {
      print("not deleted");
    }
    update();
  }

  @override
  void onInit() {
    print("---home controller on init methos");
    getallres();
    super.onInit();
  }
}
