import 'dart:convert';

import 'package:http/http.dart%20';
import 'package:top_notch_v2/LocalRepo.dart';
import 'package:top_notch_v2/end_points.dart';
import 'package:top_notch_v2/locator.dart';
import 'package:http/http.dart' as http;
import 'package:top_notch_v2/models/cart_model.dart';

class CartService {
  var token = locator.get<LocalRepo>().token;

  Future<bool> addtocart(int productid) async {
    try {
      final url = Uri.parse('${Endpoints.cart}/add');
      print('try');
      final request = await http.post(
          headers: {"Authorization": "Bearer $token"},
          url,
          body: {
            'product_id': productid.toString(),
          });
      var data = jsonDecode(request.body);
      if (request.statusCode == 200) {
        
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> emtpycart() async {
    final url = Uri.parse('${Endpoints.cart}/empty');
    final request =
        await http.delete(url, headers: {"Authorization": "Bearer $token"});
    var data = jsonDecode(request.body);
    print(data);
    if (request.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<dynamic> getcart() async {
    final url = Uri.parse(Endpoints.cart);
    final request =
        await http.get(url, headers: {'Authorization': 'Bearer $token'});
    var data = jsonDecode(request.body);
    return data;
  }

  Future<bool> decreasequanitiy(int id) async {
    final url = Uri.parse('${Endpoints.cart}/remove/${id}');
    final request =
        await http.delete(url, headers: {"Authorization": "Bearer $token"});
    print(request.statusCode);
    print('decrease');
    if (request.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> deletefromcart(int id) async {
    final url = Uri.parse('${Endpoints.cart}/delete/${id}');
    final request =
        await http.delete(url, headers: {"Authorization": "Bearer $token"});
    if (request.statusCode == 200) {
      return true;
    }
    return false;
  }
}
