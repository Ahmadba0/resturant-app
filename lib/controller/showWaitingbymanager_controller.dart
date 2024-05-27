import 'package:get/get.dart';
import 'package:restaurant/core/class/crud.dart';
import 'package:restaurant/core/services/servises.dart';
import 'package:restaurant/linkapi.dart';

class ShowWaitingByMangerController extends GetxController {
  MyServices myServices = Get.find();
  Curd curd = Curd();
  List listwaitingtoadmin = [];
  bool isloading = false;

  getwaiting() async {
    isloading = true;
    listwaitingtoadmin.clear();
    update();
    var response = await curd.postRequesrt(AppLink.showwaiting, {
      "res_phone": myServices.sharedPref.getString("phone"),
    });
    isloading = false;
    update();
    if (response['status'] == 'success') {
      listwaitingtoadmin.addAll(response['data']);
      print(listwaitingtoadmin);
    } else {
      print("no reverse");
    }
    update();
  }
  /*
  $waiting_id = filterRequest("waiting_id") ;

$revers_date = filterRequest("revers_date");
$revers_starttime =  filterRequest("revers_starttime");
$users_id = filterRequest("users_id");
$res_id = filterRequest("res_id");
$res_phone = filterRequest('res_phone');
$user_phone = filterRequest('user_phone');
*/

  movetorevers(var waitingid, var reversdate, var reversstarttime, var usersid,
      var resid, var resphone, var userphone) async {
    print(
        "---show waiting by manager controller controller move to revers methos");
    isloading = true;
    update();
    var responce = await curd.postRequesrt(AppLink.movetoreverse, {
      "waiting_id": waitingid,
      "revers_date": reversdate,
      "revers_starttime": reversstarttime,
      "users_id": usersid,
      "res_id": resid,
      "res_phone": resphone,
      "user_phone": userphone,
    });
    isloading = false;
    update();
    if (responce['status'] == 'success') {
      print("---------------------------------------");
      getwaiting();
      // Get.off(ShowWaitingByManager());
    } else {
      print("error in move to reverss");
    }
  }

  deletefromwaiting(var waitingid) async {
    print(
        "---show waiting by manager controller controller delete from waiting methos");
    isloading = true;
    var responce = await curd.postRequesrt(AppLink.deletefromwaitingbyadmin, {
      "waiting_id": waitingid,
    });
    isloading = false;
    if (responce['status'] == 'success') {
      print("---------------------------------------");
      getwaiting();
      // Get.off(ShowWaitingByManager());
    } else {
      print("error in delete from waiting");
    }
  }

  @override
  void onInit() {
    print("---show waiting by manager controller controller on init methos");
    getwaiting();
    super.onInit();
  }
}
