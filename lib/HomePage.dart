import 'package:ecomshop/Screens/SinginChoice.dart';
import 'package:flutter/material.dart';
import 'package:ecomshop/Cart_header.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'ShopPage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.detailsUser, this.name, this.imageUrl, this.user})
      : super(key: key);

  final name;
  final imageUrl;
  final user;
  final UserDetails detailsUser;
  // HomePage({this.name, this.imageUrl, this.user, this.detailsUser});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GoogleSignIn _gsignIn = GoogleSignIn();
  

  String title = "Shop";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.redAccent,
          title: Text(title),
          // title: Text(widget.title),
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
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(widget.detailsUser.userName.toString()),
                accountEmail: Text(widget.detailsUser.userEmail.toString()),
                currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage:
                        NetworkImage(widget.detailsUser.photoUrl.toString()),
                  ),
                ),
                decoration: BoxDecoration(color: Colors.redAccent),
              ),
              InkWell(
                onTap: () {
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (context) => HomePage()));
                  Navigator.of(context).pop();
                },
                child: ListTile(
                  title: Text('Home'),
                  leading: Icon(
                    Icons.home,
                    color: Colors.redAccent,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('My Account'),
                  leading: Icon(
                    Icons.person,
                    color: Colors.redAccent,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('My Order'),
                  leading: Icon(
                    Icons.shopping_basket,
                    color: Colors.redAccent,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('Favourites'),
                  leading: Icon(
                    Icons.favorite,
                    color: Colors.redAccent,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('Setting'),
                  leading: Icon(
                    Icons.settings,
                    color: Colors.redAccent,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('About'),
                  leading: Icon(
                    Icons.help_outline,
                    color: Colors.redAccent,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              InkWell(
                onTap: () {
                  _gsignIn.signOut();
                  print('signed out');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SigninChoice()));
                },
                child: ListTile(
                  title: Text('Sign Out'),
                  leading: Icon(
                    Icons.exit_to_app,
                    color: Colors.redAccent,
                  ),
                ),
              )
            ],
          ),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Container(
                color: Colors.blue,
                alignment: Alignment.topCenter,
                // child: Text(
                //   "SHOPS",
                //   style: TextStyle(
                //     fontSize: 25.0,
                //     color: Colors.white,
                //     fontStyle: FontStyle.italic,
                //   ),
                // ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
              //shop body
              child: Container(child: ShopPage()),
            ),
          ],
        ));
  }
}
