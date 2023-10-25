// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medshop/screens/ProfileScreens/FAQs.dart';
import 'package:medshop/screens/ProfileScreens/HealthArticles.dart';
import 'package:medshop/screens/ProfileScreens/Wishlist.dart';
import 'package:medshop/screens/ProfileScreens/aboutUs.dart';

import '../ProfileScreens/EditProfile.dart';
import '../ProfileScreens/HelpCenter.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

  String? name = "Loading...";
  String? mobile = "Loading...";

  // Function to fetch user profile data
  Future<void> fetchUserProfile() async {
    try {
      // Get the current user
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Reference to Firestore collection "userProfiles"
        CollectionReference userProfiles =
            FirebaseFirestore.instance.collection('userProfiles');
        print(userProfiles);

        // Query the documents in the collection
        QuerySnapshot querySnapshot =
            await userProfiles.where('ui', isEqualTo: user.uid).get();
        // QuerySnapshot querySnapshot =
        //     await userProfiles.where('uid', isEqualTo: user.uid).get();

        // Check if the query has any documents
        if (querySnapshot.docs.isNotEmpty) {
          // Get the data from the first document (assuming there's only one)
          Map<String, dynamic> userData =
              querySnapshot.docs[0].data() as Map<String, dynamic>;

          // Retrieve the 'name' field from the document
          String userName = userData['name'];
          String mobileNumber = userData['mobile'];

          // Update the state with the user's name
          setState(() {
            name = userName;
            mobile = mobileNumber;
          });
        }
      }
    } catch (error) {
      print("Error fetching user profile: $error");
    }
  }

  @override
  void initState() {
    super.initState();
    // Fetch user profile data when the widget initializes
    fetchUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              ListTile(
                horizontalTitleGap: 10,
                leading: const Icon(
                  Icons.person,
                  size: 40,
                ),
                title: Text(name ?? "Loading..."),
                // const Text(
                //   "Sachin Choudhary",
                //   style: TextStyle(fontSize: 16),
                // ),
                subtitle: Text(mobile!),
                trailing: InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  EditProfile(name:name!, mobile: mobile!,),
                      )),
                  child: const Text(
                    "Edit",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(
                              color: const Color.fromARGB(255, 69, 161, 218),
                              width: 2)),
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: 50,
                      child: const Center(
                          child: Text(
                        "Orders",
                      )),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(
                              color: const Color.fromARGB(255, 69, 161, 218),
                              width: 2)),
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: 50,
                      child: const Center(
                          child: Text(
                        "Wallet",
                      )),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(
                              color: const Color.fromARGB(255, 69, 161, 218),
                              width: 2)),
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: 50,
                      child: const Center(
                          child: Text(
                        "Prescription",
                      )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WishList(),
                          ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(
                              color: const Color.fromARGB(255, 69, 161, 218),
                              width: 2)),
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: 50,
                      child: const Center(
                          child: Text(
                        "Wishlist",
                      )),
                    ),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3), // Shadow color
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset:
                            const Offset(0, 1), // Changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ListTile(
                      horizontalTitleGap: 0,
                      leading: Icon(Icons.location_on_outlined),
                      title: Text(
                        "Address",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      subtitle: Text(
                        "save address for faster checkout",
                        style: TextStyle(fontSize: 10),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    const Divider(
                      color: Colors.black12,
                      thickness: 1,
                      height: 0,
                      indent: 20,
                      endIndent: 20,
                    ),
                    const ListTile(
                      horizontalTitleGap: 0,
                      leading: Icon(Icons.speaker),
                      title: Text(
                        "Refer App",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      subtitle: Text(
                        "save address for faster checkout",
                        style: TextStyle(fontSize: 10),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    const Divider(
                      color: Colors.black12,
                      thickness: 1,
                      height: 0,
                      indent: 20,
                      endIndent: 20,
                    ),
                    ListTile(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HelpCenter(),
                          )),
                      horizontalTitleGap: 0,
                      leading: const Icon(Icons.settings),
                      title: const Text(
                        "Help center",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      subtitle: const Text(
                        "Your fav medicine here..",
                        style: TextStyle(fontSize: 10),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3), // Shadow color
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset:
                            const Offset(0, 1), // Changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Faqs(),
                            )),
                        child: const Text("FAQ'S")),
                    const Divider(
                      color: Colors.black12,
                      thickness: 1,
                      height: 30,
                    ),
                    InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HealthArticals(),
                            )),
                        child: const Text("Health articles")),
                    const Divider(
                      color: Colors.black12,
                      thickness: 1,
                      height: 30,
                    ),
                    InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AboutUs(),
                            )),
                        child: const Text("About US")),
                    const Divider(
                      color: Colors.black12,
                      thickness: 1,
                      height: 30,
                    ),
                    const Text("Terms of use"),
                    const Divider(
                      color: Colors.black12,
                      thickness: 1,
                      height: 30,
                    ),
                    const Text("Privacy Policy"),
                    const Divider(
                      color: Colors.black12,
                      thickness: 1,
                      height: 30,
                    ),
                    const Text("LogOut"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
