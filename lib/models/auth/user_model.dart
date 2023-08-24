import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';


@JsonSerializable()
class UserModel {
  final String name;
  final String email;
  final String password;
  final String address;
  final String phone_number;

  UserModel(
      {required this.name,
      required this.email,
      required this.password,
      required this.address,
      required this.phone_number});

       factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}


