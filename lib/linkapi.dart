class AppLink {
  static const String server = "https://bayan001.000webhostapp.com/restaurant1";
  //static const String server = "http://192.168.1.3/restaurant";
  static const String test = "$server/test.php";

  //images
  static const String imagestatic = "$server/upload";

  //auth
  static const String signup = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String verifycodeSignup = "$server/auth/verifycode_signup.php";
  static const String resetPassword = "$server/auth/reset_password.php";
  static const String checkPassword = "$server/auth/check_password.php";
  static const String delete = "$server/auth/deleteall.php";

  //admin
  static const String addres = "$server/admin/addres.php";
  static const String signupres = "$server/admin//signupres.php";
  static const String deleteres = "$server/admin//deleteres.php";

  //res
  static const String getres = "$server/res/getres.php";
  static const String getresbylocation = "$server/res/getresbylocation.php";
  static const String getresbyid = "$server/res/getresbyid.php";
  static const String search = "$server/res/search.php";
  static const String viewnotification = "$server/res/viewnotification.php";
  static const String viewnotificationuser =
      "$server/res/viewnotificationuser.php";

  //manager
  static const String getinfores = "$server/manager/getinfores.php";
  static const String updatenameres = "$server/manager/updatenameres.php";
  static const String updatephoneres = "$server/manager/updatephoneres.php";
  static const String updatetyperes = "$server/manager/updatetyperes.php";
  static const String updatelocationres =
      "$server/manager/updatelocationres.php";
  static const String updatecapacityres =
      "$server/manager/updatecapacityres.php";
  static const String addimg1 = "$server/manager/addimg1.php";
  static const String addimg2 = "$server/manager/addimg2.php";
  static const String addimg3 = "$server/manager/addimg3.php";
  static const String showreversbyadmin = "$server/manager/showrevers.php";
  static const String showwaiting = "$server/manager/showwaiting.php";
  static const String movetoreverse = "$server/manager/movetoreverse.php";
  static const String deletefromwaitingbyadmin =
      "$server/manager/deletefromwaiting.php";
  static const String deletefromreversbyadmin =
      "$server/manager/deletefromrevers.php";

  //profile
  static const String updatephoneprofile =
      "$server/profile/updatephoneprofile.php";
  static const String updatenameprofile =
      "$server/profile/updatenameprofile.php";
  static const String addimgprofile = "$server/profile/addimgprofile.php";
  static const String getusersdata = "$server/profile/getusersdata.php";

  //revers
  static const String addrevers = "$server/revers/add.php";
  static const String checknum = "$server/revers/checknum.php";
  static const String getrevers = "$server/revers/getrevers.php";
  static const String addinwaiting = "$server/revers/addinwaiting.php";
  static const String deletereversebyuser =
      "$server/revers/deletereversebyuser.php";

  //fav
  static const String addfav = "$server/fav/add.php";
  static const String getfav = "$server/fav/get.php";
  static const String deletefav = "$server/fav/delete.php";

  //product
  static const String addProduct = "$server/manager/addProduct.php";
  static const String deleteProduct = "$server/manager/deleteProduct.php";
  static const String getProduct = "$server/manager/getProduct.php";
}
