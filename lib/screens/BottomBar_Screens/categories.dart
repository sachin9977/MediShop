import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => const ListTile(
          leading: Icon(
            Icons.abc,
            size: 40,
          ),
          title: Text("Cardio"),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ),
 
    );
  }
}
