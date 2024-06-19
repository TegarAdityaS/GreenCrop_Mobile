import 'package:flutter/material.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 83, 181, 78),
        elevation: 0,
        title: const Text(
          'Cari kebutuhan pertanian anda !',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'What do you want to order?',
                hintStyle: TextStyle(color: Color.fromARGB(188, 188, 179, 179)),
                prefixIcon: const Icon(Icons.search, color: Colors.white54),
                filled: true,
                fillColor: Colors.grey[850],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            child: ListView(
              children: const [
                ProductItem(
                  imagePath: 'assets/images/urea.png',
                  title: 'Pupuk Urea',
                  store: 'Warung Herbal',
                  price: '100k',
                ),
                ProductItem(
                  imagePath: 'assets/images/pupukmahkota.png',
                  title: 'Pupuk Mahkota',
                  store: 'Wijie Resto',
                  price: '200k',
                ),
                ProductItem(
                  imagePath: 'assets/images/pupuknpk.jpg',
                  title: 'NPK Padi',
                  store: 'Noodle Home',
                  price: '\$15',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String store;
  final String price;

  const ProductItem({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.store,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        color: Colors.grey[850],
        child: ListTile(
          leading: Image.asset(imagePath, width: 50, height: 50),
          title: Text(title, style: TextStyle(color: Colors.white)),
          subtitle: Text(store, style: TextStyle(color: Colors.white54)),
          trailing: Text(
            price,
            style: const TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
