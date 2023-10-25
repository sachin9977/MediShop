import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../config/constant.dart';
import '../../widgets/customButton.dart';
import '../../widgets/customTextField.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key, required this.mobile, required this.name});

  final String mobile;
  final String name;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();

  String? _phoneNumberValidationMessage;

  final _formKey = GlobalKey<FormState>();

  Future<void> updateUserProfile() async {
    if (_formKey.currentState!.validate()) {
      // Get the current user
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Reference to Firestore collection "userProfiles"
        CollectionReference userProfiles =
            FirebaseFirestore.instance.collection('userProfiles');

        // Construct the data to update
        Map<String, dynamic> updatedData = {
          'name': nameController.text, // Update the name
          'mail': mailController.text, // Update the email
        };

        try {
          // Update the document with the user's UID
          await userProfiles.doc(user.uid).update(updatedData);
          print(userProfiles);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text("Profile updated successfully"),
              duration: Duration(seconds: 2),
            ),
          );
        } catch (error) {
          print(error);
          print("Error updating profile: $error");
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.red,
              content: Text("Failed to update profile"),
              duration: Duration(seconds: 2),
            ),
          );
        }
      }
    }
  }

// Add a function to call updateUserProfile when the submit button is pressed
  void handleProfileUpdate() {
    updateUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text("Profile Update",
              style: TextStyle(color: Colors.black)),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
                child: Form(
                    key: _formKey,
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
                              validator: (value) {
                                setState(() {
                                  if (value!.isEmpty) {
                                    _phoneNumberValidationMessage =
                                        "Please Enter Name";
                                  } else {
                                    _phoneNumberValidationMessage = null;
                                  }
                                });

                                if (_phoneNumberValidationMessage != null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.red,
                                      content:
                                          Text(_phoneNumberValidationMessage!),
                                      duration: const Duration(seconds: 2),
                                    ),
                                  );
                                }

                                return null;
                              },
                              controller: nameController,
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
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return _phoneNumberValidationMessage =
                                      "Please Enter Email";
                                } else {
                                  // Use regex to validate email format
                                  bool isValidEmail = RegExp(
                                          r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value);
                                  if (!isValidEmail) {
                                    return _phoneNumberValidationMessage =
                                        "Please Enter a Valid Email";
                                  } else {
                                    _phoneNumberValidationMessage = null;
                                  }
                                }

                                if (_phoneNumberValidationMessage != null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.red,
                                      content:
                                          Text(_phoneNumberValidationMessage!),
                                      duration: const Duration(seconds: 2),
                                    ),
                                  );
                                }

                                return null;
                              },
                              controller: mailController,
                              hintText: mailtxtfieldhint,
                            )),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(16, 14, 0, 4),
                          child: Text(
                            mobiletxtfield,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Container(
                          height: 55,
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              border: Border.all(color: Colors.grey),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(widget.mobile),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.check_circle_outlined,
                                    size: 18,
                                    color: Colors.green,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Verified",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(16, 14, 0, 4),
                          child: Text(
                            genderselect,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     buildChip(provider, genderstxt[0]),
                        //     buildChip(provider, genderstxt[1]),
                        //     buildChip(provider, genderstxt[2]),
                        //   ],
                        // ),
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
                                onTap: handleProfileUpdate,
                                child: const CustomButtom(profileUpdatebtn)))
                      ],
                    )))));
  }
}

Widget buildChip(provider, String chipText) {
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
            : const Color.fromARGB(255, 189, 187, 187),
        border: Border.all(
          color: isSelected
              ? const Color.fromARGB(255, 69, 161, 218)
              : Colors.white,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Center(
        child: Text(
          chipText,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
