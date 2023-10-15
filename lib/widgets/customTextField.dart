import 'package:flutter/material.dart';
import 'package:medshop/config/constant.dart';

class CircularTextField extends StatelessWidget {

  final String hintText;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  const CircularTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.onChanged});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: Colors.grey, // Adjust border color here
              width: .5, // Adjust border width here
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: TextFormField(
              controller: controller,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: hintText,
                contentPadding: EdgeInsets.all(15.0),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
