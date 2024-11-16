import 'dart:convert';
import 'package:apii/makeup/PostModel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://makeup-api.herokuapp.com/api/v1/';

  Future<List<PostModel>> fetchPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/products.json'));

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((json) => PostModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}