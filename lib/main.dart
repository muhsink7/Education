import 'package:education/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      color: primaryColor,
      debugShowCheckedModeBanner: false,
      title: 'Education',
      initialRoute: RoutePaths.splash,
      getPages: AppPages.pages,
      defaultTransition: Transition.cupertino,
    );
  }
}