import 'package:country_picker/country_picker.dart';
import 'package:education/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/auth_constants.dart';
import '../home_screen/home_screen.dart';
import '../login_screen/login_screen.dart';

class RegisterController extends GetxController {


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

  final FirebaseAuth auth = FirebaseAuth.instance;

  late Rx<GoogleSignInAccount?> googleSignInAccount;

  late Rx<User?> firebaseUser;

  final GoogleSignIn googleSign = GoogleSignIn();


  // This is the state variable that will store the user's phone number.
  String phoneNumber = '';

  // This is the state variable that will store the user's OTP code.
  String _otpCode = '';

  // This is the state variable that will store the user's authentication status.
  bool _isAuthenticated = false;



  // This getter will return the user's OTP code.
  String get otpCode => _otpCode;

  // This getter will return the user's authentication status.
  bool get isAuthenticated => _isAuthenticated;

  @override
  void onInit() {
    super.onInit();
    updateSelectedCountry(country: null);
    update();
  }
  void updateSelectedCountry({Country? country}) {
    if (country != null) {
      selectedCountry = country;
      update();
    }
  }
  final FirebaseAuth firebaseAuth = FirebaseAuth. instance;
  RegisterController() {
  }

  Future<void> sendOtp() async {
    try {
      print('${selectedCountry.phoneCode + phoneNumber}');
      // Send the OTP code to the user's phone number.
      await auth.verifyPhoneNumber(
        phoneNumber: '+' + selectedCountry.phoneCode + phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Sign in the user with the OTP code.
          await auth.signInWithCredential(credential);
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

  void _setInitialScreen(User? user) {
    if (user == null) {
      // if the user is not found then the user is navigated to the Register Screen
      Get.offAllNamed(RoutePaths.loginScreen);
    } else {
      // if the user exists and logged in, navigate to the Home Screen
      Get.offAllNamed(RoutePaths.homeScreen);
    }
  }

  void _setInitialScreenGoogle(GoogleSignInAccount? googleSignInAccount) {
    print(googleSignInAccount);
    if (googleSignInAccount == null) {
      // if the user is not found then the user is navigated to the Register Screen
      Get.offAllNamed(RoutePaths.loginScreen);
    } else {
      // if the user exists and logged in, navigate to the Home Screen
      Get.offAllNamed(RoutePaths.homeScreen);
    }
  }
  void signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSign.signIn();

      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        await auth
            .signInWithCredential(credential)
            .catchError((onErr) => print(onErr));
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      print(e.toString());
    }
  }

  void register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (firebaseAuthException) {}
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (firebaseAuthException) {}
  }

  void signOut() async {
    await auth.signOut();
  }

  }
