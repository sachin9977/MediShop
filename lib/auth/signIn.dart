import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medshop/auth/otpScreen.dart';

import '../config/constant.dart';
import '../widgets/customButton.dart';
import '../widgets/customTextField.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Future<void> sendOTP(String phoneNumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {
        // Auto verification, if the phone number is automatically detected
      },
      verificationFailed: (FirebaseAuthException e) {
        // Handle verification failure
      },
      codeSent: (String verificationId, int? resendToken) {
        // Save verification ID for later use
        // Typically, this is sent to another screen for OTP entry
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Called when the automatic code retrieval time has passed
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/signUp_Image.jpg'))),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
                child: Text(
                  heading,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height / 8,
                  child: CircularTextField()),
              SizedBox(
                  height: MediaQuery.of(context).size.height / 8,
                  child: InkWell(
                      onTap: () => sendOTP('9977184307'),
                      // onTap: () => Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => const OtpScreen(),
                      //     )),
                      child: const CustomButtom(
                        '$otpbtnText',
                      ))),
              const Text(
                termText,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
