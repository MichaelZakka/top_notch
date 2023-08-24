import 'package:top_notch_v2/models/auth/user_model.dart';
import 'package:top_notch_v2/models/product/product_model.dart';

class FavoriteProductModel {
  UserModel user;
  ProductModel product;

  FavoriteProductModel({required this.product, required this.user});
}
