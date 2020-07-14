import 'package:ecomshop/Screens/SinginChoice.dart';
import 'package:flutter/material.dart';
import 'package:ecomshop/Model/Products.dart';
import 'package:provider/provider.dart';
import 'Model/Cart.dart';
import 'Model/Products.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: Products()),
      ChangeNotifierProvider.value(value: Cart())
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      title: 'ShopApp',

      home: SigninChoice(),
      // routes: {
      //   CartScreen.routeName:(ctx)=>CartScreen(),
      // },
    ),
  ));
}
