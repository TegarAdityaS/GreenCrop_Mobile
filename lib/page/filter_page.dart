import 'package:flutter/material.dart';
import 'result_page.dart';
import 'package:ui_13/data/plants_model.dart';

class FilterPage extends StatefulWidget {
  final String category;

  FilterPage({required this.category});

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  String? selectedPlant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('${widget.category} Filter'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Yuk lengkapi data berikut untuk mendapatkan hasil rekomendasi',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Jenis Tanaman',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              hint: Text('Pilih jenis tanaman'),
              value: selectedPlant,
              onChanged: (String? newValue) {
                setState(() {
                  selectedPlant = newValue;
                });
              },
              items: plants.map<DropdownMenuItem<String>>((Plant plant) {
                return DropdownMenuItem<String>(
                  value: plant.name,
                  child: Text(plant.name),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                if(selectedPlant != null) {
                  Plant selected = plants.firstWhere((plant) => plant.name == selectedPlant);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        category: widget.category,
                        plant: selected,
                      ),
                    ),
                  );
                } else {
                  // Show a message or handle the case when no plant is selected
                }
              },
              icon: Icon(Icons.search), // Menambahkan ikon kaca pembesar
              label: Text('Cari'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 83, 181, 78), // Mengubah warna background tombol
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)), // Membuat tombol bundar
              ),
            ),
          ],
        ),
      ),
    );
  }
}