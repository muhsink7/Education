import 'package:education/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  FirebaseAuth? auth;
  static String verify = "";
  String otpCode = '';
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  @override
  void onInit() {
    super.onInit();
    auth = FirebaseAuth.instance;
  }

  Future<void> verifyOtp(String otpCode) async {
    try {
      // Check if auth is not null
      if (auth != null) {
        // Verify the OTP code.
        await auth?.signInWithCredential(PhoneAuthProvider.credential(
          verificationId: verify,
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
}
