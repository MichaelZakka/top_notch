// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id:json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      price: double.parse(json['price']),
      image: json['image'] as String,
      quantity: json['quantity'] as int,
      category: json['category'].toString() as String,
      genderCategory: json['genderCategory'].toString() as String,
      reviews: json['reviews'] ,
      reviews_count: json['reviews_count'],
    );

Map<String, String> _$ProductModelToJson(ProductModel instance) =>
    <String, String>{
      'id':instance.id.toString(),
      'name': instance.name,
      'description': instance.description,
      'price': instance.price.toString(),
      'image': instance.image,
      'quantity': instance.quantity.toString(),
      'category': instance.category,
      'genderCategory': instance.genderCategory,
      'reviews': instance.reviews.toString(),
      'reviews_count':instance.reviews_count.toString()

    };
