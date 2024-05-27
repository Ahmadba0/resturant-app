import 'package:restaurant/core/class/statusRequest.dart';

handkingData(response) {
  if (response is StatusRequest) {
    return response;
  } else {
    return StatusRequest.success;
  }
}
