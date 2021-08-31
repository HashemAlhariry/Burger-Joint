import 'package:burgerjoint/Models/combo_product.dart';
import 'package:burgerjoint/Models/product.dart';
import 'package:burgerjoint/Models/size.dart';
import 'package:http/http.dart' as http;
import 'package:burgerjoint/Models/extra.dart';
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
        int productPrice=0;





        //for the extra items in product
        /*** DONE ***/
        List<Extra>extras=[];
        for(int j=0;j<products[i]['extras'].length;j++) {
          Extra extra = new Extra(products[i]['extras'][j]['id'],
              products[i]['extras'][j]['product_id'],
              products[i]['extras'][j]['product_name'],
              products[i]['extras'][j]['size_name'],
              products[i]['extras'][j]['size_id'],
              products[i]['extras'][j]['size_price']);
          extras.add(extra);
        }
        /*** ------------------------------------------------***/




        //for the combo items in product
        /*** DONE ***/
        List<ComboProduct> comboProducts=[];
        for(int j=0;j<products[i]['combo_products'].length;j++)
        {
          List<Item>items=[];
          //for items in combo items in product
          var itemsComboProducts=products[i]['combo_products'][j]['items'];
          for(int k=0;k<itemsComboProducts.length;k++){

              List<OptionProduct> optionProducts=[];
              //this condition to check if there are any options for this item combo
               if(itemsComboProducts[k]['options']){
                 // for option products
               for(int l =0;l <itemsComboProducts[k]['option_product'].length;l++){
                    OptionProduct optionProduct=new OptionProduct(
                        itemsComboProducts[k]['option_product'][l]['product_combo_option_id'],
                        itemsComboProducts[k]['option_product'][l]['product_name'],
                        itemsComboProducts[k]['option_product'][l]['product_id'],
                        itemsComboProducts[k]['option_product'][l]['product_size'],
                        itemsComboProducts[k]['option_product'][l]['size_id']);
                    optionProducts.add(optionProduct);
                      }
                }

              Item item = new Item(
                  itemsComboProducts[k]['product_combo'],
                  itemsComboProducts[k]['product_name'],
                  itemsComboProducts[k]['product_id'],
                  itemsComboProducts[k]['product_size'],
                  itemsComboProducts[k]['size_id'],
                  itemsComboProducts[k]['options'],
                  optionProducts);
              items.add(item);

            }

           ComboProduct comboProduct = new ComboProduct(
               products[i]['combo_products'][j]['combo_size'],
               products[i]['combo_products'][j]['size_name'],
               products[i]['combo_products'][j]['price'],
               items);

          comboProducts.add(comboProduct);
        }
        /*** ------------------------------------------------***/



        //for the sizes in product
        /*** DONE ***/
        List<Size> sizes = [] ;
        for(int j=0;j<products[i]['sizes'].length;j++){
          if(j==0){
            productPrice=products[i]['sizes'][j]['price'];
          }

          Size size = new Size(
              products[i]['sizes'][j]['size_id'],
              products[i]['sizes'][j]['size_name'],
              products[i]['sizes'][j]['price']);
          sizes.add(size);
        }
        /*** ------------------------------------------------***/



        Product product=  new Product(
            products[i]['status'],
            products[i]['product_id'],
            products[i]['product_description']??"",
            products[i]['product_image'],
            products[i]['product_title'],
            products[i]['taxes'],
            productPrice,
            extras,
            products[i]['combo'],
            comboProducts,
            products[i]['discount'],
            sizes
        );
        productsList.add(product);
      }

      return productsList;

    } catch (exception){

      print("ERROR");
      return productsList;

    }
  }


}
