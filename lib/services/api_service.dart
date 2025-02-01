import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ApiService {
  static const String apiUrl = "https://fakestoreapi.com/products";

  static Future<List<Product>> fetchProducts(int start, int limit) async {
    final response = await http.get(Uri.parse("$apiUrl?limit=$limit&start=$start"));

    print('response status ${response.statusCode}');
    print('response body:  ${response.body}');

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load products");
    }
  }
}