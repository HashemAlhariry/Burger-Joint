import 'dart:convert';
import 'dart:core';
import 'package:burgerjoint/Models/order.dart';
import 'package:burgerjoint/Models/product.dart';
import 'package:burgerjoint/Utils/global.dart';
import 'package:http/http.dart' as http;
class OrderController {

  static Future<Map<String, dynamic>> storeOrder(String url, Order order, String comment,String token) async
  {

    Map<String, dynamic> orderToJson = {

      'branch_id':Global.branch.branchId,
      'total': order.total ,
      "total_after":  order.totalAfter,
      "products": Product.convertToJson(order.products).map((e) => e.toJson()).toList(),
      'packages': order.packages.isEmpty ? null : Product.convertToJson(order.packages).map((e) => e.toJson()).toList(),
      'order_type': 3,
      'payment_method': 3,
      "transaction_reference": "",
      'comment': comment,
      'edit': false,
      'combo_products':[]
    };

    Uri uri = Uri.parse(url);




    final response = await http.post(uri,
        headers: {
          "Content-Type": "application/json",
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode(orderToJson));

    print(json.decode(response.body)['message']);
    Map<String, dynamic> convertDataToJson = json.decode(response.body);

    return convertDataToJson;


  }


 
  
}