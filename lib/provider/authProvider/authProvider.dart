import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? verificationId;

  Future<void> sendOTP(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        print('Failed to send OTP: $e');
      },
      codeSent: (String verificationId, int? resendToken) {
        this.verificationId = verificationId;
        // Notify listeners that the verification ID is received
        notifyListeners();
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<void> verifyOTP(String smsCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId ?? '',
      smsCode: smsCode,
    );

    try {
      await _auth.signInWithCredential(credential);
      print('OTP verified successfully');
    } on FirebaseAuthException catch (e) {
      print('Failed to verify OTP: $e');
    }
  }
}
