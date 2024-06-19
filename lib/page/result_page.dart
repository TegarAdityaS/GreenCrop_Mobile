import 'package:flutter/material.dart';
import 'package:ui_13/data/plants_model.dart';
import 'package:ui_13/data/product_model.dart';

class ResultPage extends StatelessWidget {
  final String category;
  final Plant plant;

  ResultPage({required this.category, required this.plant});

  @override
  Widget build(BuildContext context) {
    // Filter produk berdasarkan kategori dan jenis tanaman
    List<Product> filteredProducts = products.where((product) {
      return product.category == category && (product.plantType == plant.name || product.plantType == 'Semua');
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Rekomendasi $category'),
        backgroundColor: Color.fromARGB(255, 83, 181, 78),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hasil perhitungan rekomendasi $category',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Tanaman: ${plant.name}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            filteredProducts[index].image,
                            height: 50,
                            width: 50,
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  filteredProducts[index].name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  filteredProducts[index].description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Harga: Rp${filteredProducts[index].price.toStringAsFixed(0)}',
                                  style: TextStyle(color: Colors.green),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
