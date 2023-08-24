import 'package:flutter/material.dart';
import 'package:top_notch_v2/features/service/order_service.dart';
import 'package:top_notch_v2/models/product/product_model.dart';

class OrderProvider with ChangeNotifier {
  OrderService _orderService = OrderService();

  Future<List<ProductModel>> userproducts() async {
    List<ProductModel> products = [];
    try {
      List<dynamic> apiproducts = await _orderService.userproducts();
      for (var productData in apiproducts) {
        ProductModel product = ProductModel(
            id: productData['id'],
            name: productData['name'],
            description: productData["description"],
            category: productData["category"].toString(),
            genderCategory: productData["gender_category"].toString(),
            image: productData["image"],
            price: double.parse(productData["price"]),
            quantity: productData["quantity"],
            reviews: productData["reviews"].toDouble(),
            reviews_count: productData["reviews_count"]);
        products.add(product);
      }
      print(products);
      return products;
    } catch (e) {
      print(e);
      return products;
    }
  }

  Future<List<ProductModel>> orderhistory() async {
    List<ProductModel> products = [];
    try {
      List<dynamic> apiproducts = await _orderService.userorders();
      for (var productData in apiproducts) {
        ProductModel product = ProductModel(
            id: productData['id'],
            name: productData['name'],
            description: productData["description"],
            category: productData["category"].toString(),
            genderCategory: productData["gender_category"].toString(),
            image: productData["image"],
            price: double.parse(productData["price"]),
            quantity: productData["quantity"],
            reviews: productData["reviews"].toDouble(),
            reviews_count: productData["reviews_count"]);
        products.add(product);
      }
      print(products);
      return products;
    } catch (e) {
      print(e);
      return products;
    }
  }

  Future<bool> makeanorder() async {
    try {
      final success = await _orderService.makeanorder();
      print(success);
      return success;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
