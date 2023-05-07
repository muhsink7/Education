import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/image_constants.dart';
import '../../../router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff092136),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Images.splash,
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Text(
                  'Sign in with',
                  style: GoogleFonts.manrope(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        ),
                  ),
                ),
              ),
              SizedBox(
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
                              Get.toNamed(RoutePaths.homeScreen);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                // image: DecorationImage(
                                //   image:AssetImage(Images.google),),
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
                                  Images.phone,
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
                            textStyle: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              // image: DecorationImage(
                              //   image:AssetImage(Images.google),),
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
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          'Google',
                          style: GoogleFonts.manrope(
                            textStyle: TextStyle(
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
        ));
  }
}
