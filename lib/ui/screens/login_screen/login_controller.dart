import 'package:education/constants/auth_constants.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../router.dart';

class LoginController extends GetxController {
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  late Rx<User?> firebaseUser;

  bool isLoading = false;

  late Rx<GoogleSignInAccount?> googleSignInAccount;


  @override
  void onReady() {
    super.onReady();

    firebaseUser = Rx<User?>(auth.currentUser);
    googleSignInAccount = Rx<GoogleSignInAccount?>(googleSign.currentUser);


    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);

    googleSignInAccount.bindStream(googleSign.onCurrentUserChanged);
    ever(googleSignInAccount, _setInitialScreenGoogle);
  }


  _setInitialScreen(User? user) {
    if (user == null) {
      print("-----------Login screen----------");
      Get.toNamed(RoutePaths.loginScreen);
    } else {
      toggleLoading();
      Get.offAllNamed(RoutePaths.homeScreen);
    }
  }


  _setInitialScreenGoogle(GoogleSignInAccount? googleSignInAccount) {
    print(googleSignInAccount);
    if (googleSignInAccount == null) {
      print("*************google screen***********");
      toggleLoading();
      Get.toNamed(RoutePaths.loginScreen);    } else {
      toggleLoading();
      Get.offAllNamed(RoutePaths.homeScreen);    }
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

  void toggleLoading() {
    isLoading = !isLoading;
    update();
  }
}
