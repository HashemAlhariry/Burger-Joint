import 'package:burgerjoint/Models/cart.dart';
import 'package:flutter/cupertino.dart';

class CartProvider extends ChangeNotifier {

    Cart cart = new Cart();
    double totalPrice = 0;

    void addCart(CartItem cartItem) {
        cart.cartItems.add(cartItem);
        totalPrice += cartItem.price;
        notifyListeners();
    }

    void deleteCart() {
        cart.cartItems.clear();
        totalPrice = 0;
        notifyListeners();
    }

    void deleteCartItem(int index) {
        totalPrice -= cart.cartItems[index].price * cart.cartItems[index].quantity;
        cart.cartItems.removeAt(index);
        notifyListeners();
    }

    void addQuantity(int index) {
        cart.cartItems[index].quantity++;
        totalPrice += cart.cartItems[index].price;
        notifyListeners();
    }

    void deleteQuantity(int index) {
        if (cart.cartItems[index].quantity != 1) {
            cart.cartItems[index].quantity--;
            totalPrice -= cart.cartItems[index].price;
            notifyListeners();
        }
    }


}