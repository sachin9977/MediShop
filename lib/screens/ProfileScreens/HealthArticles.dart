import 'package:flutter/material.dart';

class HealthArticals extends StatefulWidget {
  const HealthArticals({super.key});

  @override
  State<HealthArticals> createState() => _HealthArticalsState();
}

class _HealthArticalsState extends State<HealthArticals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Health articles",
            style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.fromLTRB(3, 0, 3, 10),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Shadow color
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 1), // Changes position of shadow
              ),
            ], color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  child: const Image(
                    image: AssetImage('assets/images/signUp_Image.jpg'),
                  ),
                ),
                const Text(
                  'How To Pick/Buy Generic Medicine For Your Natural Hair Growth',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Text("Posted on:"),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Apr 18 11:18 AM",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        //  Column(
        //   children: [

        //   ],
        // ),
      ),
    );
  }
}
