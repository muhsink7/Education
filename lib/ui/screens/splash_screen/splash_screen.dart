import 'package:education/constants/color_constants.dart';
import 'package:education/router.dart';
import 'package:education/ui/screens/login_screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:education/ui/widgets/animated_splash_screen.dart';
import 'package:education/constants/image_constants.dart';

import '../../../constants/auth_constants.dart';
import '../home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2),() {
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
      body: Center(
        child:Text("Spl")
      )
    );
  }
}
