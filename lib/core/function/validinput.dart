import 'package:get/get.dart';

ValidInput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "Not valid username";
    }
  }

  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "Not valid email";
    }
  }

  if (type == "phonenumber") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "Not valid phonenumber";
    }
  }
  if (val.isEmpty) {
    return "Can't be empty";
  }

  if (val.length < min) {
    return "Can't be less than $min";
  }
  if (val.length > max) {
    return "Can't be more than $max";
  }
}
