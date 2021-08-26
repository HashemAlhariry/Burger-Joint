import 'package:burgerjoint/Models/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductInCategoriesController{

  static Future<List<Product>> productInCategories(String url) async {
    List<Product>productsList=[];
    Uri uri = Uri.parse(url);
    try{
      final response = await http.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });
      Map<String, dynamic> convertDataToJson = json.decode(response.body);


      dynamic products = convertDataToJson['products'][0]['products'];
      for(int i=0;i<products.length;i++){
        Product product= new Product(products[i]['status'], products[i]['product_id'], products[i]['product_description']?? "",  products[i]['product_image'],  products[i]['product_title'],  products[i]['taxes']);
        productsList.add(product);
      }

      return productsList;
    }catch (exception){
      print("ERROR");
      return productsList;
    }
  }


}
