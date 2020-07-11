import 'package:flutter/material.dart';
import 'package:ecomshop/pdt_item.dart';
import 'package:provider/provider.dart';
import './Model/Products.dart';

class AllProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final pdts = productData.item;
    return GridView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: pdts.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
              value: pdts[i],
              child: PdtItem(
                name: pdts[i].name,
                price:pdts[i].price,
                image: pdts[i].img,

              ),
            ));
  }
}
