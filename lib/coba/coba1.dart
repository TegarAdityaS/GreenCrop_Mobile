import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rekomendasi Pupuk',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _selectedPlantType;
  final List<String> _plantTypes = [
    'Tanaman A',
    'Tanaman B',
    'Tanaman C',
    'Tanaman D',
    'Tanaman E',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rekomendasi Pupuk'),
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
              value: _selectedPlantType,
              hint: Text('Jenis Tanaman'),
              onChanged: (newValue) {
                setState(() {
                  _selectedPlantType = newValue;
                });
              },
              items: _plantTypes.map((plantType) {
                return DropdownMenuItem(
                  child: Text(plantType),
                  value: plantType,
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text(
              'Luas Area',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'm2',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            Text(
              'Lokasi Lahan',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Pilih Lokasi',
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle the button press
                },
                child: Text('Hitung'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
