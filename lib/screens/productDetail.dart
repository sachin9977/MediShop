import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medshop/widgets/customButton.dart';

import 'Cart.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail(this.productData, {super.key});

  final Map<String, dynamic> productData;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int counter = 1;

  void incrementQuantity() {
    setState(() {
      counter++;
    });
  }

  void decrementQuantity() {
    if (counter > 0) {
      setState(() {
        counter--;
      });
    }
  }

  void addToCart() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final productData = widget.productData;
      final cartItem = {
        'product_id': 1,
        'product_name': productData['name'],
        'product_image':productData['image'],
        'product_tab':productData['Tablet'],
        'product_expiry':productData['expiry'],
        'product_mg':productData['mg'],
        'product_company':productData['Company Name'],
        'product_price': productData['price'],
        'product_discount': productData['discountprice'],
        'product_offer': productData['offer-text'],
        'quantity': counter,
      };

      final cartRef =
          FirebaseFirestore.instance.collection('carts').doc(user.uid);
      cartRef.collection('items').add(cartItem);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Added to Cart!'),
        ),
      );
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Cart(),
          ));
    } else {
      // Handle the case where the user is not authenticated (e.g., show a login/signup prompt).
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please log in to add items to your cart.'),
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    final productData = widget.productData;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        title:
            const Text('Product Detail', style: TextStyle(color: Colors.black)),
        actions: const [
          Icon(
            Icons.shopping_basket,
            color: Colors.red,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.all(20),
                      color: Colors.amber,
                      height: 150,
                      width: double.infinity,
                      child: Image.network(
                        productData['image'],
                        fit: BoxFit.cover,
                      )),
                  Text(
                    productData['name'],
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    productData['Tablet'],
                    style: const TextStyle(color: Colors.black54),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    productData['mg'],
                    style: const TextStyle(color: Colors.black54),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text("By : ${productData['Company Name']}"),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Expiry: ${productData['expiry']}",
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        productData['price'],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        productData['discountprice'],
                        style: const TextStyle(
                            color: Colors.black54,
                            decoration: TextDecoration.lineThrough),
                      ),
                      SizedBox(
                          height: 60,
                          width: 160,
                          child: InkWell(
                              onTap: () {
                                addToCart();
                              },
                              child: CustomButtom("ADD TO CART")))
                    ],
                  )
                ],
              ),
            ),
            Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 1),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "About",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Text(productData['about_tablet']),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
