class PlantModel {
  final int id;
  final String name;
  final String imagePath;
  final double price;
  final String description;
  final String category;

  PlantModel({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.price,
    required this.description,
    required this.category,
  });

  factory PlantModel.fromJson(Map<String, dynamic> json) {
    return PlantModel(
      id: json['id'],
      name: json['name'],
      imagePath: json['imagePath'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
    );
  }
}
