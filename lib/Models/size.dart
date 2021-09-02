class ProductSize{

  late int sizeId;
  late String sizeName;
  late int price;
  late List<WithOut> withOuts;

  ProductSize(this.sizeId, this.sizeName, this.price,this.withOuts);

}

class WithOut{

  late int id;
  late int size;
  late String name;
  late  int value;
  late String unit;

  WithOut(this.id, this.size, this.name, this.value, this.unit);
}