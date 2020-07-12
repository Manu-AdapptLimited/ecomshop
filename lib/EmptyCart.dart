import 'package:flutter/material.dart';

import 'HomePage.dart';


class EmptyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.redAccent,
      //   title: Text("My Cart"),
      // ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 200.0),
          child: Column(
            children: <Widget>[
              Text(
                "Your Cart Is Currently Empty",
                style: TextStyle(
                  fontSize: 20.0,
                  fontStyle: FontStyle.italic
                ),
              ),
              MaterialButton(
                onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => HomePage()));
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Click Here to Purchase",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
                color: Colors.redAccent,
                elevation: 0.8,
                hoverElevation: 1.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
