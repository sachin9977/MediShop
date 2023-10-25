import 'package:flutter/material.dart';
import 'package:medshop/components/categorycomponent.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Category(isListView: true),
    );
  }
}
