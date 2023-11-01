import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../config/constant.dart';
import '../provider/authProvider/authProvider.dart';
import '../widgets/customButton.dart';
import '../widgets/customTextField.dart';
import 'otpScreen.dart';

class SignIn extends StatefulWidget {
  static String verify = '';

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController number = TextEditingController();

  var number1 = '';

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String? _phoneNumberValidationMessage;

  bool isLoading = false; // Add isLoading state

  void _onCodeSent(String verificationId) {
    SignIn.verify = verificationId;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.green,
        content: Text("Sending Code"),
        duration: Duration(seconds: 2),
      ),
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OtpScreen(
          number1: number1,
        ),
      ),
    );
  }

  void _onVerificationFailed(FirebaseAuthException e) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.red,
        content: Text("The format of the phone number provided is incorrect"),
        duration: Duration(seconds: 2),
      ),
    );
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                  height: 200,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
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
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      setState(() {
                        if (value!.isEmpty) {
                          _phoneNumberValidationMessage =
                              "Please enter a valid number";
                        } else {
                          if (value.length < 10 || value.length > 10) {
                            _phoneNumberValidationMessage =
                                "Phone number must be 10 digits";
                          } else {
                            _phoneNumberValidationMessage = null;
                          }
                        }
                      });

                      if (_phoneNumberValidationMessage != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(_phoneNumberValidationMessage!),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }

                      return null;
                    },
                    hintText: hinttxt,
                    controller: number,
                    onChanged: (value) {
                      setState(() {
                        number1 = '+91$value';
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 8,
                  child: 
                      InkWell(
                          onTap: () async {
                            if (_formKey.currentState != null &&
                                _formKey.currentState!.validate()) {
                              setState(() {
                                isLoading = true; // Set loading state
                              });
                              await AuthProvider.verifyPhoneNumber(
                                number1,
                                _onCodeSent,
                                _onVerificationFailed,
                              );
                            }
                          },
                          child:  CustomButtom(
                            otpbtnText,
                            BorderRadius.circular(10)
                          ),
                        ),
                ),
                const Text(
                  termText,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
