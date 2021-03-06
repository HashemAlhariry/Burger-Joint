import 'dart:convert';
import 'package:burgerjoint/Models/user.dart';
import 'package:http/http.dart' as http;


class UserAuthentication{

  static Future<Map<String, dynamic>> signUp(String url, User user) async {
   try{

    final Uri uri = Uri.parse(url);
    final response = await http.post(uri,
        headers: {"Content-Type": "application/json",'Accept': 'application/json',},
        body: json.encode({

          "name": user.name,
          "username":user.userName,
          "password": user.password,
          "phone": user.phone,
          "gender": user.gender

        }));

      Map<String, dynamic> convertDataToJson = json.decode(response.body) as Map<String,dynamic>;
      return convertDataToJson;

   }
   catch (exception) {
     print(exception);
     return Map();
   }

  }

  static Future<Map<String, dynamic>> logIn(
      String url, String userName, String password) async {

    Uri uri = Uri.parse(url);
    final response = await http.post(uri,
        headers: {"Content-Type": "application/json",   'Accept': 'application/json'},
        body: json.encode({
        "client_secret": "iBm7t3vgbFhJUbHXDIehiA25tTvuzaWgBQYG2tGY",
        "client_id": 16,
        "grant_type": "password",
        "username": userName,
        "password": password,
        }));
    Map<String, dynamic> convertDataToJson = json.decode(response.body) as Map<String,dynamic>;
    return convertDataToJson;

  }


}