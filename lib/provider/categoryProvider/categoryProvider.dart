import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late Stream<QuerySnapshot> categoryStream;

  CategoryProvider() {
    categoryStream = _firestore.collection('CategoryCollection').snapshots();
  }
}
