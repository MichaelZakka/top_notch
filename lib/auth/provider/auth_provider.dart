import 'package:flutter/material.dart';
import 'package:top_notch_v2/auth/service/auth_service.dart';
import 'package:top_notch_v2/models/auth/user_model.dart';
import 'package:top_notch_v2/locator.dart';
import 'package:top_notch_v2/LocalRepo.dart';

class AuthProvider with ChangeNotifier {
  Authservice _service = Authservice();

  Future<bool> login(String email, String password) async {
    try {
      final success = await _service.login(email, password);
      if (success) {
        locator.get<LocalRepo>().vartoken(_service.token!);
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> register(String name, String email, String password,
      String address, String phonenumber, String password_confirmation) async {
    try {
      UserModel newuser = UserModel(
          name: name,
          email: email,
          password: password,
          address: address,
          phone_number: phonenumber);
      print('hh');
      final success = await _service.register(newuser, password_confirmation);
      // print('test');
      print(success);
      return success;
    } catch (e) {
      return false;
    }
  }

  logout() async {
    final _localservice = LocalRepo();
    locator.get<LocalRepo>().token = null;
    final success = await _service.logout();
    var loggedout = await _localservice.clear();
    if (success) {
      return true;
    }
    return false;
  }

  Future userinfo() async {
    try {
      final getdata = await _service.userinfo();
      UserModel user = UserModel(
          name: getdata['name'],
          email: getdata['email'],
          password: '',
          address: getdata['address'],
          phone_number: getdata['phone_number']);
      return user;
    } catch (e) {
      print(e);
    }
  }
}
