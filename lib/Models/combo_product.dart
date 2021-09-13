class ComboProduct{

  late int comboSize;
  late String sizeName;
  late int price;
  late List<Item> items;

  ComboProduct(this.comboSize,
      this.sizeName,
      this.price,
      this.items);

}

class Item{

  late int productCombo;
  late String productName;
  late int productId;
  late String productSize;
  late int sizeId;
  late bool options;
  late List<OptionProduct> optionsProduct;

  Item(this.productCombo,
      this.productName,
      this.productId,
      this.productSize,
      this.sizeId,
      this.options,
      this.optionsProduct);
}

class OptionProduct{

  late int productComboOptionId;
  late String productName;
  late int productId;
  late String productSize;
  late int sizeId;

  OptionProduct(this.productComboOptionId,
      this.productName,
      this.productId,
      this.productSize,
      this.sizeId);

}



//for combo items
class ComboItemsClickedByUser{

  late int productComboOptionId;
  late String productName;
  late int productId;
  late String productSize;
  late int sizeId;

  ComboItemsClickedByUser(
      this.productComboOptionId,
      this.productName,
      this.productId,
      this.productSize,
      this.sizeId);


      static List<dynamic> convertToJson(List<ComboItemsClickedByUser> orderProducts) {
       List<Map<String, dynamic>> jsonData = orderProducts.map((word) => word.optionProductToMap()).toList();
       return jsonData;
      }

  Map<String, dynamic> optionProductToMap(){

    return {
      'product_id': this.productId,
      'product_size': this.sizeId,
      'productOptionId': this.productComboOptionId,
      'productName': this.productName,
      'productSize': this.productSize,
    };

  }
}