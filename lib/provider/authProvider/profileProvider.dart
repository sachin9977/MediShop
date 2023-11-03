
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

  // void saveProfileDataToFirebase(
  //   String uid, String numb, BuildContext contxt) async {
  //   String name = nameController.text;
  //   String mail = mailController.text;

  //   try {
  //     await FirebaseFirestore.instance.collection('userProfiles').add({
  //       'ui': uid,
  //       'name': name,
  //       'mail': mail,
  //       'mobile': numb,
  //       'gender': selectedChip,
  //     });
  //     print("Success");
  //     Navigator.push(contxt, MaterialPageRoute(builder: (context) => AnimatedBarExample(),));
      
  //   } catch (error) {
  //     print(error);
  //   }
  // }

   Future<void> saveProfileDataToFirebase(
    String uid, String numb, BuildContext contxt) async {
    String name = nameController.text;
    String mail = mailController.text;

    try {
      // Check if a user profile with the same UID already exists
      QuerySnapshot existingProfiles = await FirebaseFirestore.instance
          .collection('userProfiles')
          .where('ui', isEqualTo: uid)
          .get();

      if (existingProfiles.docs.isNotEmpty) {
        // A user profile with the same UID already exists, no need to create a new one.
        print("User profile already exists.");
        Navigator.push(contxt, MaterialPageRoute(builder: (context) => AnimatedBarExample()));
      } else {
        // User profile doesn't exist, create a new one
        await FirebaseFirestore.instance.collection('userProfiles').add({
          'ui': uid,
          'name': name,
          'mail': mail,
          'mobile': numb,
          'gender': selectedChip,
        });
        print("User profile created successfully.");
        Navigator.push(contxt, MaterialPageRoute(builder: (context) => AnimatedBarExample()));
      }
    } catch (error) {
      print("Error: $error");
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    mailController.dispose();
    super.dispose();
  }
}
