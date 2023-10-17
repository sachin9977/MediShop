import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CircularTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator; // Validator for input
  final TextInputType keyboardType; // Keyboard type


  const CircularTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.onChanged,
    this.validator,
    this.keyboardType = TextInputType.text, // Default keyboard type is text
  }) : super(key: key);

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
              maxLengthEnforcement: MaxLengthEnforcement.none,
              controller: controller,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: hintText,
                contentPadding: EdgeInsets.all(15.0),
                border: InputBorder.none,
              ),
              validator: validator, // Apply validation
              keyboardType: keyboardType, // Set the keyboard type
            ),
          ),
        ),
      ),
    );
  }
}
