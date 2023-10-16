import 'package:flutter/material.dart';
import 'package:medshop/widgets/customButton.dart';
import 'package:provider/provider.dart';

import '../config/constant.dart';
import '../provider/authProvider/profileProvider.dart';
import '../widgets/customTextField.dart';

class ProfileSetup extends StatefulWidget {
  const ProfileSetup({super.key});

  @override
  State<ProfileSetup> createState() => _ProfileSetupState();
}

class _ProfileSetupState extends State<ProfileSetup> {

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
          child: Consumer<ProfileSetupProvider>(
              builder: (context, provider, child) {
            return Column(
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
                      controller: provider.nameController,
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
                      controller: provider.mailController,
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
                      controller: provider.mobileController,
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
                    buildChip(provider, genderstxt[0]),
                    buildChip(provider, genderstxt[1]),
                    buildChip(provider, genderstxt[2]),
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
                SizedBox(
                    height: 60,
                    child: InkWell(
                        onTap: () {
                          provider.saveProfileDataToFirebase();
                        },
                        child: CustomButtom(profileUpdatebtn)))
              ],
            );
          }),
        ),
      ),
    );
  }
}

Widget buildChip(ProfileSetupProvider provider, String chipText) {
  bool isSelected = provider.selectedChip == chipText;

  return GestureDetector(
    onTap: () {
      provider.selectChip(chipText);
    },
    child: Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isSelected
            ? const Color.fromARGB(255, 69, 161, 218)
            : Color.fromARGB(255, 189, 187, 187),
        border: Border.all(
          color: isSelected
              ? const Color.fromARGB(255, 69, 161, 218)
              : Colors.white, // Border color based on selection
          width: 2.0, // Border width
        ),

        borderRadius: BorderRadius.circular(40), // Border radius
      ),
      child: Center(
        child: Text(
          chipText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isSelected
                ? Colors.black
                : Colors.white, // Text color based on selection
          ),
        ),
      ),
    ),
  );
}

