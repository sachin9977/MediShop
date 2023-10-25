import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medshop/screens/ProfileScreens/Wishlist.dart';

class ProductPage extends StatefulWidget {
  ProductPage({super.key, required this.apptxt, required this.id});

  final String apptxt;
  final String id;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  Map<String, dynamic> maindata = {};

  @override
  void initState() {
    super.initState();
    dataa(widget
        .id); // Call the dataa function with the widget's id when the widget initializes.
  }

  void dataa(id) {
    FirebaseFirestore.instance
        .collection('CategoryCollection')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        FirebaseFirestore.instance
            .collection('CategoryCollection')
            .doc(id)
            .collection('sub${id}')
            .get()
            .then((subColl) {
          subColl.docs.forEach((element) {
            setState(() {
              maindata = element.data(); // Assign element.data() to maindata.
            });
            print(maindata);
            print(id);
            print(element.data());
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(widget.apptxt),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.shopping_basket),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WishList(),
                  ));
            },
          ),
        ],
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: 4,
          itemBuilder: (context, index) {
            return Container(
              height: 90,
              margin: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Image.network(
                    'https://th.bing.com/th/id/OIP.h3l7OSU9jFU10Ib-2I52SQHaDm?pid=ImgDet&rs=1',
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    maindata['name'],
                    style: TextStyle(fontSize: 10.0),
                  ),
                  const Text(
                    'strip of 10 tablets',
                    style: TextStyle(fontSize: 8.0, color: Colors.grey),
                  ),
                  const Text(
                    'Labetalol 200mg',
                    style: TextStyle(fontSize: 8.0),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Rs. 100',
                        style: TextStyle(fontSize: 8.0),
                      ),
                      Text(
                        'Rs. 249',
                        style: TextStyle(fontSize: 8.0, color: Colors.grey),
                      ),
                      Text(
                        '59% Off',
                        style: TextStyle(fontSize: 8.0, color: Colors.green),
                      ),
                    ],
                  ),
                  const Text(
                    'expiry',
                    style: TextStyle(fontSize: 10.0),
                  ),
                  Container(
                      height: 30.0,
                      child: ElevatedButton(
                        onPressed: () {
                          dataa(widget.id);
                        },
                        child: Text(
                          'ADD TO CART',
                          style: TextStyle(fontSize: 14.0),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          minimumSize: const Size(double.infinity, 40),
                        ),
                      )),
                ],
              ),
            );
          }),
    );
  }
}
