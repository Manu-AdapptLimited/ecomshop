import 'package:ecomshop/HomePage.dart';
import 'package:ecomshop/Screens/MobielLogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'LoginScreen.dart';

class SigninChoice extends StatefulWidget {
  @override
  _SigninChoiceState createState() => _SigninChoiceState();
}

class _SigninChoiceState extends State<SigninChoice> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<FirebaseUser> _signIn(BuildContext context) async {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("Sign in"),
    ));

    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

    // FirebaseUser userDetails =
    //     (await _firebaseAuth.signInWithCredential(credential)) as FirebaseUser;

    FirebaseUser userDetails =
        (await FirebaseAuth.instance.signInWithCredential(credential)).user;

    ProviderDetails providerInfo = ProviderDetails(userDetails.providerId);

    List<ProviderDetails> providerData = List<ProviderDetails>();

    providerData.add(providerInfo);

    UserDetails details = UserDetails(
        userDetails.providerId,
        userDetails.displayName,
        userDetails.photoUrl,
        userDetails.email,
        providerData);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(detailsUser: details)));

    return userDetails;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
          builder: (context) => Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Image.asset(
                      "images/7.jpg",
                      fit: BoxFit.fill,
                      color: Color.fromRGBO(255, 255, 255, 0.6),
                      colorBlendMode: BlendMode.modulate,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        width: 250.0,
                        child: Align(
                          alignment: Alignment.center,
                          child: RaisedButton(
                            onPressed: () => _signIn(context)
                                .then((FirebaseUser user) => print(user))
                                .catchError((e) => print(e)),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            color: Color(0xffffffff),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  FontAwesomeIcons.google,
                                  color: Color(0xffce107c),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'sign with google',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      
                      SizedBox(
                        height: 10.0,
                      ),
                     
                    ],
                  ),
                ],
              )),
    );
  }
}

class UserDetails {
  final String providerDetails;
  final String userName;
  final String photoUrl;
  final String userEmail;
  final List<ProviderDetails> providerData;
  UserDetails(this.providerDetails, this.userName, this.photoUrl,
      this.userEmail, this.providerData);
}

class ProviderDetails {
  ProviderDetails(this.providerDetails);
  final String providerDetails;
}
