// ignore_for_file: unused_local_variable

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/binding.dart';
import 'package:restaurant/controller/main_controller.dart';
import 'package:restaurant/core/services/servises.dart';
import 'package:restaurant/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //SharedPreferences.setMockInitialValues({});
  await initServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MainController controller = Get.put(MainController());
    return GetMaterialApp(
      getPages: routes,
      //home: Test(),
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBinding(),
    );
  }
}
