import 'package:education/ui/screens/login_screen/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/image_constants.dart';
import '../../../router.dart';

class LoginScreen extends GetWidget<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff092136),
        body: GetBuilder<LoginController>(
          builder: (controller) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: 'logo',
                    child: Image.asset(
                      Images.splash,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Text(
                      'Sign in with',
                      style: GoogleFonts.manrope(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Stack(
                            children: [
                              InkWell(
                                onTap: (){
                                  controller.toggleLoading();
                                  Get.toNamed(RoutePaths.registerScreen);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.transparent,
                                    border: Border.all(
                                      color: Colors.blue,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: SizedBox(
                                      height: 40.0,
                                        width: 40.0,
                                        child: Image.asset(
                                      Images.mobile,
                                    )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text(
                              'Phone number',
                              style: GoogleFonts.manrope(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Column(
                        children: [
                          Stack(
                            children: [
                              InkWell(
                                onTap: (){
                                  controller.signInWithGoogle();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.transparent,
                                    border: Border.all(
                                      color: Colors.blue,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: SizedBox(
                                        height: 40,
                                        width: 40,
                                        child: Image.asset(
                                          Images.google,
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text(
                              'Google',
                              style: GoogleFonts.manrope(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            );
          }
        ));
  }
}

