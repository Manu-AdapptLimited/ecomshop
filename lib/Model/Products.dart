import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String name;
  final String img;
  final double price;
  

  Product({this.id, this.img, this.name, this.price});
}

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: '1',
      name: 'maggi',
      img: 'images/1.jpg',
      price: 12.0,
    ),
    Product(
      id: '2',
      name: 'oil',
      img: 'images/2.jpg',
      price: 100.0,
    ),
    Product(
      id: '3',
      name: 'good day',
      img: 'images/3.png',
      price: 25.0,
    ),
    Product(
      id: '4',
      name: 'rajma',
      img: 'images/4.jpg',
      price: 65.0,
    ),
  ];

  List<Product> get item {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((pdt) => pdt.id == id);
  }
}
