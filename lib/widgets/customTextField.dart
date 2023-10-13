import 'package:flutter/material.dart';

class CircularTextField extends StatelessWidget {
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
              decoration: const InputDecoration(
                hintText: 'Enter your mobile number',
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
