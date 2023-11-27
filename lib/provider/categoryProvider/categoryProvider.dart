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
      for (var element in value.docs) {
        FirebaseFirestore.instance
            .collection('CategoryCollection')
            .doc(element.id)
            .collection('CardiacCollection')
            .get()
            .then((subColl) {
          for (var element in subColl.docs) {
            print(element.id);
          }
        });
      }
    });
  }

  CategoryProvider() {
    categoryStream = _firestore.collection('CategoryCollection').snapshots();
  }
}
