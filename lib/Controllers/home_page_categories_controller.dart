import 'dart:convert';
import 'package:burgerjoint/Models/home_page_categories.dart';
import 'package:http/http.dart' as http;


class HomePageCategoriesController{

  static Future<List<HomePageCategory>> homePageCategories(String url) async {
    List<HomePageCategory>homePageCategory=[];
    Uri uri = Uri.parse(url);
    try{
      final response = await http.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });
      Map<String, dynamic> convertDataToJson = json.decode(response.body);

      dynamic categories = convertDataToJson['categories'];

      for(int i=0;i<categories.length;i++){
          HomePageCategory homePageCategoryObject =  HomePageCategory(
              categories[i]['category_image'] ?? "",
              categories[i]['category_id'],
              categories[i]['category_name'],
              categories[i]['category_icon']);

          homePageCategory.add(homePageCategoryObject);
      }
      return homePageCategory;
    }catch (exception){
      print("ERROR");
      return homePageCategory;
    }

  }



}