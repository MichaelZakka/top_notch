import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart%20';
import 'package:top_notch_v2/LocalRepo.dart';
import 'package:top_notch_v2/end_points.dart';
import 'package:top_notch_v2/locator.dart';
import 'package:top_notch_v2/models/product/product_model.dart';

class productservice {
  // String? message;
  var token = locator.get<LocalRepo>().token;
  Map<String, String> headers = {
    "Accept": "application/json",
  };

  Future<bool> addProduct(ProductModel product, {File? image}) async {
    final url = Uri.parse(Endpoints.products);
    final request = http.MultipartRequest('POST', url);
    request.files.add(await http.MultipartFile.fromPath('image', product.image,
        filename: product.image.split('/').last));
    request.headers.addAll(
        {"Accept": "application/json", "Authorization": "Bearer $token"});
    request.fields.addAll(product.toJson());
    http.Response response =
        await http.Response.fromStream(await request.send());
    var res = jsonDecode(response.body);
    print(res);
    if (response.statusCode == 200) {
      return true;
    } else {
      // message = res['message'];
      // print(message);
      return false;
    }
  }

  Future<List<dynamic>> getproducts(
      String category, String gendercategory, String sort) async {
    final url = Uri.parse(Endpoints.sort);
    final request = await http.post(
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        },
        url,
        body: {
          'gender_category': gendercategory,
          'price': sort,
          'category': category
        });
    print(request.statusCode);
    var data = jsonDecode(request.body);

    return data;
  }

  Future getproductbyid(int id) async {
    final url = Uri.parse('${Endpoints.getproductbyid}/${id}');
    final request = await http.get(headers: {
      "Authorization": "Bearer $token",
      "Accept": "application/json"
    }, url);
    var product = jsonDecode(request.body);
    print(product);
    return product;
  }

  Future<bool> addreview(double rating, int id) async {
    final url = Uri.parse(Endpoints.reviews);
    print('review');
    final request = await http.post(url,
        headers: {"Authorization": "Bearer $token"},
        body: {"product_id": id.toString(), "rating": rating.toString()});
    final response = jsonDecode(request.body);
    print(response);
    if (request.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<List<dynamic>> search(String name) async {
    final url = Uri.parse(Endpoints.search);
    print('search');
    final request = await http.post(url,
        headers: {"Authorization": "Bearer $token"}, body: {"search": name});
    var response = jsonDecode(request.body);
    return response['data'];
  }
}
