




import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // This is the state variable that will store the user's phone number.
  String _phoneNumber = '';

  // This is the state variable that will store the user's OTP code.
  String _otpCode = '';

  // This is the state variable that will store the user's authentication status.
  bool _isAuthenticated = false;

  // This getter will return the user's phone number.
  String get phoneNumber => _phoneNumber;

  // This getter will return the user's OTP code.
  String get otpCode => _otpCode;

  // This getter will return the user's authentication status.
  bool get isAuthenticated => _isAuthenticated;

  // This method will send an OTP code to the user's phone number.
  Future<void> sendOtp() async {
    try {
      // Send the OTP code to the user's phone number.
      await _auth.verifyPhoneNumber(
        phoneNumber: _phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Sign in the user with the OTP code.
          await _auth.signInWithCredential(credential);
          _isAuthenticated = true;
          update();
        },
        verificationFailed: (FirebaseAuthException error) {
          // Handle the error.
          print(error.message);
        },
        codeSent: (String verificationId, int? forceResendingToken) {
          // Save the verification ID and forceResendingToken.
          _otpCode = verificationId;
          update();
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

  // This method will verify the user's OTP code.
  Future<void> verifyOtp(String otpCode) async {
    try {
      // Verify the OTP code.
      await _auth.signInWithCredential(PhoneAuthProvider.credential(
        verificationId: _otpCode,
        // otp: otpCode,
        smsCode: otpCode,
      ));
      _isAuthenticated = true;
      update();
    } catch (e) {
      // Handle the error.
      print(e);
    }
  }
}
