import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medshop/screens/productDetail.dart';
import 'package:medshop/widgets/customButton.dart';

import '../widgets/bottomsheet.dart';
import 'Cart.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key, required this.apptxt, required this.id});

  final String apptxt;
  final String id;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  var counter = 0;
  List<Map<String, dynamic>> maindata = [];
  bool isLoading = true;


  @override
  void initState() {
    super.initState();
    dataa(widget.id);
  }

  void dataa(id) {
    FirebaseFirestore.instance
        .collection('CategoryCollection')
        .doc(id)
        .collection('sub${id}')
        .get()
        .then((subColl) {
      if (subColl.docs.isNotEmpty) {
        setState(() {
          maindata = subColl.docs.map((doc) => doc.data()).toList();
          isLoading = false;
        });
      }
    });
  }

  void incrementQuantity() {
    setState(() {
      counter++;
      print(counter);
    });
  }

  void decrementQuantity() {
    if (counter > 0) {
      // Ensure counter doesn't go below zero
      setState(() {
        counter--;
        print(counter);
      });
    }
  }


void showBottomSheet(BuildContext context, prod) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return CounterBottomSheet(
        prod: prod,
        initialCounter: counter, // Pass the initial counter value
        onCounterChanged: (newCounter) {
          setState(() {
            counter = newCounter; // Update the counter when it changes in the bottom sheet
          });
        },
      );
    },
  );
}


  // void showBottomSheet(BuildContext context, prod) {
  //   showModalBottomSheet(
  //     context: context,
  //     backgroundColor: Colors.transparent,
  //     builder: (BuildContext context) {
  //       return Container(
  //         decoration: const BoxDecoration(
  //             color: Colors.white,
  //             borderRadius: BorderRadius.only(
  //               topRight: Radius.circular(40),
  //               topLeft: Radius.circular(40),
  //             )),
  //         child: Padding(
  //           padding: const EdgeInsets.all(16.0),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: <Widget>[
  //               SizedBox(
  //                 height: 100,
  //                 child: Image.network(
  //                   prod['image'],
  //                 ),
  //               ),
  //               Text(
  //                 prod['name'],
  //                 style: const TextStyle(fontSize: 14),
  //               ),
  //               const SizedBox(height: 10),
  //               Text(
  //                 prod['Tablet'],
  //                 style: const TextStyle(fontSize: 14, color: Colors.black54),
  //               ),
  //               const SizedBox(height: 10),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   Text(prod['price']),
  //                   const SizedBox(width: 5),
  //                   Text(
  //                     prod['discountprice'],
  //                     style: const TextStyle(
  //                         color: Colors.black54,
  //                         decoration: TextDecoration.lineThrough),
  //                   ),
  //                   const SizedBox(width: 5),
  //                   Text(
  //                     prod['offer-text'],
  //                     style: const TextStyle(fontSize: 13, color: Colors.green),
  //                   ),
  //                 ],
  //               ),
  //               const SizedBox(height: 10),
  //               const Text(
  //                 "Choose Quantity",
  //                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
  //               ),
  //               const SizedBox(height: 10),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   InkWell(
  //                     onTap: () => decrementQuantity(),
  //                     child: const Icon(
  //                       Icons.remove_circle_outline,
  //                       size: 36,
  //                       color: Color.fromARGB(255, 69, 161, 218),
  //                     ),
  //                   ),
  //                   const SizedBox(width: 7),
  //                   Text(
  //                     'count$counter',
  //                     style: const TextStyle(fontSize: 20),
  //                   ),
  //                   const SizedBox(width: 7),
  //                   InkWell(
  //                     onTap: () => incrementQuantity(),
  //                     child: const Icon(
  //                       Icons.add_circle_outline_outlined,
  //                       size: 36,
  //                       color: Color.fromARGB(255, 69, 161, 218),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               const SizedBox(height: 15),
  //               SizedBox(
  //                   width: 260,
  //                   height: 40,
  //                   child:
  //                       CustomButtom("ADD TO CART", BorderRadius.circular(0)))
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

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
        title: Text(widget.apptxt, style: const TextStyle(color: Colors.black)),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Cart(),
                  ));
            },
            child: const Icon(
              Icons.shopping_basket,
              color: Color.fromARGB(255, 177, 69, 61),
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              itemCount: maindata.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.4),
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              ),
              itemBuilder: (context, index) {
                final productData = maindata[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetail(productData),
                        ));
                  },
                  child: Container(
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 100,
                          child: Image.network(
                            productData['image'],
                          ),
                        ),
                        Text(
                          productData['name'],
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          productData['Tablet'],
                          style: const TextStyle(
                              fontSize: 12, color: Colors.black54),
                        ),
                        Text(productData['mg']),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(productData['price']),
                            Text(
                              productData['discountprice'],
                              style: const TextStyle(
                                  color: Colors.black54,
                                  decoration: TextDecoration.lineThrough),
                            ),
                            Text(
                              productData['offer-text'],
                              style: const TextStyle(
                                  fontSize: 13, color: Colors.green),
                            ),
                          ],
                        ),
                        Text('Expiry : ${productData['expiry']}'),
                        InkWell(
                          onTap: () {
                            setState(() {
                              showBottomSheet(context, productData);
                            });
                          },
                          child: Container(
                            height: 40,
                            child: CustomButtom(
                                "ADD TO CART", BorderRadius.circular(0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
