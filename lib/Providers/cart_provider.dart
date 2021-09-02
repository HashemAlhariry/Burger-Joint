import 'package:burgerjoint/Models/cart.dart';
import 'package:burgerjoint/Models/product.dart';
import 'package:flutter/cupertino.dart';

class CartProvider extends ChangeNotifier {

    Cart cart = new Cart();
    double totalPrice = 0;

    void addCart(Product product) {
        cart.cartItems.add(product);
        totalPrice += product.totalProductPrice;
        notifyListeners();
    }

    void deleteCart() {
        cart.cartItems.clear();
        totalPrice = 0;
        notifyListeners();
    }

    void deleteCartItem(int index) {
        totalPrice -= cart.cartItems[index].productPrice;
        cart.cartItems.removeAt(index);
        notifyListeners();
    }


    void addQuantity(int index) {

        notifyListeners();
    }

    void deleteQuantity(int index) {


    }


}