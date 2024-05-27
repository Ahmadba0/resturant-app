import 'package:get/get.dart';
import 'package:restaurant/core/class/crud.dart';
import 'package:restaurant/core/services/servises.dart';
import 'package:restaurant/linkapi.dart';
import 'package:restaurant/view/screen/HomeScreen.dart';

class FavController extends GetxController {
  MyServices myServices = Get.find();
  Curd curd = Curd();
  bool isloadingfav = false;
  List listresfav = [];
  List listresfavid = [];

  addfav(var resid) async {
    print("---fav controller add fav meyhos");
    isloadingfav = true;
    update();
    var response = await curd.postRequesrt(AppLink.addfav, {
      "users_id": myServices.sharedPref.getString("id").toString(),
      "res_id": resid.toString(),
    });
    isloadingfav = false;
    update();
    if (response['status'] == 'found') {
      Get.snackbar("Warning", "Already found");
    } else {
      if (response['status'] == 'success') {
        print("---fav controller add fav meyhos  -1-");
        print("add fav");
        getfav();
        Get.off(HomeScreen());
      } else {
        print("not add fav");
      }
    }

    update();
  }

  getfav() async {
    print("---fav controller get fav meyhos");
    listresfav.clear();
    listresfavid.clear();
    isloadingfav = true;
    update();
    var response = await curd.postRequesrt(AppLink.getfav, {
      "users_id": myServices.sharedPref.getString("id").toString(),
      "users_name": myServices.sharedPref.getString("name").toString(),
    });
    isloadingfav = false;
    update();
    if (response['status'] == 'success') {
      print("---fav controller get fav meyhos -2-");
      print(response['data']);
      listresfav.addAll(response['data']);

      print(listresfav);
      for (var i = 0; i < listresfav.length; i++) {
        print("11");
        listresfavid.add(listresfav[i]['res_id']);
      }
      print(listresfavid);
    } else {
      print("not add fav");
    }
    update();
  }

  deletefav(var resid) async {
    print("---fav controller delete fav meyhos");
    isloadingfav = true;
    update();
    var response = await curd.postRequesrt(AppLink.deletefav, {
      "users_id": myServices.sharedPref.getString("id").toString(),
      "res_id": resid.toString(),
    });
    isloadingfav = false;
    update();
    if (response['status'] == 'success') {
      print("---fav controller delete fav meyhos -3-");
      print("deleted");
      getfav();
    } else {
      print("not deleted");
    }
  }

  @override
  void onInit() {
    listresfav.clear();
    print("---fav controller on init methos");
    getfav();
    super.onInit();
  }
}
