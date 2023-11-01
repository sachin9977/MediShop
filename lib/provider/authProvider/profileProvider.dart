
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medshop/BottomBar.dart';

class ProfileSetupProvider extends ChangeNotifier {

  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();

  String selectedChip = '';

  void selectChip(String chipText) {
    selectedChip = chipText;
    notifyListeners();
  }

  void saveProfileDataToFirebase(
    String uid, String numb, BuildContext contxt) async {
    String name = nameController.text;
    String mail = mailController.text;

    try {
      await FirebaseFirestore.instance.collection('userProfiles').add({
        'ui': uid,
        'name': name,
        'mail': mail,
        'mobile': numb,
        'gender': selectedChip,
      });
      print("Success");
      Navigator.push(contxt, MaterialPageRoute(builder: (context) => AnimatedBarExample(),));
      
    } catch (error) {
      print(error);
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    mailController.dispose();
    super.dispose();
  }
}
