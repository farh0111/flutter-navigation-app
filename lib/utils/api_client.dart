import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_app_2/models/data_model.dart';



class ApiClient {
  final String apiUrl = 'https://jsonplaceholder.typicode.com/users';

  Future<List<DataModel>> fetchData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> users = jsonDecode(response.body);
      return users.map((user) => DataModel.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}