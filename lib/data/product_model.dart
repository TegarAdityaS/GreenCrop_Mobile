class Product {
  final String name;
  final String image;
  final double price;
  final String description;
  final String plantType;
  final String category;

  Product({
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    required this.plantType,
    required this.category,
  });
}

List<Product> products = [
  Product(
    name: 'BISI 99',
    image: 'assets/images/bisi99.png',
    price: 150000,
    description: 'Benih jagung hibrida BISI 99 dengan ketahanan terhadap penyakit.',
    plantType: 'Jagung',
    category: 'Bibit',
  ),
  Product(
    name: 'Urea (46-00-00)',
    image: 'assets/images/urea.png',
    price: 50000,
    description: 'Pupuk UREA adalah pupuk tunggal yang mengandung 46% Nitrogen di dalamnya.',
    plantType: 'Semua',
    category: 'Pupuk',
  ),
  // Tambahkan produk lainnya di sini
];
