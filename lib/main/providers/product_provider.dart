
import 'package:flutter/foundation.dart';
import 'package:top_notch_v2/main/service/product_service.dart';
import 'package:top_notch_v2/models/product/product_model.dart';
// import 'package:top_notch_v2/models/sorting/GenderCategory_model.dart';
// import 'package:top_notch_v2/models/sorting/category_model.dart';

class ProductProvider with ChangeNotifier {
  productservice _productservice = productservice();

  Future<bool> AddProduct(
    String name,
    String description,
    double price,
    int quantity,
    String image,
    String category,
    String gendercategory,
  ) async {
    ProductModel newproduct = ProductModel(
      name: name,
      description: description,
      price: price,
      image: image,
      quantity: quantity,
      category: category,
      genderCategory: gendercategory,
      reviews: 3,
      reviews_count: 10,
    );
    final success = await _productservice.addProduct(newproduct);

    // print(success);
    return success;
  }

  Future<List<ProductModel>> getProducts(String c, String gc, String s) async {
    List<ProductModel> products = [];

    try {
      List<dynamic> apiProducts = await _productservice.getproducts(c, gc, s);

      for (var productData in apiProducts) {
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

      return products;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<ProductModel> getproductbyid(int id) async {
    final data = await _productservice.getproductbyid(id);
    ProductModel product = ProductModel(
        name: data["name"],
        description: data["description"],
        category: data["category"].toString(),
        genderCategory: data["gender_category"].toString(),
        image: data["image"],
        price: double.parse(data["price"]),
        quantity: data["quantity"],
        reviews: data["reviews"].toDouble(),
        reviews_count: data["reviews_count"]);
    return product;
  }

  Future<bool> addreview(int id, double rating) async {
    try {
      final success = await _productservice.addreview(rating, id);
      return success;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<ProductModel>> search(String name) async {
    List<ProductModel> result = [];
    try {
      List<dynamic> apiproducts = await _productservice.search(name);
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
        result.add(product);
      }
      print('searchhhh');
      return result;
    } catch (e) {
      print(e);
      return [];
    }
  }

}
