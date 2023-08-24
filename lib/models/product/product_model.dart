import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
// import 'package:top_notch_v2/models/sorting/category_model.dart';
// import 'package:top_notch_v2/models/sorting/gendercategory_model.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  int? id;
  String name;
  String description;
  double price;
  String image;
  int quantity;
  String category;
  String genderCategory;
  double reviews;
  int reviews_count;
  bool isinwishlist;

  ProductModel(
      {this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.image,
      required this.quantity,
      required this.category,
      required this.genderCategory,
      required this.reviews,
      required this.reviews_count,
      this.isinwishlist = false});
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, String> toJson() => _$ProductModelToJson(this);
}
