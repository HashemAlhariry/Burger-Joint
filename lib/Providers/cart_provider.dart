import 'package:burgerjoint/Models/cart.dart';
import 'package:burgerjoint/Models/product.dart';
import 'package:flutter/cupertino.dart';

class CartProvider extends ChangeNotifier {

    Cart cart = new Cart();
    int totalPrice = 0;

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

        totalPrice -= cart.cartItems[index].totalProductPrice*cart.cartItems[index].quantity;
        cart.cartItems.removeAt(index);
        notifyListeners();

    }





}