import 'dart:ui';

import 'package:flutter/material.dart';
import 'ShopItem.dart';

class ShopPage extends StatefulWidget {
  ShopPage({Key key}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  var shop_List = [
    {
      "name": "MOTE ANCLE SHOP",
      "picture": "images/5.jpg",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: ScrollPhysics(),
      shrinkWrap:true,
        itemCount: shop_List.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemBuilder: (BuildContext context, int index) {
          return Single_Shop(
            shop_name: shop_List[index]['name'],
            shop_picture: shop_List[index]['picture'],
          );
        });
  }
}

class Single_Shop extends StatelessWidget {
  final shop_picture;
  final shop_name;

  Single_Shop({
    this.shop_picture,
    this.shop_name,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: shop_name,
          child: Material(
              child: InkWell(
            //passing data to another page
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ShopItem(
                      shop_item_name: shop_name,
                    ))),
            child: GridTile(
              footer: Container(
                
                color: Colors.white70,
                child: ListTile(
                  leading: Text(shop_name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        )),
                ),
              ),
              child: Image.asset(shop_picture, fit: BoxFit.cover),
            ),
          ))),
    );
  }
}
