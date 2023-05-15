import 'package:country_picker/country_picker.dart';
import 'package:education/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../register_screen/register_controller.dart';

class OtpController extends GetxController {
  bool isLoading = false;


  final RegisterController _registerController = Get.put(RegisterController());

  Country selectedCountry = Country(
      phoneCode: "91",
      countryCode: "IN",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "India",
      example: "India",
      displayName: "India",
      displayNameNoCountryCode: "IN",
      e164Key: "");

  final box = GetStorage();

 FirebaseAuth? auth ;

  late Rx<GoogleSignInAccount?> googleSignInAccount;

  late Rx<User?> firebaseUser;

  final GoogleSignIn googleSign = GoogleSignIn();

  static String verify = ''; // Add the verify property if it's missing

  bool _isAuthenticated = false;

  String? otpCode ;

  bool get isAuthenticated => _isAuthenticated;

  @override
  void onInit() {
    super.onInit();
   auth = FirebaseAuth.instance;
    updateSelectedCountry(country: selectedCountry);
    sendOtp();
    update();
  }

  void updateSelectedCountry({Country? country}) {
    if (country != null) {
      selectedCountry = country;
      update();
    }
  }

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;


  String verificationId = "";

  Future<void> sendOtp() async {
    try {
      print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
      print("+${selectedCountry.phoneCode}${_registerController.phoneNumber}");
      await auth!.verifyPhoneNumber(
        phoneNumber: "+${selectedCountry.phoneCode}${_registerController.phoneNumber}",
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth!.signInWithCredential(credential);
          print("******LOGIN SUCCESS ****");
          Get.toNamed(RoutePaths.homeScreen);

          _isAuthenticated = true;
          update();
        },
        verificationFailed: (FirebaseAuthException error) {
          print("******LOGIN FAILED ****");

          print(error.message);
        },
        codeSent: (String verificatioId, int? forceResendingToken) {
          print("OTP SEND <PLEASE CHECK YOUR PHONE ");
          print(
              "VERIFICATION ID ::::$verificatioId FORCE TOKEN $forceResendingToken}");
          verificationId = verificatioId;
          update();
          Get.toNamed(RoutePaths.otpScreen);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Handle the timeout.
          print('OTP code timed out.');
        },
      );
    } catch (e) {
      // Handle the error.
      print(e);
    }
  }
  Future<void> verifyOtp(String otpCode) async {
    try {
      if (auth != null) {
        await auth?.signInWithCredential(PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode: otpCode,
        ));
        print("$verify");

        _isAuthenticated = true;
        Get.toNamed(RoutePaths.homeScreen);
        update();
      } else {
        print("Wrong Otp");
        print('FirebaseAuth is null');
      }
    } catch (e) {
      print("Exceptional error");

      // Handle the error.
      print(e);
    }
  }
  void toggleLoading() {
    isLoading = !isLoading;
    update();
  }
}

