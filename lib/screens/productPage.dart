import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medshop/screens/ProfileScreens/Wishlist.dart';
import 'package:medshop/screens/productDetail.dart';
import 'package:medshop/widgets/customButton.dart';

class ProductPage extends StatefulWidget {
  ProductPage({super.key, required this.apptxt, required this.id});

  final String apptxt;
  final String id;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
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

          // maindata = subColl.docs.first.data();
          print(subColl.docs.length);
          // print(maindata);
          // print(maindata.length);
          isLoading = false;
        });
      }
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
                  builder: (context) => const WishList(),
                ),
              );
            },
          ),
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
                          builder: (context) =>  ProductDetail(productData),
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
                            Text(productData['discountprice']),
                            Text(
                              productData['offer-text'],
                              style: const TextStyle(
                                  fontSize: 13, color: Colors.green),
                            ),
                          ],
                        ),
                        Text('Expiry : ${productData['expiry']}'),
                        Container(
                          height: 40,
                          child: const CustomButtom("ADD TO CART"),
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
