import 'package:flutter/material.dart';
import 'package:medshop/auth/profilesetup.dart';
import 'package:medshop/config/constant.dart';
import 'package:medshop/widgets/customButton.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';


class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
   
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
                          children: const [
                            Text(
                              number,
                              style: TextStyle(fontSize: 20),
                            ),
                            Icon(
                              Icons.edit,
                              color: Color.fromARGB(255, 69, 161, 218),
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
             
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: const [
                      Text('20'),
                      Text(
                        resendOTP,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height / 8,
                      width: MediaQuery.of(context).size.width / 2,
                      child: InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfileSetup(),
                              )),
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
