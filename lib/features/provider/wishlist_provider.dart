import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:top_notch_v2/features/screens/cart_screen.dart';
import 'package:top_notch_v2/features/service/wishlist_service.dart';
import 'package:top_notch_v2/main/providers/product_provider.dart';
import 'package:top_notch_v2/main/service/product_service.dart';
import 'package:top_notch_v2/models/product/product_model.dart';
import 'package:top_notch_v2/models/wishlist_model.dart';

class WishlistProvider with ChangeNotifier {
  WishlistService _wishlistService = WishlistService();
  productservice _productservice = productservice();
  Future<bool> addtowishlist(int? productid) async {
    final success = await _wishlistService.addtowishlist(productid);
    if (success) {}
    print(success);
    return success;
  }

  Future<bool> removefromwishlist(int? productid) async {
    final success = await _wishlistService.removefromwishlist(productid);
    if (success) {
    }
    print(success);
    return success;
  }

  Future<WishlistModel> getwishlist() async {
    WishlistModel wishlist = WishlistModel(products: []);
    try {
      print('hi');
      List<dynamic> apiwishlist = await _wishlistService.getwishlist();
      for (var productData in apiwishlist) {
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
        wishlist.products.add(product);
      }
      return wishlist;
    } catch (e) {
      print(e);
      return wishlist;
    }
  }
}
