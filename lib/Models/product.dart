import 'combo_product.dart';
import 'size.dart';
import 'extra.dart';

class Product {

  late int status;
  late int productId;
  late String productDescription;
  late String productImage;
  late String productTitle;
  late dynamic taxes;
  late int productPrice;
  late List<Extra>extras;
  late bool combo;
  late List<ComboProduct> comboProducts;
  late int discount;
  late List<ProductSize>productSizes;
  late int totalProductPrice;
  late int quantity;
  late int relationId;
  late List<ComboItemsClickedByUser> comboItemsClickedByUser;

  Product(
      this.status,
      this.productId,
      this.productDescription,
      this.productImage,
      this.productTitle,
      this.taxes,
      this.productPrice,
      this.extras,
      this.combo,
      this.comboProducts,
      this.discount,
      this.productSizes,
      this.totalProductPrice,
      this.quantity,
      this.relationId,
      this.comboItemsClickedByUser);

  static List<dynamic> convertToJson(List<Product> orderProducts) {
    List<Map<String, dynamic>> jsonData = orderProducts.map((word) => word.productToMap()).toList();
    return jsonData;
  }
  //get ids in list of extras
  static List<int> getIdsOfExtras(List<Extra> extra){
    List<int> ids=[];
    for(int i =0;i<extra.length;i++){
      ids.add(extra[i].productId);
    }
    return ids;
  }

  //get ids in list of without
  static List<int> getIdsOfWithout(List<Without> withOut){
    List<int> ids=[];
    for(int i =0;i<withOut.length;i++){
      ids.add(withOut[i].id);
    }
    return ids;
  }

  Map<String, dynamic> productToMap(){
    return {
      'relation_id': this.relationId,
      'product_id': this.productId,
       "offer_id": false,
      'quantity': this.quantity,
      'size_id': this.productSizes[0].sizeId,
      'combo': this.combo,
      'extra':  getIdsOfExtras(this.extras),
      'without': getIdsOfWithout(this.productSizes[0].withOuts),
      'combo_size': this.comboProducts.length>0 ? comboProducts[0].comboSize: 0,
      'price_after': this.totalProductPrice,
      'price': this.totalProductPrice ,
      'combo_products' : ComboItemsClickedByUser.convertToJson(this.comboItemsClickedByUser),
    } ;
  }





}