import 'package:ecomshop/Cart_header.dart';
import 'package:ecomshop/Model/Cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemCounter extends StatelessWidget {
  // final quantity;
  // ItemCounter(this.quantity);
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final cartLenght = cart.items;
    var quant;
   
    for (var i = 0; i < cartLenght.length; i++) {
      quant = cartLenght.values.toList()[i].quantity;
    }
    //  var squant = quant >= 9 ? "9+" : quant.toString();
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => CartHeader()));
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(0.0, 12.0, 5.0, 0.0),
        //  color: Colors.grey[300],
        width: 40.0,
        height: 30.0,
        child: Stack(
          children: <Widget>[
            Icon(
              Icons.shopping_cart,
              size: 30.0,
              color: Colors.white,
            ),
            Visibility(
              visible: cartLenght.length > 0,
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 20.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.blueGrey),
                  child: Center(
                    child: Text(
                      "${quant=1 *cartLenght.length}",
                      style: TextStyle(fontSize: 7.0, color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
