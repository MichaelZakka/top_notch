import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart%20';
import 'package:top_notch_v2/end_points.dart';
import 'package:top_notch_v2/models/auth/user_model.dart';

class Authservice {
  Map<String, String> headers = {"Accept": "application/json"};

  String? token;
  Future<bool> login(String email, String password) async {
    final url = Uri.parse(Endpoints.login);
    final response = await http.post(url,
        body: <String, String>{'email': email, 'password': password});
    var js = jsonDecode(response.body);
    if (response.statusCode == 200) {
      token = js['token'];
      print(token);
      return true;
    }
    print('failed');
    return false;
  }

  Future<bool> register(UserModel user, String password_confirmation) async {
    final url = Uri.parse(Endpoints.register);
    final request = await http.post(url, headers: headers, body: {
      'name': user.name,
      'email': user.email,
      'password': user.password,
      'password_confirmation': password_confirmation,
      'address': user.address,
      'phone_number': user.phone_number
    });
    var response = jsonDecode(request.body);

    if (request.statusCode == 200) {
      token = response['token'];

      print('success');
      return true;
    }
    return false;
  }

  Future<bool> logout() async {
    final url = Uri.parse(Endpoints.logout);
    final request = await http.post(url, headers: headers);
    if (request.statusCode == 401) {
      print('logged out');
      return true;
    }
    return false;
  }

  Future userinfo() async {
    try {
      final url = Uri.parse(Endpoints.user);
      final request =
          await http.get(url, headers: {"Authorization": "Bearer $token"});
      var data = jsonDecode(request.body);
      return data["user"];
    } catch (e) {
      print(e);
    }
  }
}
