class Cart {

  List<CartItem> cartItems=[];

}

class CartItem{

 late int itemId;
 late int subCategoryId;
 late int quantity;
 late double price;
 late double totalPriceItems;
 late int discount;
 late String name;
 late String image;

 CartItem(this.itemId, this.subCategoryId, this.quantity, this.price,
      this.totalPriceItems, this.discount, this.name, this.image);
}