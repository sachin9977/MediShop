import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/Cart.dart';
import 'customButton.dart';

class CounterBottomSheet extends StatefulWidget {
  final int initialCounter;
  final Function(int) onCounterChanged;
  final Map<String, dynamic> prod; // Add prod parameter

  CounterBottomSheet(
      {required this.initialCounter,
      required this.onCounterChanged,
      required this.prod});

  @override
  _CounterBottomSheetState createState() => _CounterBottomSheetState();
}

class _CounterBottomSheetState extends State<CounterBottomSheet> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _counter = widget.initialCounter;
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      widget.onCounterChanged(_counter);
    });
  }

  void _decrementCounter() {
    if (_counter > 0) {
      setState(() {
        _counter--;
        widget.onCounterChanged(_counter);
      });
    }
  }

  void addToCart() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final productData = widget.prod;
      final cartItem = {
        'product_id': 1,
        'product_name': productData['name'],
        'product_image': productData['image'],
        'product_tab': productData['Tablet'],
        'product_expiry': productData['expiry'],
        'product_mg': productData['mg'],
        'product_company': productData['Company Name'],
        'product_price': productData['price'],
        'product_discount': productData['discountprice'],
        'product_offer': productData['offer-text'],
        'quantity': _counter,
      };

      final cartRef =
          FirebaseFirestore.instance.collection('carts').doc(user.uid);
      cartRef.collection('items').add(cartItem);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Added to Cart!'),
        ),
      );
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Cart(),
          ));
    } else {
      // Handle the case where the user is not authenticated (e.g., show a login/signup prompt).
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please log in to add items to your cart.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          )),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 100,
              child: Image.network(
                widget.prod['image'],
              ),
            ),
            Text(
              widget.prod['name'],
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 10),
            Text(
              widget.prod['Tablet'],
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.prod['price']),
                const SizedBox(width: 5),
                Text(
                  widget.prod['discountprice'],
                  style: const TextStyle(
                      color: Colors.black54,
                      decoration: TextDecoration.lineThrough),
                ),
                const SizedBox(width: 5),
                Text(
                  widget.prod['offer-text'],
                  style: const TextStyle(fontSize: 13, color: Colors.green),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              "Choose Quantity",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => _decrementCounter(),
                  child: const Icon(
                    Icons.remove_circle_outline,
                    size: 36,
                    color: Color.fromARGB(255, 69, 161, 218),
                  ),
                ),
                const SizedBox(width: 7),
                Text(
                  '$_counter',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(width: 7),
                InkWell(
                  onTap: () => _incrementCounter(),
                  child: const Icon(
                    Icons.add_circle_outline_outlined,
                    size: 36,
                    color: Color.fromARGB(255, 69, 161, 218),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            SizedBox(
                width: 260,
                height: 40,
                child: InkWell(
                    onTap: () => addToCart(),
                    child:
                        CustomButtom("ADD TO CART", BorderRadius.circular(0))))
          ],
        ),
      ),
    );
  }
}
