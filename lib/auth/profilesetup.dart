import 'package:flutter/material.dart';
import 'package:medshop/widgets/customButton.dart';

import '../config/constant.dart';
import '../widgets/customTextField.dart';

class ProfileSetup extends StatefulWidget {
  const ProfileSetup({super.key});

  @override
  State<ProfileSetup> createState() => _ProfileSetupState();
}

class _ProfileSetupState extends State<ProfileSetup> {

TextEditingController name = TextEditingController();
  TextEditingController mail = TextEditingController();

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
          profileappbarText,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 0, 4),
                child: Text(
                  nametxtfield,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(
                  height: 60,
                  child: CircularTextField(
                    controller: name,
                    hintText: nametxtfieldhint,
                  )),
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 14, 0, 4),
                child: Text(
                  mailtxtfield,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(
                  height: 60,
                  child: CircularTextField(
                    controller: mail,
                    hintText: mailtxtfieldhint,
                  )),
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 14, 0, 4),
                child: Text(
                  mobiletxtfield,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(
                  height: 60,
                  child: CircularTextField(
                    controller: mail,
                    hintText: mobiletxtfieldhint,
                  )),
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 14, 0, 4),
                child: Text(
                  genderselect,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Chip(
                    label: Text(genderstxt[1]),
                  ),
                  Chip(label: Text(genderstxt[2])),
                  Chip(label: Text(genderstxt[3])),
                ],
              ),
              Row(
                children: [
                  Checkbox(value: true, onChanged: (_) {}),
                  const Text(chkbox1)
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              const SizedBox(height: 60, child: CustomButtom(profileUpdatebtn))
            ],
          ),
        ),
      ),
    );
  }
}