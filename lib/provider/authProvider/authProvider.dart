import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<void> verifyPhoneNumber(
    String phoneNumber,
    Function(String) onCodeSent,
    Function(FirebaseAuthException) onVerificationFailed,
  ) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          onVerificationFailed(e);
        },
        codeSent: (String verificationId, int? resendToken) {
          onCodeSent(verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      print('An error occurred during phone verification: $e');
    }
  }
}
