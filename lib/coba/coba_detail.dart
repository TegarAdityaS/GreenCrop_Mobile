import 'package:flutter/material.dart';
import 'package:ui_13/core/color.dart';
import 'package:ui_13/api_data/plant_model.dart';

class DetailsPage extends StatelessWidget {
  final PlantModel plant;
  const DetailsPage({Key? key, required this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              plant.name,
              style: TextStyle(
                color: black.withOpacity(0.8),
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Category: ${plant.category}', // Pastikan kategori tersedia di model PlantModel
              style: TextStyle(
                color: black.withOpacity(0.5),
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 20),
            Text(
              plant.description, // Pastikan deskripsi tersedia di model PlantModel
              style: TextStyle(
                color: black.withOpacity(0.5),
                fontSize: 15.0,
                height: 1.4,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Treatment', // Sesuaikan jika tidak relevan
              style: TextStyle(
                color: black.withOpacity(0.9),
                fontSize: 18.0,
                height: 1.4,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset('assets/icons/sun.png', color: black, height: 24.0),
                Image.asset('assets/icons/drop.png', color: black, height: 24.0),
                Image.asset('assets/icons/temperature.png', color: black, height: 24.0),
                Image.asset('assets/icons/up_arrow.png', color: black, height: 24.0),
              ],
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                onPressed: () {
                  // Implementasikan aksi pembelian di sini
                },
                child: Text(
                  'Buy \$${plant.price.toStringAsFixed(0)}',
                  style: TextStyle(
                    color: white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
