// services/auth_service.dart
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  final String apiUrl = 'https://dummyjson.com/auth/login';

  Future<Map<String, dynamic>> login(String username, String password) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return {
        'status': true,
        'data': jsonDecode(response.body),
      };
    } else {
      return {
        'status': false,
        'message': 'Invalid username or password',
      };
    }
  }
}
