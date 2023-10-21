import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
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
        title: const Text("WishList", style: TextStyle(color: Colors.black)),
        actions: [
          Icon(
            Icons.shopping_basket,
            color: Colors.red,
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Center(child: Text("Products are not available")),
    );
  }
}
