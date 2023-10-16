
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileSetupProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  String selectedChip = '';

  void selectChip(String chipText) {
    selectedChip = chipText;
    notifyListeners();
  }

  void saveProfileDataToFirebase() async {
    String name = nameController.text;
    String mail = mailController.text;
    String mobile = mobileController.text;

    try {
      await FirebaseFirestore.instance.collection('userProfiles').add({
        'name': name,
        'mail': mail,
        'mobile': mobile,
        'gender': selectedChip,
      });
      print('Profile data saved to Firebase.');
    } catch (error) {
      print('Error saving profile data: $error');
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    mailController.dispose();
    mobileController.dispose();
    super.dispose();
  }
}
