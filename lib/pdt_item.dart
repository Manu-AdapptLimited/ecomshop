import 'package:flutter/material.dart';
import 'package:ecomshop/Model/Products.dart';
import 'package:provider/provider.dart';
import './Model/Cart.dart';

class PdtItem extends StatelessWidget {
  final String name;
  final String image;
  final double price;

  PdtItem({
    this.image,
    this.name,
    this.price,
  });
  @override
  Widget build(BuildContext context) {
    final pdt = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridTile(
        child: Image.asset(image),
        footer: GridTileBar(
          title: Text(
            name,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            "\Rs$price",
            style: TextStyle(color: Colors.black),
          ),
          trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              color: Colors.black,
              iconSize: 40.0,
              onPressed: () {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text(
                    "Item Added To Your Cart",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  duration: Duration(seconds: 1),
                  backgroundColor: Colors.black,
                ));
                cart.addItem(pdt.id, pdt.name, pdt.price, pdt.img);
              }),
          backgroundColor: Colors.white70,
        ),
      ),
    );
  }
}
