import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verId = '';
  int? resendTokenId;
  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // log('Auth Completed');
        await _auth.signInWithCredential(credential);
      },
      codeSent: (verificationId, resendToken) {
        verId = verificationId;
        resendTokenId = resendToken;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        verId = verificationId;
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar('Error', 'The provided phone number is not valid.');
          print('The provided phone number is not valid.');
        } else {
          Get.snackbar('Error', 'Somethin went wrong. Try again later');
        }
      },
    );
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(verificationId: verId, smsCode: otp));
    return credentials.user != null ? true : false;
  }
  verifyOtp(String otpNumber) async {
  PhoneAuthCredential credential =
      PhoneAuthProvider.credential(verificationId: verId, smsCode: otpNumber);
  await FirebaseAuth.instance.signInWithCredential(credential);
}
  decideRoute(){
    
  }
}

