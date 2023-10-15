import 'package:flutter/material.dart';

import '../config/constant.dart';
import '../widgets/customButton.dart';
import '../widgets/customTextField.dart';
import 'otpScreen.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController number = TextEditingController();
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
                      setState(() {});
                    },
                  )),
              SizedBox(
                  height: MediaQuery.of(context).size.height / 8,
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OtpScreen(),
                            ));
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
