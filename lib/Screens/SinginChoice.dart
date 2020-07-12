// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class SigninChoice extends StatefulWidget {
//   @override
//   _SigninChoiceState createState() => _SigninChoiceState();
// }

// class _SigninChoiceState extends State<SigninChoice> {
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   final GoogleSignIn _googleSignIn = GoogleSignIn();

//   Future<FirebaseUser> _signIn(BuildContext context) async {
//     Scaffold.of(context).showSnackBar(SnackBar(
//       content: Text("Sign in"),
//     ));

//     final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
//     final GoogleSignInAuthentication googleAuth =
//         await googleUser.Authentication;

//     final AuthCredential credential = GoogleAuthProvider.getCredential(
//         idToken: googleAuth.idToken, accessToken: googleAuth.AccessToken);

//     FirebaseUser userDetails =
//         await _firebaseAuth.signInWithCredential(credential);

//     ProviderDetails providerInfo = ProviderDetails(userDetails.providerId);

//     List<ProviderDetails> providerData = List<ProviderDetails>();

//     providerData.add(providerInfo);

//     UserDetails details = UserDetails(
//         userDetails.providerId,
//         userDetails.displayName,
//         userDetails.photoUrl,
//         userDetails.email,
//         providerData);

//     Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => ProfleScreen(detailsUser: details)));

//     return userDetails;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Builder(
//           builder: (context) => Stack(
//                 fit: StackFit.expand,
//                 children: <Widget>[
//                   Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: MediaQuery.of(context).size.height,
//                     child: Image.asset(
//                       "images/7.jpg",
//                       fit: BoxFit.fill,
//                       color: Color.fromRGBO(255, 255, 255, 0.6),
//                       colorBlendMode: BlendMode.modulate,
//                     ),
//                   ),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       SizedBox(
//                         height: 10.0,
//                       ),
//                       Container(
//                         width: 250.0,
//                         child: Align(
//                           alignment: Alignment.center,
//                           child: RaisedButton(
//                             onPressed: ()=>_signIn(context).then((FirebaseUser user) => print(user))
//                                                                           .catchError((e)=>print(e)),

//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(30.0)),
//                             color: Color(0xffffffff),
//                             child: Row(
//                               children: <Widget>[
//                                 Icon(
//                                   Icons.settings,
//                                   color: Color(0xffce107c),
//                                 ),
//                                 SizedBox(
//                                   height: 10.0,
//                                 ),
//                                 Text(
//                                   'sign with google',
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 18.0,
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10.0,
//                       ),
//                       Container(
//                         width: 250.0,
//                         child: Align(
//                           alignment: Alignment.center,
//                           child: RaisedButton(
//                             onPressed: () {},
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(30.0)),
//                             color: Color(0xffffffff),
//                             child: Row(
//                               children: <Widget>[
//                                 Icon(
//                                   Icons.settings,
//                                   color: Color(0xffce107c),
//                                 ),
//                                 SizedBox(
//                                   height: 10.0,
//                                 ),
//                                 Text(
//                                   'sign with facebook',
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 18.0,
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10.0,
//                       ),
//                       Container(
//                         width: 250.0,
//                         child: Align(
//                           alignment: Alignment.center,
//                           child: RaisedButton(
//                             onPressed: () {},
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(30.0)),
//                             color: Color(0xffffffff),
//                             child: Row(
//                               children: <Widget>[
//                                 Icon(
//                                   Icons.settings,
//                                   color: Color(0xffce107c),
//                                 ),
//                                 SizedBox(
//                                   height: 10.0,
//                                 ),
//                                 Text(
//                                   'sign with Email',
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 18.0,
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               )),
//     );
//   }
// }

// class UserDetails {
//   final String providerDetails;
//   final String userName;
//   final String photoUrl;
//   final String userEmail;
//   final List<ProviderDetails> providerData;
//   UserDetails(this.providerDetails, this.userName, this.photoUrl,
//       this.userEmail, this.providerData);
// }

// class ProviderDetails {
//   ProviderDetails(this.providerDetails);
//   final String providerDetails;
// }
