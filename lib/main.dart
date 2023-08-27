import 'package:flutter/material.dart';
import 'package:regexpattern/regexpattern.dart';
import 'dart:ui';

import 'package:task4/animation.dart';

import 'mobilelogin.dart';

void main() {
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

  // FirebaseAuth instance = FirebaseAuth.instance;
  bool isloading = false;
  bool isloadingphone=false;
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
                        style: TextStyle(color: Colors.green, fontSize: 15),
                        decoration: InputDecoration(
                            // filled: true,
                            // fillColor: Colors.transparent,

                            labelText: "Email",
                            labelStyle:
                                TextStyle(color: Colors.white, fontSize: 15),
                            hintStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(color: Colors.white)),
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
                        style: TextStyle(color: Colors.green, fontSize: 15),
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
                            labelStyle: TextStyle(color: Colors.white),
                            hintText:
                                "Enter the password should at least 6 character ",
                            hintStyle:
                                TextStyle(color: Colors.white70, fontSize: 15),
                            prefixIcon: Icon(
                              Icons.password,
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(color: Colors.white)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(color: Colors.white))),

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
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
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
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                          onPressed: () async {
                            setState(() {
                              isloading = true;
                            });
                            setState(() async {
                              if (_formKey.currentState!.validate()) {
                              } else {
                                setState(() {
                                  isloading = false;
                                });
                              }
                            });
                          },
                          child: isloading
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                      CircularProgressIndicator(
                                          color: Colors.white, strokeWidth: 3),
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.login),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      "LOGIN".toUpperCase(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "fonts/TrajanPro.ttf"),
                                    ),
                                  ],
                                ))),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.28,
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
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                          onPressed: () async {
                            setState(() {
                              isloadingphone = true;
                            });
                            await Future.delayed(Duration(seconds: 1));
                            Navigator.of(context).push(animation(page: phone()));
                            setState(() {
                              isloadingphone=false;
                            });

                          },
                          child: isloadingphone
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                      CircularProgressIndicator(
                                          color: Colors.white, strokeWidth: 3),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Text("Sign in with mobile no".toUpperCase(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily:
                                                  "fonts/TrajanPro.ttf"))
                                    ])
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.phone),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      "Sign in with mobile no".toUpperCase(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "fonts/TrajanPro.ttf"),
                                    ),
                                  ],
                                ))),
                ],
              ),
            ),
          ),
        )),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buttonRow(
              Icon: Icons.g_mobiledata_sharp,
              GlobalKey: _formKey,String: "Google  ",
            ),
            buttonRow(Icon: Icons.facebook, GlobalKey: _formKey,String: "FACEBOOK",)

          ],
        ),
      ),
    );
  }
}

class buttonRow extends StatefulWidget {
  final Icon;

  final GlobalKey;
  final String;

  const buttonRow({super.key, required this.Icon, required this.GlobalKey,required this.String});

  @override
  State<buttonRow> createState() => _buttonRowState();
}

class _buttonRowState extends State<buttonRow> {
  bool isloading = false;

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
          setState(() async {
            if (this.widget.GlobalKey.currentState!.validate()) {
            } else {
              setState(() {
                isloading = false;
              });
            }
          });
        },
        child: isloading
            ? Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                CircularProgressIndicator(color: Colors.white, strokeWidth: 3),
                SizedBox(
                  width: 10,
                ),
                Text(""+this.widget.String.toUpperCase(),
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
                    ""+this.widget.String.toUpperCase(),
                    style: TextStyle(
                        color: Colors.white, fontFamily: "fonts/TrajanPro.ttf"),
                  ),
                ],
              ));
  }
}
