class ProductSize{

  late int sizeId;
  late String sizeName;
  late int price;
  late List<Without> withOuts;

  ProductSize(this.sizeId, this.sizeName, this.price,this.withOuts);

}

class Without{

  late int id;
  late int size;
  late String name;
  late  int value;
  late String unit;

  Without(this.id, this.size, this.name, this.value, this.unit);
  Without.forWithoutOrderHistory(this.id,this.name);
}