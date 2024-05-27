import 'package:get/get.dart';
import 'package:restaurant/core/class/crud.dart';
import 'package:restaurant/core/services/servises.dart';
import 'package:restaurant/linkapi.dart';

class BrowseMenuController extends GetxController {
  MyServices myServices = Get.find();
  Curd curd = Curd();
  bool isloading = false;
  List listproduct = [];
  var resid;

  getProduct() async {
    print("---browse menu controller get product meyhos");
    isloading = true;
    listproduct.clear();
    update();
    var response = await curd.postRequesrt(AppLink.getProduct, {
      "res_id":
          myServices.sharedPref.getString("resid").toString(), //34.toString
    });
    isloading = false;
    update();
    if (response['status'] == 'success') {
      listproduct.addAll(response['data']);
      print(listproduct);
    } else {
      print("error");
    }
    update();
  }

  getProducta(var resid) async {
    print("---browse menu controller get producta meyhos");
    isloading = true;
    listproduct.clear();
    update();
    var response = await curd.postRequesrt(AppLink.getProduct, {
      "res_id": resid.toString(), //34.toString
    });
    isloading = false;
    update();
    if (response['status'] == 'success') {
      listproduct.addAll(response['data']);
      print(listproduct);
    } else {
      print("error");
    }
    update();
  }

  //
  @override
  void onInit() {
    print("---browse menu controller on init meyhos");
    super.onInit();
    /* myServices.sharedPref.getString("type") == 0.toString
        ? getProducta(resid)
        : getProduct();*/
    resid = Get.arguments['resid'];
    print("res_id in browse menu $resid");
    print(resid.runtimeType);
    print(myServices.sharedPref.getString("type"));
    if (myServices.sharedPref.getString("type") == 0.toString()) {
      getProducta(resid);
      print("user");
    } else {
      getProduct();
      print("admin");
    }
  }
}
