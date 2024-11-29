
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataModel {
  final int id;
  final String name; 
  final String email;
  final String username;
  final String phone;

  DataModel({
    required this.id,
    required this.name,
    required this.email,
    required this.username,
    required this.phone,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      username: json['username'],
      phone: json['phone'],
    );
  }
}


class ApiClient {
  final String apiUrl = 'https://jsonplaceholder.typicode.com/users';

  Future<List<DataModel>> fetchData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => DataModel.fromJson(data as Map<String, dynamic>)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}