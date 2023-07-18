import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pieproject/models/product.dart';

class ProductService {
  Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

      if (response.statusCode == 200) {
        final List<dynamic> productData = json.decode(response.body);
        return productData.map((data) => Product.fromJson(data)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print('Error fetching products: $e');
      throw Exception('Failed to load products');
    }
  }
}
