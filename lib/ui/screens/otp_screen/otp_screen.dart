import 'package:education/ui/screens/otp_screen/otp_controller.dart';
import 'package:education/ui/screens/register_screen/register_controller.dart';
import 'package:education/ui/screens/register_screen/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../../../constants/button_constants.dart';
import '../../../constants/color_constants.dart';
import '../../../constants/image_constants.dart';
import '../../../router.dart';

class OtpScreen extends GetWidget<RegisterController> {

  final OtpController _otpController = Get.put(OtpController());
  
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300.0,
                    height: 300.0,
                    padding: const EdgeInsets.all(30.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: primaryColor,
                    ),
                    child: Image.asset(Images.splash),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    "Verify your otp",
                    style: GoogleFonts.manrope(
                      textStyle: const TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Pinput(
                    length: 6,
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: true,
                    androidSmsAutofillMethod: AndroidSmsAutofillMethod.none,
                    onChanged: (value) {
                      print("{$_otpController.otpCode}");
                      _otpController.otpCode = value;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50.0,
                    child: CustomButton(
                        name: "Login",
                        onPressed: () {
                          _otpController.verifyOtp(_otpController.otpCode);

                        }),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Edit your number?"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
