import 'package:flutter/foundation.dart';
import 'package:pieproject/models/product.dart';

class Cart extends ChangeNotifier {
  List<Product> _items = [];

  List<Product> get cartItems => _items.toList();

  void addItem(Product product) {
    _items.add(product);
    notifyListeners();
  }
  void removeItem(Product product) {
    _items.remove(product);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
