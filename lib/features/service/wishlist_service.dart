import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:top_notch_v2/end_points.dart';
import 'package:http/http.dart' as http;
import 'package:top_notch_v2/locator.dart';
import 'package:top_notch_v2/LocalRepo.dart';
import 'package:top_notch_v2/main/providers/product_provider.dart';

class WishlistService {
  var token = locator.get<LocalRepo>().token;

  Future<bool> addtowishlist(int? productid) async {
    final url = Uri.parse('${Endpoints.wishlist}/add/${productid}');

    final request =
        await http.post(url, headers: {"Authorization": "Bearer $token"});
    var data = jsonDecode(request.body);
    print(data);
    if (request.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> removefromwishlist(int? productid) async {
    final url = Uri.parse('${Endpoints.wishlist}/remove/${productid}');
    final request =
        await http.delete(url, headers: {"Authorization": "Bearer $token"});
    var data = jsonDecode(request.body);
    print(data);
    if (request.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<dynamic> getwishlist() async {
    final url = Uri.parse(Endpoints.wishlist);
    final request =
        await http.get(url, headers: {"Authorization": "Bearer $token"});
    var data = jsonDecode(request.body);
    return data['wishlist'];
  }
}
