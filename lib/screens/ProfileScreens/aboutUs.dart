import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
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
        title: Text("About Us", style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/logoone.png'))),
                  ),
                  Text(
                    "About Us",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Text(
                  "Branded medicines sans multitudes of marketing strategies, gimmick and voila!...generic medicines were born. Yes, the concept of generic medicines or drugs is that straightforward and simple, from the time it came into being almost 100 years ago"),
              SizedBox(
                height: 20,
              ),
              Text(
                  "We, at MedShop, have a dream of becoming a pioneer in making generic drugs affordable, accessible, widely available & as popular as their branded versions if not more. Why? Because we’ve seen & felt the suffering, pain and helplessness of those who can no longer afford the medication in a chronic condition…very closely. They just wish to die instead. And also because we know how important and difficult it is at the same time, for a nation of 130+ billion people to get quality & inexpensive health care.")
            ],
          ),
        ),
      ),
    );
  }
}
