import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late Stream<QuerySnapshot> categoryStream;
  late Stream<QuerySnapshot> categoryStream2;

  void dataa() {
    FirebaseFirestore.instance
        .collection('CategoryCollection')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        FirebaseFirestore.instance
            .collection('CategoryCollection')
            .doc(element.id)
            .collection('CardiacCollection')
            .get()
            .then((subColl) {
          subColl.docs.forEach((element) {
            print(element.id);
          });
        });
      });
    });
  }

  CategoryProvider() {
    categoryStream = _firestore.collection('CategoryCollection').snapshots();
  }
}
