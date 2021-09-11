import 'dart:convert';
import 'package:burgerjoint/Models/address.dart';
import 'package:burgerjoint/Utils/global.dart';
import 'package:http/http.dart' as http;

class AddressController{

  static Future<Map<String,dynamic>> addAddress(Address address,String url,String token) async {
    try {
      Uri uri = Uri.parse(url);
      final response = await http.post(uri,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
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
            return json.decode(response.body)['address'];
        } else {
          return  {'address':''};
        }
      } else {

        throw Exception('Failed to load data');

      }
    } catch (exception) {
      print(exception);
      return  {'address':''};

    }
  }

}