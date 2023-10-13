import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: const Icon(
            Icons.whatshot,
          )),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.logo_dev,
          color: Colors.black,
        ),
        actions: const [
          Icon(
            Icons.shopping_cart_checkout_sharp,
            color: Colors.black,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
