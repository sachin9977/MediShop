import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:medshop/auth/profilesetup.dart';
import 'package:medshop/auth/signIn.dart';
import 'package:medshop/config/constant.dart';
import 'package:medshop/widgets/customButton.dart';
import 'package:medshop/widgets/toast.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../provider/authProvider/authProvider.dart';

class OtpScreen extends StatefulWidget {

  const OtpScreen({super.key, required this.number1});

  final String number1;


  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  var sms = '';
  int _secondsRemaining = 30;
  late Timer _timer;


  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();

    // Start the timer
    _startTimer();
  }

  void _startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_secondsRemaining == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _secondsRemaining--;
          });
        }
      },
    );
  }

  void _onCodeSent(String verificationId) {
    SignIn.verify = verificationId;
  }

  void _onVerificationFailed(FirebaseAuthException e) {
    print('Phone verification failed: ${e.message}');
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
        title: const Text(
          otpHeading,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          otpHeading,
                          style: TextStyle(fontSize: 20),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
                          child: Text(
                            otpSubheading,
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.number1,
                              style: TextStyle(fontSize: 20),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignIn(),
                                    ));
                              },
                              child: const Icon(
                                Icons.edit,
                                color: Color.fromARGB(255, 69, 161, 218),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/verification_message.jpg'))),
                    width: 120,
                    height: 120,
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              OTPTextField(
                length: 6,
                width: MediaQuery.of(context).size.width / 1,
                fieldWidth: 50,
                style: const TextStyle(fontSize: 17),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.box,
                onChanged: (value) {
                  sms = value;
                },
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Text("didn't get code?"),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '$_secondsRemaining',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      if (_secondsRemaining == 0)
                        InkWell(
                            onTap: () async {
                              await AuthProvider.verifyPhoneNumber(
                                widget.number1,
                                _onCodeSent,
                                _onVerificationFailed,
                              );
                              setState(() {
                                _secondsRemaining = 30;
                                _startTimer();
                              });
                            },
                            child: Text(
                              "Resend code",
                              style: TextStyle(
                                  color: _secondsRemaining == 0
                                      ? Color.fromARGB(255, 69, 161, 218)
                                      : Colors.black),
                            )),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height / 8,
                      width: MediaQuery.of(context).size.width / 2,
                      child: InkWell(
                          onTap: () async {
                            try {
                              PhoneAuthCredential credential =
                                  PhoneAuthProvider.credential(
                                verificationId: SignIn.verify,
                                smsCode: sms,
                              );
                              await auth.signInWithCredential(credential);
                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProfileSetup(
                                      uid: FirebaseAuth
                                          .instance.currentUser!.uid,
                                      numb: widget.number1,
                                    ),
                                  ));
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.green,
                                  content: Text("Number Registered"),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                             
                            } catch (e) {
                              print(e);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(
                                      "Incorrect Code"),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                          },
                          child: const CustomButtom('$verifybtnText'))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
