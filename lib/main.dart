import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:regexpattern/regexpattern.dart';
import 'dart:ui';

import 'package:task4/animation.dart';
import 'package:task4/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dashboard.dart';
import 'mobilelogin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool passowrd = true;
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  FirebaseAuth instance = FirebaseAuth.instance;

  // FirebaseAuth instance = FirebaseAuth.instance;
  bool isloading = false;
  bool isloadingphone = false;
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/background.jpg"), fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        // ),
        body: Form(
            key: _formKey,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 55,
                              color: Colors.white,
                              fontFamily: "Pacifico"),
                        ),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 40, right: 40, top: 20),
                          child: TextFormField(
                            // autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: email,
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return 'fill the email';
                              } else if ((value.toString().trim().isEmail()) ==
                                  false) {
                                return ' The email is not correct';
                              }
                            },
                            cursorColor: Colors.tealAccent,
                            style: TextStyle(color: Colors.white, fontSize: 15),
                            decoration: InputDecoration(
                              // filled: true,
                              // fillColor: Colors.transparent,

                                labelText: "Email",
                                labelStyle: TextStyle(
                                    color: Colors.white, fontSize: 20),
                                hintStyle: TextStyle(color: Colors.white),
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.white,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                    borderSide:
                                    BorderSide(color: Colors.white)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                    borderSide: BorderSide(color: Colors.white))
                              // focusedBorder: OutlineInputBorder(
                              //     borderRadius:
                              //     BorderRadius.all(Radius.circular(20)))
                            ),

                            keyboardType: TextInputType.emailAddress,
                            autofillHints: [AutofillHints.email],
                          )),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 40, right: 40, top: 20),
                          child: TextFormField(
                            // autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: pass,
                            obscureText: passowrd,
                            cursorColor: Colors.tealAccent,

                            validator: (value) {
                              if (value.toString().isEmpty &&
                                  value.toString().length < 6) {
                                return 'Fill the password and You should the password at least 6 characters';
                              } else if (value.toString().isEmpty) {
                                return 'Fill the password';
                              } else if (value.toString().length < 6) {
                                return 'You should the password at least 6 characters';
                              }
                            },
                            style: TextStyle(color: Colors.white, fontSize: 15),
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      //
                                      passowrd = !passowrd;
                                      //
                                    });
                                  },
                                  icon: Icon(
                                    (passowrd == true
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                    color: Colors.white,
                                  ),
                                ),
                                filled: true,
                                labelText: "Password",
                                labelStyle: TextStyle(
                                    color: Colors.white, fontSize: 20),
                                hintText:
                                "Enter the password should at least 6 character ",
                                hintStyle: TextStyle(
                                    color: Colors.white70, fontSize: 15),
                                prefixIcon: Icon(
                                  Icons.password,
                                  color: Colors.white,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                    borderSide:
                                    BorderSide(color: Colors.white)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                    borderSide:
                                    BorderSide(color: Colors.white))),

                            keyboardType: TextInputType.visiblePassword,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                ),
                                child: Text(
                                  "Forget Password?",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                )),
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10),
                          width: 340,
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              gradient: LinearGradient(colors: [
                                Colors.blueAccent,
                                Colors.black,
                                Colors.teal,
                              ], transform: GradientRotation(9)),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)))),
                              onPressed: () async {
                                setState(() {
                                  isloading = true;
                                });
                                setState(() async {
                                  if (_formKey.currentState!.validate()) {
                                    try {
                                      UserCredential credential = await instance
                                          .signInWithEmailAndPassword(
                                          email: email.text.toString(),
                                          password: pass.text.toString());

                                      await Future.delayed(
                                          Duration(seconds: 2));
                                      isloading = false;

                                      Navigator.of(context)
                                          .push(animation(page: profile()));
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //       builder: (context) => profile(),
                                      //     ));
                                    } on FirebaseAuthException catch (e) {
                                      if (e.code == 'invalid-email') {
                                        Fluttertoast.showToast(
                                            msg: "user-not-found",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.blue,
                                            textColor: Colors.black,
                                            fontSize: 16.0);
                                        setState(() {
                                          isloading = false;
                                        });
                                      } else if (e.code == 'user-not-found') {
                                        Fluttertoast.showToast(
                                            msg: "user-not-found",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.blue,
                                            textColor: Colors.black,
                                            fontSize: 16.0);
                                        setState(() {
                                          isloading = false;
                                        });
                                      } else if (e.code == 'wrong-password') {
                                        Fluttertoast.showToast(
                                            msg: "wrong-password",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.blue,
                                            textColor: Colors.black,
                                            fontSize: 16.0);

                                        setState(() {
                                          isloading = false;
                                        });
                                      } else {
                                        setState(() {
                                          isloading = false;
                                        });
                                      }
                                    }
                                  } else {
                                    setState(() {
                                      isloading = false;
                                    });
                                  }
                                });
                              },
                              child: isloading
                                  ? Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    CircularProgressIndicator(
                                        color: Colors.lightBlueAccent, strokeWidth: 1),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text("LOGIN".toUpperCase(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily:
                                            "fonts/TrajanPro.ttf"))
                                  ])
                                  : Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.login),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    "LOGIN".toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily:
                                        "fonts/TrajanPro.ttf"),
                                  ),
                                ],
                              ))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Don't have an account?",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: "fonts/TrajanPro.ttf")),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .push(animation(page: register()));
                              },
                              child: Text(
                                "Register",
                                style: TextStyle(fontSize: 15),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.25,
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10),
                          width: 340,
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              gradient: LinearGradient(colors: [
                                Colors.blueAccent,
                                Colors.black,
                                Colors.teal,
                              ], transform: GradientRotation(9)),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)))),
                              onPressed: () async {
                                setState(() {
                                  isloadingphone = true;
                                });
                                await Future.delayed(Duration(seconds: 2));
                                Navigator.of(context)
                                    .push(animation(page: phone()));
                                setState(() {
                                  isloadingphone = false;
                                });
                              },
                              child: isloadingphone
                                  ? Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    CircularProgressIndicator(
                                        color: Colors.lightBlueAccent, strokeWidth: 1),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                        "Sign in with mobile no"
                                            .toUpperCase(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily:
                                            "fonts/TrajanPro.ttf"))
                                  ])
                                  : Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.phone),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    "Sign in with mobile no"
                                        .toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily:
                                        "fonts/TrajanPro.ttf"),
                                  ),
                                ],
                              ))),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          buttonRow(
                            Icon: Icons.g_mobiledata_sharp,
                            GlobalKey: _formKey,
                            String: "Google  ",
                          ),
                          buttonRow(
                            Icon: Icons.facebook,
                            GlobalKey: _formKey,
                            String: "FACEBOOK",
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}

class buttonRow extends StatefulWidget {
  final Icon;

  final GlobalKey;
  final String;

  const buttonRow(
      {super.key,
        required this.Icon,
        required this.GlobalKey,
        required this.String});

  @override
  State<buttonRow> createState() => _buttonRowState();
}

class _buttonRowState extends State<buttonRow> {
  bool isloading = false;
  Map<String,dynamic>? _userData;
  bool checking=true;
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    GoogleSignInAccount? googleUser = await GoogleSignIn().signOut();
    googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
    await googleUser?.authentication;
    print(googleAuth.toString() +
        "                         hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

 signInWithFacebook() async {
   FacebookAuth.instance.logOut();
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
            padding: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(30)))),
        onPressed: () async {
          setState(() {
            isloading = true;
          });
          if (this.widget.String == "Google  ") {
            try {
              UserCredential cred = await signInWithGoogle();

              setState(() {
                isloading = true;
              });
              await Future.delayed(Duration(seconds: 2));
              setState(() {
                isloading = false;
              });
              Navigator.of(context).push(animation(page: profile()));
            } catch (e) {
              if (e.toString().isEmpty) {

                Fluttertoast.showToast( msg: "user-not-found",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.blue,
                    textColor: Colors.black,
                    fontSize: 16.0);

              }
              else{
                Fluttertoast.showToast( msg: "Not select gmail",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.blue,
                    textColor: Colors.black,
                    fontSize: 16.0);


              }
              print(e.toString());
              setState(() {
                isloading = false;
              });
            }
          }
          else{

            try {
              UserCredential cred = await signInWithFacebook();

              setState(() {
                isloading = true;
              });
              await Future.delayed(Duration(seconds: 2));
              setState(() {
                isloading = false;
              });
              Navigator.of(context).push(animation(page: profile()));
            } catch (e) {
              if (e.toString().isEmpty) {

                Fluttertoast.showToast( msg: "user-not-found",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.blue,
                    textColor: Colors.black,
                    fontSize: 16.0);

              }
              else{
                Fluttertoast.showToast( msg: "Not select facebook",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.blue,
                    textColor: Colors.black,
                    fontSize: 16.0);


              }
              print(e.toString());
              setState(() {
                isloading = false;
              });
            }


          }
        },
        child: isloading
            ? Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CircularProgressIndicator(color: Colors.lightBlueAccent, strokeWidth: 1),
          SizedBox(
            width: 10,
          ),
          Text("" + this.widget.String.toUpperCase(),
              style: TextStyle(
                  color: Colors.white, fontFamily: "fonts/TrajanPro.ttf"))
        ])
            : Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              this.widget.Icon,
              size: 25,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "" + this.widget.String.toUpperCase(),
              style: TextStyle(
                  color: Colors.white, fontFamily: "fonts/TrajanPro.ttf"),
            ),
          ],
        ));
  }
}
