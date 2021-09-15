import 'dart:convert';
import 'package:burgerjoint/Models/address.dart';
import 'package:burgerjoint/Utils/global.dart';
import 'package:http/http.dart' as http;

class AddressController{

  static Future<Map<String,dynamic>> addAddress(Address address,String url,String token) async {
    try {
      Uri uri = Uri.parse(url);
      final response = await http.post(
          uri,
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
            "apartment":int.parse(address.apartment),
            "latitude":address.latitude,
            "longitude":address.longitude
          }));

      if (response.statusCode == 200){
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

  static Future<List<Address>> getAddress(String url,String token) async {
    try {
      Uri uri = Uri.parse(url);
      final response = await http.get(uri,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token'
          },);
      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          List<Address> addresses=[];
          var userAddresses=json.decode(response.body)['addresses'];
          for(int i=0;i<userAddresses.length;i++){

              Address address= new Address(
                  userAddresses[i]['title'],
                  userAddresses[i]['branch_id'],
                  userAddresses[i]['country'],
                  userAddresses[i]['city'],
                  userAddresses[i]['zone_id'],
                  userAddresses[i]['region'],
                  userAddresses[i]['address'],
                  userAddresses[i]['building'],
                  userAddresses[i]['apartment'].toString(),
                  userAddresses[i]['floor'],
                  userAddresses[i]['comment']?? "",
                  userAddresses[i]['id'],
                  double.parse(userAddresses[i]['latitude']),
                  double.parse(userAddresses[i]['longitude'])
                  );

                addresses.add(address);
          }
          
          return addresses;
        } else {
          return  [];
        }
      } else {

        throw Exception('Failed to load data');

      }
    } catch (exception) {
      print(exception);
      return  [];
    }
  }
}