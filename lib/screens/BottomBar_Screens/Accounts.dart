// ignore: file_names
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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
              const ListTile(
                horizontalTitleGap: 10,
                leading: Icon(
                  Icons.person,
                  size: 40,
                ),
                title: Text(
                  "Sachin Choudhary",
                  style: TextStyle(fontSize: 16),
                ),
                subtitle: Text("6232580029"),
                trailing: Text(
                  "Edit",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                  children: const [
                    ListTile(
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
                    Divider(
                      color: Colors.black12,
                      thickness: 1,
                      height: 0,
                      indent: 20,
                      endIndent: 20,
                    ),
                    ListTile(
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
                    Divider(
                      color: Colors.black12,
                      thickness: 1,
                      height: 0,
                      indent: 20,
                      endIndent: 20,
                    ),
                    ListTile(
                      horizontalTitleGap: 0,
                      leading: Icon(Icons.settings),
                      title: Text(
                        "Help center",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      subtitle: Text(
                        "Your fav medicine here..",
                        style: TextStyle(fontSize: 10),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
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
                  children: const [
                    Text("FAQ'S"),
                    Divider(
                      color: Colors.black12,
                      thickness: 1,
                      height: 30,
                    ),
                    Text("Health articles"),
                    Divider(
                      color: Colors.black12,
                      thickness: 1,
                      height: 30,
                    ),
                    Text("About US"),
                    Divider(
                      color: Colors.black12,
                      thickness: 1,
                      height: 30,
                    ),
                    Text("Terms of use"),
                    Divider(
                      color: Colors.black12,
                      thickness: 1,
                      height: 30,
                    ),
                    Text("Privacy Policy"),
                    Divider(
                      color: Colors.black12,
                      thickness: 1,
                      height: 30,
                    ),
                    Text("LogOut"),
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
