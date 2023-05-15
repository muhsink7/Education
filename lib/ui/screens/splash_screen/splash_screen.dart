import 'package:education/constants/color_constants.dart';
import 'package:education/router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:education/constants/image_constants.dart';

import '../../../constants/auth_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3),() {
      var box = GetStorage();
      if(box.hasData(Keys.isLoggedIn)&& box.read(Keys.isLoggedIn)==true) {
        Get.offAndToNamed(RoutePaths.homeScreen);
      }else{
        Get.offAndToNamed(RoutePaths.loginScreen);
      }
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Image.asset(Images.splash),
      )
    );
  }
}
