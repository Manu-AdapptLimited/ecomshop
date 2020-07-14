
import 'package:flutter/material.dart';
import 'package:ecomshop/HomePage.dart';
import 'package:ecomshop/Model/Cart.dart';
import 'package:ecomshop/cart_item.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  // static const routeName = '/Cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
     
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (ctx, i) => CartPdt(
                      cart.items.values.toList()[i].id,
                      cart.items.values.toList()[i].image,
                      cart.items.values.toList()[i].name,
                      cart.items.values.toList()[i].price,
                      cart.items.keys.toList()[i],
                      cart.items.values.toList()[i].quantity,
                    )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FlatButton(
                  color: Colors.redAccent,
                  onPressed: () {
                    cart.clear();
                    
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Empty Cart",
                    style: TextStyle(fontSize: 20.0,  color: Colors.white),
                  )),
              FlatButton(
                  color: Colors.redAccent,
                  onPressed: () {},
                  child: Text(
                    "Order Now",
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
