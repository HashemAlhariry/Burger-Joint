import 'dart:convert';
import 'package:burgerjoint/Models/home_page_categories.dart';
import 'package:http/http.dart' as http;


class HomePageCategoriesController{

  static Future<HomePageCategory> getNearestBranch(String url) async {

    Uri uri = Uri.parse(url);
    final response = await http.post(uri, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    Map<String, dynamic> convertDataToJson = json.decode(response.body);


    return convertDataToJson['categories'];

  }



}