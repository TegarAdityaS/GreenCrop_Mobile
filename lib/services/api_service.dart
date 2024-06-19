import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ui_13/api_data/category_model.dart';
import 'package:ui_13/api_data/plant_model.dart';

class ApiService {
  static const String baseUrl = 'https://example.com/api';

  Future<List<CategoryModel>> fetchCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/categories'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => CategoryModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<List<PlantModel>> fetchPlants(int categoryId) async {
    final response = await http.get(Uri.parse('$baseUrl/plants?category_id=$categoryId'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => PlantModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load plants');
    }
  }
}