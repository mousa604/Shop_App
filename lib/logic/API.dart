import 'dart:convert';
import 'package:amit_shop/models/productsVM.dart';
import 'package:http/http.dart' as http;
import 'package:amit_shop/models/categoriesVM.dart';

class API{
  static Future<CategoriesVm> getCategories() async
  {
    String url = "https://retail.amit-learning.com/api/categories";

    final response = await http.get(Uri.parse(url));

    return CategoriesVm.fromJson(Map<String, dynamic>.from(json.decode(response.body.toString())));
  }

  static Future<ProductsVm> getProducts() async
  {
    String url = "https://retail.amit-learning.com/api/products";

    final response = await http.get(Uri.parse(url));

    return ProductsVm.fromJson(Map<String, dynamic>.from(json.decode(response.body.toString())));
  }
}