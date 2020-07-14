import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String name;
  final String image;
  final int quantity;
  final double price;

  CartItem({this.id, this.image, this.name, this.price, this.quantity});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(String pdtid, String name, double price, String image) {
    if (_items.containsKey(pdtid)) {
      _items.update(
          pdtid,
          (existingCartItem) => CartItem(
              id: DateTime.now().toString(),
              name: existingCartItem.name,
              quantity: existingCartItem.quantity + 1,
              price: existingCartItem.price,
              image: existingCartItem.image));
    } else {
      _items.putIfAbsent(
          pdtid,
          () => CartItem(
                name: name,
                id: DateTime.now().toString(),
                quantity: 1,
                price: price,
                image: image,
              ));
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void removeSingleItem(String id) {
    if (!_items.containsKey(id)) {
      return;
    }
    if (_items[id].quantity > 1) {
      _items.update(
          id,
          (existingCartItem) => CartItem(
              id: DateTime.now().toString(),
              name: existingCartItem.name,
              quantity: existingCartItem.quantity - 1,
              price: existingCartItem.price,
              image: existingCartItem.image));
    }

    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }

  void increament(String pdtid, String name, double price, String image) {
    if (_items.containsKey(pdtid)) {
      _items.update(
          pdtid,
          (existingCartItem) => CartItem(
              id: DateTime.now().toString(),
              name: existingCartItem.name,
              quantity: existingCartItem.quantity + 1,
              price: existingCartItem.price,
              image: existingCartItem.image));
    } else {
      _items.putIfAbsent(
          pdtid,
          () => CartItem(
                name: name,
                id: DateTime.now().toString(),
                quantity: 1,
                price: price,
                image: image,
              ));
    }
    notifyListeners();
  }

  void decreament(String pdtid, String name, double price, String image) {
    if (_items.containsKey(pdtid)) {
      _items.update(
          pdtid,
          (existingCartItem) => CartItem(
              id: DateTime.now().toString(),
              name: existingCartItem.name,
              quantity: existingCartItem.quantity - 1,
              price: existingCartItem.price,
              image: existingCartItem.image));
    }
    if (_items[pdtid].quantity == 0) {
      _items.remove(pdtid);
    }
    notifyListeners();
  }

 
}
