import 'package:flutter/material.dart';
import 'package:ecomshop/EmptyCart.dart';
import 'package:ecomshop/cart_screen.dart';
import 'package:provider/provider.dart';

import 'Model/Cart.dart';

class CartHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final cartLenght=cart.items;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("My Cart"),
      ),
      body: cartLenght.length > 0 ? CartScreen() : EmptyCart() ,
    );
  }
}
