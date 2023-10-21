import 'package:flutter/material.dart';
import 'package:flutter_faq/flutter_faq.dart';

class Faqs extends StatefulWidget {
  const Faqs({super.key});

  @override
  State<Faqs> createState() => _FaqsState();
}

class _FaqsState extends State<Faqs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("FAQ'S", style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const [
            FAQ(
              showDivider: true,
              question: "Question",
              answer: "data",
              ansStyle: TextStyle(color: Colors.black, fontSize: 14),
              queStyle: TextStyle(color: Colors.black, fontSize: 16),
            ),
            FAQ(
              showDivider: true,
              question: "Question",
              answer: "data",
              ansStyle: TextStyle(color: Colors.black, fontSize: 14),
              queStyle: TextStyle(color: Colors.black, fontSize: 16),
            ),
            FAQ(
              showDivider: true,
              question: "Question",
              answer: "data",
              ansStyle: TextStyle(color: Colors.black, fontSize: 14),
              queStyle: TextStyle(color: Colors.black, fontSize: 16),
            ),
            FAQ(
              showDivider: true,
              question: "Question",
              answer: "data",
              ansStyle: TextStyle(color: Colors.black, fontSize: 14),
              queStyle: TextStyle(color: Colors.black, fontSize: 16),
            ),
            FAQ(
              showDivider: true,
              question: "Question",
              answer: "data",
              ansStyle: TextStyle(color: Colors.black, fontSize: 14),
              queStyle: TextStyle(color: Colors.black, fontSize: 16),
            ),
            FAQ(
              showDivider: true,
              question: "Question",
              answer: "data",
              ansStyle: TextStyle(color: Colors.black, fontSize: 14),
              queStyle: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
