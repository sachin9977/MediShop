import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../config/constant.dart';
import '../widgets/customButton.dart';
import '../widgets/customTextField.dart';
import 'otpScreen.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});
  static String verify = '';

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController number = TextEditingController();

  var number1 = '';

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
                  child: CircularTextField(
                    hintText: hinttxt,
                    controller: number,
                    onChanged: (value) {
                      setState(() {
                        number1 = value;
                      });
                    },
                  )),
              SizedBox(
                  height: MediaQuery.of(context).size.height / 8,
                  child: InkWell(
                      onTap: () async {
                        try {
                          await FirebaseAuth.instance.verifyPhoneNumber(
                            phoneNumber: number1,
                            verificationCompleted:
                                (PhoneAuthCredential credential) {},
                            verificationFailed: (FirebaseAuthException e) {
                              print('Phone verification failed: ${e.message}');
                            },
                            codeSent:
                                (String verificationId, int? resendToken) {
                              SignIn.verify = verificationId;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OtpScreen(),
                                ),
                              );
                            },
                            codeAutoRetrievalTimeout:
                                (String verificationId) {},
                          );
                        } catch (e) {
                          print(
                              'An error occurred during phone verification: $e');
                        }
                      },
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
