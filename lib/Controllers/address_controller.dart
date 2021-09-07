import 'dart:convert';
import 'package:burgerjoint/Models/address.dart';
import 'package:burgerjoint/Utils/global.dart';
import 'package:http/http.dart' as http;

class AddressController{

  static Future<int> addAddress(Address address,String url,String token) async {
    try {
      Uri uri = Uri.parse(url);
      final response = await http.post(uri,
          headers: {
            'Authorization': 'Bearer $token'
          },
          body: json.encode({
            "title": address.title,
            "branch_id": Global.branch.branchId,
            "country": address.country,
            "city": address.city,
            "region": address.region,
            "address": address.address,
            "building": address.building,
            "floor": address.floor,
            "apartment":address.apartment,
          }));
      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {

          if (json.decode(response.body)['address']['id']>0)
            return json.decode(response.body)['address']['id'];
          else
            return -1;
        } else {
          return -1;
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (exception) {
      print(exception);
      return -1;
    }
  }

}