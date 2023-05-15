import 'package:country_picker/country_picker.dart';
import 'package:education/constants/button_constants.dart';
import 'package:education/constants/color_constants.dart';
import 'package:education/constants/image_constants.dart';
import 'package:education/ui/screens/register_screen/register_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../router.dart';

class RegisterScreen extends GetWidget<RegisterController> {
  final RegisterController _registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<RegisterController>(builder: (controller) {
        return SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
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
                    SizedBox(
                      height: 50.0,
                    ),
                    Text(
                      "Register",
                      style: GoogleFonts.manrope(
                        textStyle: const TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Add your phone number. We'll send you a verification code",
                      style: GoogleFonts.manrope(
                        textStyle: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.black38,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      cursorColor: primaryColor,
                      style: GoogleFonts.manrope(
                          textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      )),
                      onChanged: (value) {
                        controller.phoneNumber = value;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter phone number",
                        hintStyle: GoogleFonts.manrope(
                            textStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0,
                          color: Colors.grey.shade600,
                        )),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(color: Colors.black12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(color: Colors.black12),
                        ),
                        prefixIcon: Container(
                          padding: const EdgeInsets.all(10.0),
                          child: InkWell(
                            onTap: () {
                              showCountryPicker(
                                context: context,
                                countryListTheme: const CountryListThemeData(
                                    bottomSheetHeight: 500),
                                onSelect: (Country country) {
                                  controller.updateSelectedCountry(
                                      country: country);
                                },
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${controller.selectedCountry.flagEmoji} +${controller.selectedCountry.phoneCode}",
                                style: GoogleFonts.manrope(
                                    textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: Colors.black,
                                )),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50.0,
                      child: CustomButton(
                          name: "Send OTP",
                          onPressed: () {
                            _registerController.sendOtp();
                          }),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );


  }
}
