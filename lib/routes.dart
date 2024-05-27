import 'package:get/get.dart';
import 'package:restaurant/core/constant/routename.dart';
import 'package:restaurant/core/middleware/mymidleware%20copy.dart';
import 'package:restaurant/view/screen/HomeScreen.dart';
import 'package:restaurant/view/screen/logintest.dart';
import 'package:restaurant/view/screen/onBoarding.dart';
import 'package:restaurant/view/screen/siginup.dart';
import 'package:restaurant/view/screen/verify_code_siginup.dart';

// middlewares: [MyMiddleware()]
List<GetPage<dynamic>>? routes = [
  //
  //onBoarding
  GetPage(
    name: "/",
    page: () => const OnBoarding(),
    middlewares: [MyMiddleware()],
  ),
  GetPage(name: AppRoutes.login, page: () => const Login()),
  GetPage(name: AppRoutes.signup, page: () => const SiginUp()),
  GetPage(
      name: AppRoutes.verifyCodeSignup, page: () => const VerifyCodeSignup()),
  GetPage(name: AppRoutes.home, page: () => const HomeScreen()),

  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
//  GetPage(
//     name: "/", page: () => const Languages(), middlewares: [MyMiddleware()]),
//  GetPage(name: AppRoutes.login, page: () => const Login()),
//  GetPage(name: AppRoutes.onBoarding, page: () => const OnBoarding()),
//  GetPage(name: AppRoutes.signup, page: () => const SignUp()),
];
