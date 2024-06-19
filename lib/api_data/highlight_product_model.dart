class Product {
  final String name;
  final String imageUrl;

  Product({required this.name, required this.imageUrl});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      imageUrl: json['imageUrl'],
    );
  }
}