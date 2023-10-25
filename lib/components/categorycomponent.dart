import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medshop/screens/productPage.dart';
import '../../provider/categoryProvider/categoryProvider.dart';

class Category extends StatefulWidget {
  final bool isListView; // Add a parameter to specify layout type
  const Category({Key? key, required this.isListView}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
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

          // Use a ListView or GridView based on the layout type
          return widget.isListView
              ? ListView.builder(
                  itemCount: categoryDocs.length,
                  itemBuilder: (context, index) {
                    return _buildListItem(categoryDocs[index].data());
                  },
                )
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // You can adjust the number of columns
                  ),
                  itemCount: categoryDocs.length,
                  itemBuilder: (context, index) {
                    return _buildGridItem(categoryDocs[index].data());
                  },
                );
        },
      ),
    );
  }

  Widget _buildListItem(dynamic data) {
    final category =
        data as Map<String, dynamic>; // Cast the data to Map<String, dynamic>
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
                ),
              );
            },
            leading: Image(
              image: NetworkImage(category['image_url']),
              fit: BoxFit.cover,
            ),
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
  }

  Widget _buildGridItem(dynamic data) {
    final category =
        data as Map<String, dynamic>; // Cast the data to Map<String, dynamic>
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ProductPage(),
            ),
          );
        },
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                height: 50,
                image: NetworkImage(category['image_url']),
                fit: BoxFit.cover,
              ),
              Text(category['name'] ?? 'Unknown'),
            ],
          ),
        ),
      ),
    );
  }
}
