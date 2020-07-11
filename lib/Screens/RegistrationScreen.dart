import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecomshop/Screens/LoginScreen.dart';

import '../HomePage.dart';

class RegistrationScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _nameController = TextEditingController();
  final _imageController = TextEditingController();

   Future<bool> registerUser(
       String email, String pass, String name, String url) async {
     FirebaseAuth _auth = FirebaseAuth.instance;
     try {
       AuthResult result = await _auth.createUserWithEmailAndPassword(
           email: email, password: pass);
       FirebaseUser user = result.user;
       UserUpdateInfo info = UserUpdateInfo();
       info.displayName = name;
       info.photoUrl = url;
       user.updateProfile(info);
       return true;
     } catch (e) {
       print(e);
       return false;
     }
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(32),
            child: Form(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Registration",
                    style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent),
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      // prefixIcon: Icon(
                      //   Icons.email,
                      //   size: 30.0,
                      // ),
                      hintText: "Email",
                      filled: true,
                      fillColor: Colors.grey[200]),
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _passController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent),
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      // prefixIcon: Icon(
                      //   Icons.enhanced_encryption,
                      //   size: 30.0,
                      // ),
                      hintText: "Password",
                      filled: true,
                      fillColor: Colors.grey[200]),
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent),
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      // prefixIcon: Icon(
                      //   Icons.person,
                      //   size: 30.0,
                      // ),
                      hintText: "Display Name",
                      filled: true,
                      fillColor: Colors.grey[200]),
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _imageController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent),
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      // prefixIcon: Icon(
                      //   Icons.photo,
                      //   size: 30.0,
                      // ),
                      hintText: "Photo URL",
                      filled: true,
                      fillColor: Colors.grey[200]),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  width: double.infinity,
                  child: FlatButton(
//                    onPressed: (){},
                     onPressed: () async {
                       final email = _emailController.text.toString().trim();
                       final pass = _passController.text.toString().trim();
                       final name = _nameController.text.toString().trim();
                       final url = _imageController.text.toString().trim();

                       bool result = await registerUser(email, pass, name, url);

                       if (result) {
                         Navigator.of(context).push(MaterialPageRoute(
                           builder: (context) => LoginScreen(),
                         ));
                       } else {
                         print("error");
                       }
                     },
                    child: Text("Register"),
                    textColor: Colors.white,
                    padding: EdgeInsets.all(16.0),
                    color: Colors.blue,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                ),
                SizedBox(height:10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 
                    children: <Widget>[
                      Text("If you are already register" , style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber
                      ),),
                      OutlineButton(onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                      },
                      child: Text("Login Here"),
                      
                      )
                    ],
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
