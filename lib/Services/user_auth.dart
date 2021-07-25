import 'dart:convert';
import 'package:burgerjoint/Models/user.dart';
import 'package:http/http.dart' as http;


class UserAuthentication{

  static Future<Map<String, dynamic>> signUp(String url, User user) async {
    Uri uri = Uri.parse(url);
    final response = await http.post(uri,
        headers: {"Content-Type": "application/json",       'Accept': 'application/json',},
        body: json.encode({
          "name": user.name,
          "email": user.email,
          "password": user.password,
          "phone": user.mobileNumber
        }));
    Map<String, dynamic> convertDataToJson = json.decode(response.body);
    print(convertDataToJson['message']);
    return convertDataToJson;
  }

  static Future<Map<String, dynamic>> logIn(
      String url, String emailAddress, String password) async {
    Uri uri = Uri.parse(url);
    final response = await http.post(uri,
        headers: {"Content-Type": "application/json",   'Accept': 'application/json'},
        body: json.encode({"email": emailAddress, "password": password}));
    Map<String, dynamic> convertDataToJson = json.decode(response.body);
    print(convertDataToJson['message']);
    return convertDataToJson;
  }


}