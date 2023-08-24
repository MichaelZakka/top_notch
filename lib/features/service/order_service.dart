import 'dart:convert';

import 'package:http/http.dart%20';
import 'package:top_notch_v2/end_points.dart';
import 'package:http/http.dart' as http;
import 'package:top_notch_v2/locator.dart';
import 'package:top_notch_v2/LocalRepo.dart';

class OrderService {
  var token = locator.get<LocalRepo>().token;

  Future<dynamic> userproducts() async {
    final url = Uri.parse(Endpoints.userproducts);
    final request =
        await http.get(url, headers: {"Authorization": "Bearer $token"});
    var data = jsonDecode(request.body);
    return data;
  }

  
  Future<dynamic> userorders() async{
    final url = Uri.parse('${Endpoints.order}/get');
    final request = await http.get(url , headers: {"Authorization": "Bearer $token"});
    var data = jsonDecode(request.body);
    print(request.statusCode);
    return data;
  }

  // Future<dynamic> orderhistory() async {
  //   final url = Uri.parse('${Endpoints.order}/get');
  //   final request =await http.get(url,)
  // }

  Future<bool>makeanorder ()async{
    final url = Uri.parse(Endpoints.order);
    final request = await http.get(url , headers: {"Authorization" : "Bearer $token"});
    print(request.statusCode);
    if(request.statusCode == 200){
      return true;
    }
    return false;
  }
}
