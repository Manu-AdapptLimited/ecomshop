import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecomshop/HomePage.dart';

class LoginScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  Future<FirebaseUser> login(String email, String pass) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      AuthResult result =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      print(e);
      return null;
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
                Text("Login",
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
                      prefixIcon: Icon(
                        Icons.email,
                        size: 30.0,
                      ),
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
                      prefixIcon: Icon(
                        Icons.enhanced_encryption,
                        size: 30.0,
                      ),
                      hintText: "Password",
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

                      FirebaseUser user = await login(email, pass);

                      if (user != null) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomePage(
                                name: user.displayName,
                                imageUrl: user.photoUrl)));
                      } else {
                        print("error");
                      }
                    },
                    child: Text("Login"),
                    textColor: Colors.white,
                    padding: EdgeInsets.all(16.0),
                    color: Colors.blue,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
