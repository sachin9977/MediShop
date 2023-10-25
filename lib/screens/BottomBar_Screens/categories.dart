import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medshop/screens/productPage.dart';

import '../../provider/categoryProvider/categoryProvider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  
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
      body: StreamBuilder<QuerySnapshot>(
        stream: _categoryProvider.categoryStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final categoryDocs = snapshot.data?.docs ?? [];

          return ListView.builder(
            itemCount: categoryDocs.length,
            itemBuilder: (context, index) {
              final category =
                  categoryDocs[index].data() as Map<String, dynamic>;
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProductPage(),
                            ));
                      },
                      leading: Image(
                          image: NetworkImage(
                            category['image_url'],
                          ),
                          fit: BoxFit.cover),
                      title: Text(category['name'] ?? 'Unknown'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                    const Divider(
                      color: Colors.black12,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
