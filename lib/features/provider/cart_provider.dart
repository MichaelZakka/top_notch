import 'package:flutter/material.dart';
import 'package:top_notch_v2/features/service/cart_service.dart';
import 'package:top_notch_v2/models/cart_model.dart';
import 'package:top_notch_v2/models/product/product_model.dart';

class CartProvider with ChangeNotifier {
  CartService _cartService = CartService();

  Future<bool> addtocart(int id) async {
    final success = _cartService.addtocart(id);
    print(success);
    return success;
  }

  Future emptycart() async {
    final success = _cartService.emtpycart();
    print(success);
    return success;
  }

  Future<CartModel> getcart() async {
    CartModel cart = CartModel(products: [], cart: {}, totalprice: 0);
    try {
      dynamic apiwishlist = await _cartService.getcart();
      for (var productData in apiwishlist['cart']) {
        ProductModel product = ProductModel(
          id: productData['product']['id'],
          name: productData['product']['name'],
          description: productData['product']['description'],
          category: productData['product']['category'].toString(),
          genderCategory:
              productData['product']['gender_category'].toString(),
          image: productData['product']['image'],
          price: double.parse(productData['product']['price']),
          quantity: productData['product']['quantity'],
          reviews: productData['product']['reviews'].toDouble(),
          reviews_count: productData['product']['reviews_count']);
        cart.products.add(product);
        cart.cart![product] = productData['quantity'];
      }
      cart.totalprice = apiwishlist["totalPrice"];
      return cart;
    } catch (e) {
      print("object");
      print(e);
      return cart;
    }
  }

  Future<bool> decreasequanitiy(int id) async {
    try {
      final success = _cartService.decreasequanitiy(id);
      return success;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> deletefromcart(int id) async {
    try {
      final success = _cartService.deletefromcart(id);
      return success;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
