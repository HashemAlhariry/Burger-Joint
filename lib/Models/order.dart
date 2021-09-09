
import 'package:burgerjoint/Models/product.dart';

class Order {

  late int branchId;
  //with out discount
  late int total;
  //update total with any kind of total after
  late int totalAfter;

  late List<Product> products;

  //packages offers
  late List<Product> packages;

  // number 3 for mobile
  late int orderType;

  //2 visa , 3 cash on delivery
  late int paymentMethod;

  //ignore
  late String transactionReference;



  late int offerId;

  late String comment;

  // always false no edit
  late bool edit;

  Order(
      this.branchId,
      this.total,
      this.totalAfter,
      this.products,
      this.packages,
      this.orderType,
      this.paymentMethod,
      this.transactionReference,
      this.offerId,
      this.comment,
      this.edit);



}
