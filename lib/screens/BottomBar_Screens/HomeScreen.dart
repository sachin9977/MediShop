import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lecle_flutter_carousel_pro/lecle_flutter_carousel_pro.dart';
import 'package:medshop/screens/ProfileScreens/Wishlist.dart';
import 'package:medshop/widgets/customButton.dart';

import '../../components/categorycomponent.dart';
import '../../provider/categoryProvider/categoryProvider.dart';
import 'categories.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  final CategoryProvider _categoryProvider = CategoryProvider();

  @override
  void initState() {
    super.initState();
    _categoryProvider.categoryStream.listen((_) {
      setState(() {}); // Refresh the UI when data changes
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: const Icon(
            Icons.sensor_occupied_outlined,
            // color: Colors.green,
          )),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.logo_dev,
          color: Colors.black,
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WishList(),
                  ));
            },
            child: const Icon(
              Icons.shopping_basket,
              color: Color.fromARGB(255, 177, 69, 61),
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 19,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 69, 161, 218)),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: const TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      hintText: "Search Medicine",
                      disabledBorder:
                          UnderlineInputBorder(borderSide: BorderSide.none)),
                ),
              ),
              Container(
                  margin: const EdgeInsets.all(12),
                  height: 200.0,
                  width: 350.0,
                  child: const Carousel(
                    images: [
                      NetworkImage(
                          'https://img.freepik.com/free-vector/gradient-medical-super-sale-banner_23-2149117306.jpg?size=626&ext=jpg&ga=GA1.1.1413502914.1696636800&semt=ais'),
                      NetworkImage(
                          'https://previews.123rf.com/images/hasloo/hasloo1407/hasloo140700820/29767693-female-medical-doctor-working-with-healthcare-icons-modern-medical-technologies-concept.jpg'),
                      NetworkImage(
                          'https://st2.depositphotos.com/1907633/6917/i/450/depositphotos_69170339-stock-photo-smart-medical-doctor-hand-showing.jpg'),
                    ],
                    dotSize: 4.0,
                    dotSpacing: 15.0,
                    dotColor: Color.fromARGB(255, 69, 161, 218),
                    indicatorBgPadding: 5.0,
                    hasBorderRadius: true,
                    dotBgColor: Colors.transparent,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3.5,
                    height: MediaQuery.of(context).size.height / 7,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3), // Shadow color
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(
                                0, 1), // Changes position of shadow
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                              'https://www.medbuzz.in/assets/images/new/Request-1.png',
                              height: 50),
                          const Text(
                            "Request availability",
                            textAlign: TextAlign.center,
                          )
                        ]),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3.5,
                    height: MediaQuery.of(context).size.height / 7,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3), // Shadow color
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(
                                0, 1), // Changes position of shadow
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                              'https://www.medbuzz.in/assets/images/new/Request-2.png',
                              height: 50),
                          const Text("Need help")
                        ]),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3.5,
                    height: MediaQuery.of(context).size.height / 7,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3), // Shadow color
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(
                                0, 1), // Changes position of shadow
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                              'https://www.medbuzz.in/assets/images/new/Request-3.png',
                              height: 50),
                          const Text(
                            "Upload Prescription",
                            textAlign: TextAlign.center,
                          )
                        ]),
                  ),
                ],
              ),
              Container(
                color: const Color.fromARGB(255, 209, 144, 144),
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: Container(
                  color: Colors.white,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  height: 200,
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Upload Prescription",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            "Order Medicine using \n prescription",
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                              height: 80,
                              width: 160,
                              child: CustomButtom("Order Now",BorderRadius.circular(10)))
                        ],
                      ),
                      SizedBox(
                        height: 160,
                        width: 122,
                        // color: Colors.red,
                        child: Image.network(
                            'https://img.freepik.com/free-photo/doctor-smiling-with-stethoscope_1154-36.jpg'),
                      )
                    ],
                  ),
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Medicine Categories",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    "View all",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Color.fromARGB(255, 69, 161, 218)),
                  )
                ],
              ),

              const SizedBox(
                  height: 330,
                  child: Category(
                      isListView: false)), // To display as ListView

              Container(
                color: const Color.fromARGB(255, 191, 156, 156),
                margin: const EdgeInsets.only(top: 10),
                child: Container(
                  color: Colors.white,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  height: 200,
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Previous Orders",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            "Order Medicine from previous \n Orders",
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                              height: 80,
                              width: 160,
                              child:  CustomButtom("Order Now",BorderRadius.circular(10)))
                        ],
                      ),
                      SizedBox(
                        height: 160,
                        width: 122,
                        // color: Colors.red,
                        child: Image.network(
                            'https://cdn3.vectorstock.com/i/1000x1000/02/02/buy-online-over-white-background-shopping-bag-vector-8450202.jpg'),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 240,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.lightBlue.shade400,
                      Colors.tealAccent.shade100
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Text(
                        "Nutrition and supplements",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    FutureBuilder<QuerySnapshot>(
                        future: FirebaseFirestore.instance
                            .collection('Nutri&SupplementCollection')
                            .get(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: SpinKitSpinningLines(
                              color: Colors.blue,
                              size: 50.0,
                            )); // Loading indicator
                          }

                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          }

                          if (snapshot.data == null ||
                              snapshot.data!.docs.isEmpty) {
                            return const Text('No data found');
                          }

                          var documents = snapshot.data!
                              .docs; // Get the list of QueryDocumentSnapshot

                          return SizedBox(
                            height: 140,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: documents.length,
                              itemBuilder: (context, index) {
                                var document = documents[index].data()
                                    as Map<String, dynamic>;
                                return Container(
                                  height: 140,
                                  width: 120,
                                  margin:
                                      const EdgeInsets.only(right: 10, left: 2),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        height: 60,
                                        child: Image.network(document['Image']),
                                      ),
                                      Text(
                                        document['name'],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                        })
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.all(12),
                  height: 120.0,
                  width: 350.0,
                  child: const Carousel(
                    images: [
                      NetworkImage(
                          'https://img.freepik.com/free-vector/gradient-medical-super-sale-banner_23-2149117306.jpg?size=626&ext=jpg&ga=GA1.1.1413502914.1696636800&semt=ais'),
                      NetworkImage(
                          'https://medbuzz.s3.ap-south-1.amazonaws.com/kzpgaojqmoyyvhs1683009539959_Original.jpg'),
                      NetworkImage(
                          'https://st2.depositphotos.com/1907633/6917/i/450/depositphotos_69170339-stock-photo-smart-medical-doctor-hand-showing.jpg'),
                    ],
                    dotSize: 4.0,
                    dotSpacing: 15.0,
                    dotColor: Color.fromARGB(255, 69, 161, 218),
                    indicatorBgPadding: 5.0,
                    hasBorderRadius: true,
                    dotBgColor: Colors.transparent,
                  )),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
