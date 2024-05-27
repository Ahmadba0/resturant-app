import 'package:get/get.dart';
import 'package:restaurant/core/class/crud1.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
