import 'package:top_notch_v2/models/product/product_model.dart';

class CartModel {
  List<ProductModel> products;
  Map<ProductModel, int>? cart;
  int? totalprice;

  CartModel({required this.products, this.cart ,this.totalprice});
}
