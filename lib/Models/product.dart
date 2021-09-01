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
  late List<Size>sizes;

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
      this.sizes);


}