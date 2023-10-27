import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String dropdownvalue = '1';

  // List of items in our dropdown menu
  final List<String> items = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        title: const Text('My Cart', style: TextStyle(color: Colors.black)),
      ),
      body: FutureBuilder(
        future: _fetchCartData(),
        builder: (context, AsyncSnapshot<QuerySnapshot?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text("Your cart is empty."));
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final cartItem =
                  snapshot.data!.docs[index].data() as Map<String, dynamic>;
              print(cartItem);
              print(cartItem.length);

              return Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Image.network(
                        cartItem['product_image'] ??
                            'https://th.bing.com/th/id/OIP.IAgCz4RfObUBYDto3pl5SgHaET?w=285&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7',
                        height: 80,
                        width: 120,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cartItem['product_name'] ?? 'NA',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            cartItem['product_tab'] ?? 'NA',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            cartItem['product_mg'] ?? "NA",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            cartItem['product_company'] ?? 'NA',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Expiry : ${cartItem['product_expiry'] ?? 'NA'} ',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: [
                              Text(
                                cartItem['product_price'] ?? "NA",
                                style:
                                    TextStyle(fontSize: 14, color: Colors.red),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                cartItem['product_discount'] ?? "NA",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                cartItem['product_offer'] ?? "NA",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.green),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 100,
                                height: 35,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Expanded(
                                  child: DropdownButton(
                                    // Initial Value
                                    value: dropdownvalue,

                                    // Down Arrow Icon
                                    icon: const Icon(Icons.keyboard_arrow_down),

                                    // Array list of items
                                    items: items.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items),
                                      );
                                    }).toList(),
                                    // After selecting the desired option,it will
                                    // change button value to selected value
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownvalue = newValue!;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Container(
                                height: 35,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      // padding: EdgeInsets.all(-5),
                                      backgroundColor: const Color.fromARGB(
                                          255, 232, 231, 231),
                                      shadowColor: Colors.grey),
                                  child: const Text(
                                    "Remove",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color:
                                            Color.fromARGB(197, 100, 100, 100),
                                        letterSpacing: 1),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  const Divider(
                    color: Colors.grey,
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }

  Future<QuerySnapshot?> _fetchCartData() async {
    final user = _auth.currentUser;
    if (user != null) {
      final cartData = await _firestore
          .collection('carts')
          .doc(user.uid)
          .collection('items')
          .get();
      return cartData;
    }
    return null; // Return null when there's no user logged in.
  }
}
