import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

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

  static Future<Map<String, dynamic>?> checkUserExistsByUID(String uid) async {
    try {
      final userProfiles =
          FirebaseFirestore.instance.collection('userProfiles');
      final querySnapshot =
          await userProfiles.where('uid', isEqualTo: uid).get();

      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.first.data();
      }

      return null;
    } catch (e) {
      print('An error occurred while checking user existence: $e');
      return null;
    }
  }
}

