import 'dart:convert';
import 'dart:core';
import 'package:burgerjoint/Models/combo_product.dart';
import 'package:burgerjoint/Models/extra.dart';
import 'package:burgerjoint/Models/order.dart';
import 'package:burgerjoint/Models/product.dart';
import 'package:burgerjoint/Models/size.dart';
import 'package:burgerjoint/Utils/global.dart';
import 'package:http/http.dart' as http;

class OrderController {

  static Future<Map<String, dynamic>> storeOrder(String url, Order order, String comment,String token) async
  {

    Map<String, dynamic> orderToJson = {

      'branch_id':Global.branch.branchId,
      'total': order.total,
      "total_after":  order.totalAfter,
      "products": Product.convertToJson(order.products),
      'packages': order.packages.isEmpty ? null : Product.convertToJson(order.packages),
      'order_type': 3,
      'payment_method': 3,
      "transaction_reference": "",
      'comment': comment,
      'edit': false,
      'offer_id':null,
      'address_id':order.addressId
    };

    print(orderToJson);
    Uri uri = Uri.parse(url);




    final response = await http.post(uri,
        headers: {
          "Content-Type": "application/json",
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode(orderToJson));

  var message=json.encode(orderToJson);
    print(message);
    print(json.decode(response.body)['message']);
    Map<String, dynamic> convertDataToJson = json.decode(response.body);

    return convertDataToJson;

  }

  static Future<List<Order>> getOrders(String url,String token) async
  {

    Uri uri = Uri.parse(url);
    final response = await http.get(uri,
        headers: {
          "Content-Type": "application/json",
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        }, );

    print(json.decode(response.body));
    List<dynamic> data = json.decode(response.body);
    print(data);

    List<Order>orders=[];

    for(int index=0;index<data.length;index++){

      List<Product> productsOrderHistory=[];
      List<Product> packagesOrderHistory=[];

      for(int i=0;i<data[index]['products'].length;i++){

        /***DONE***/
        //for the EXTRA items in product
        List<Extra>extras=[];
        var extraData = data[index]['products'][i]['extra'];
        if(extraData!=false){
          for(int j=0;j<extraData.length;j++) {
            Extra extra = new Extra.forExtraOrderHistory(
                extraData[j]['product_id'],
                extraData[j]['product_name'],
                extraData[j]['price']);
            extras.add(extra);
          }
        }

        /***DONE***/
        //for the WITHOUT items in product
        List<Without>withOuts=[];
        var withoutData = data[index]['products'][i]['without'];
        if(withoutData!=false){
          for(int j=0;j<withoutData.length;j++) {
            Without without = new Without.forWithoutOrderHistory(
                withoutData[j]['product_id'],
                withoutData[j]['product_name']);
            withOuts.add(without);
          }
        }


        /*** DONE ***/
        //for the combo items in product
        List<ComboProduct> comboProducts = [] ;
        var comboProductData = data[index]['products'][i]['combo_size'];
        List<Item>items=[];
        if(comboProductData!=false){
          for(int j=0;j<comboProductData['combo_products'].length;j++) {
            Item item = new Item.forItemOrderHistory(comboProductData['combo_products'][j]['product_name'], comboProductData['combo_products'][j]['product_size']);
            items.add(item);
          }

          ComboProduct comboProduct = new ComboProduct(
              comboProductData['size_id'],
              comboProductData['size_name'],
              comboProductData['size_price'],
              items);
          comboProducts.add(comboProduct);
        }

        /*** ------------------------------------------------***/


        Product product = new Product.historyProduct(
            data[index]['products'][i]['product_name'],
            extras,
            data[index]['products'][i]['combo'],
            comboProducts,
            data[index]['products'][i]['price'],
            data[index]['products'][i]['quantity']);

        productsOrderHistory.add(product);
      }


















      Order order = new Order.getOrder(
          data[index]['branch_name'],
          data[index]['total'],
          data[index]['total_after'],
          productsOrderHistory,
          data[index]['packages'] == false? [] : packagesOrderHistory,
          data[index]['payment_method'],
          data[index]['delivery_fees'],
          data[index]['order_status'],
          data[index]['order_code'],
          data[index]['order_id']);
    orders.add(order);
    }

    return orders;

  }
 
  
}