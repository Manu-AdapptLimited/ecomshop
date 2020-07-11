import 'package:flutter/material.dart';
import 'package:ecomshop/Cart_header.dart';
import 'AllProduct.dart';

class ShopItem extends StatefulWidget {
  final shop_item_name;

  ShopItem({
    this.shop_item_name,
  });
  @override
  _ShopItemState createState() => _ShopItemState();
}

class _ShopItemState extends State<ShopItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.redAccent,
        title: InkWell(onTap: () {}, child: Text(widget.shop_item_name)),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartHeader()));
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Container(
              child: AllProduct(),
            ),
          )
        ],
      ),
    );
  }
}
