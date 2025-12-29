import 'package:flutter/material.dart';
import 'package:shop/Components/product.dart';
//import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
  //Cart  items starts vide
  final List<Product> _cartItems = [];
  List<Product> get cartItems => _cartItems;
  final double total = 0;

  void addToCart(Product aProduct, bool found, int qte) {
    if (_cartItems.any((element) => element == aProduct)) {
      found = true;
    } else {
      _cartItems.add(aProduct);
    }
    aProduct.qte++;
    notifyListeners();
  }

  void removeFromCart(Product rProduct) {
    rProduct.qte = 0;
    _cartItems.removeAt(_cartItems.indexOf(rProduct));
    notifyListeners();
  }

  void incrementQte(Product prod) {
    prod.qte++;
    notifyListeners();
  }

  void decreaseQte(Product prod) {
    if (prod.qte > 1) {
      prod.qte--;
      notifyListeners();
    }
  }

  double calculateTotal(List<Product> cartItems) {
    return _cartItems.fold(0, (sum, item) => sum + item.price * item.qte);
  }
}
