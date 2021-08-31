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