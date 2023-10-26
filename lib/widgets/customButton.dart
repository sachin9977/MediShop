import 'package:flutter/material.dart';

class CustomButtom extends StatefulWidget {
  final String txt;

  const CustomButtom(this.txt, {Key? key}) : super(key: key);

  @override
  State<CustomButtom> createState() => _CustomButtomState();
}

class _CustomButtomState extends State<CustomButtom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Shadow color
              spreadRadius: 3,
              blurRadius: 5,
                offset: const Offset(0, 3), // Changes position of shadow
              ),
            ],
            color: const Color.fromARGB(255, 69, 161, 218),
          // borderRadius: BorderRadius.circular(12)
        ),
        // margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        height: 55,
        // width: double.infinity,
        child: Center(
            child: Text(
          widget.txt,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
