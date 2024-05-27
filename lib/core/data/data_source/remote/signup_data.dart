import 'package:restaurant/core/class/crud1.dart';
import 'package:restaurant/linkapi.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);

  postdata(String usersname, String usersphone, String userspassword) async {
    var response = await crud.postData(AppLink.signup, {
      "user_phone": usersname,
      "users_name": usersphone,
      "users_password": userspassword,
    });
    return response.fold((l) => l, (r) => r);
  }
}
