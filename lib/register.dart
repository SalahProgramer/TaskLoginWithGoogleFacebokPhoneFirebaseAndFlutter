import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:task4/main.dart';

import 'animation.dart';
import 'dashboard.dart';
import 'mobilelogin.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  String? verify;

  verifyPhoneNumber(String num) async {
    FirebaseAuth instance = FirebaseAuth.instance;

    await FirebaseAuth.instance.verifyPhoneNumber(
      timeout: Duration(seconds: 30),
      phoneNumber: num.trim().toString(),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await instance.signInWithCredential(credential);
        Fluttertoast.showToast(
            msg: "Success",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.black,
            fontSize: 16.0);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          Fluttertoast.showToast(
              msg: "The provided phone number is not valid",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.blue,
              textColor: Colors.black,
              fontSize: 16.0);
        } else {
          Fluttertoast.showToast(
              msg: "SMS verification code request failed",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.blue,
              textColor: Colors.black,
              fontSize: 16.0);
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        verify = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        verify = verificationId;
        Fluttertoast.showToast(
            msg: "Timed out waiting for SMS",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.black,
            fontSize: 16.0);
      },
    );
  }

  bool passowrd = true;
  bool conpassowrd = true;
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController conpass = TextEditingController();
  FirebaseAuth instance = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  // FirebaseAuth instance = FirebaseAuth.instance;
  bool isloading = false;
  bool isloadingphone = false;
  bool visible = true;
  String number = "";

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
                          "Register",
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
                                labelStyle: TextStyle(
                                    color: Colors.white, fontSize: 15),
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
                        height: 25,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 40, right: 40, top: 20),
                          child: TextFormField(
                            // autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: conpass,
                            obscureText: conpassowrd,

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
                                      conpassowrd = !conpassowrd;
                                      //
                                    });
                                  },
                                  icon: Icon(
                                    (conpassowrd == true
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                    color: Colors.white,
                                  ),
                                ),
                                filled: true,
                                labelText: "Confirm Password",
                                labelStyle: TextStyle(color: Colors.white),
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
                        height: 25,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 40, right: 40, top: 20),
                        padding: EdgeInsets.only(
                            left: 20, right: 20, bottom: 10, top: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white)),
                        child: Stack(
                          children: [
                            InternationalPhoneNumberInput(
                              onInputChanged: (value) {
                                number = value.phoneNumber.toString();
                              },
                              initialValue: PhoneNumber(isoCode: 'PS'),
                              textAlign: TextAlign.center,
                              searchBoxDecoration: InputDecoration(
                                labelText:
                                    "Search by country name or dial code",
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2),
                                    borderRadius: BorderRadius.circular(20)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2),
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              selectorTextStyle: TextStyle(color: Colors.white),
                              cursorColor: Colors.white,
                              formatInput: false,
                              textStyle: TextStyle(color: Colors.white),
                              selectorConfig: SelectorConfig(
                                selectorType:
                                    PhoneInputSelectorType.BOTTOM_SHEET,
                                leadingPadding: 0,
                                useEmoji: false,
                                showFlags: true,
                                setSelectorButtonAsPrefixIcon: false,
                              ),
                              inputDecoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Enter Phone number",
                                  hintStyle: TextStyle(color: Colors.white60),
                                  prefixIcon: Icon(
                                    Icons.phone_android_outlined,
                                    color: Colors.white,
                                  )),
                            ),
                            Positioned(
                                // top: 800,
                                left: 84,
                                top: 4,
                                child: Container(
                                  width: 2,
                                  height: 40,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 65,
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
                                    if (conpass.text.toString() ==
                                        pass.text.toString()) {
                                      try {
                                        UserCredential credential =
                                            await instance
                                                .createUserWithEmailAndPassword(
                                                    email:
                                                        email.text.toString(),
                                                    password:
                                                        pass.text.toString());
                                        verifyPhoneNumber(number);
                                        await Future.delayed(
                                            Duration(seconds: 1));
                                        isloading = false;

                                        Navigator.of(context)
                                            .push(animation(page: profile()));
                                      } on FirebaseAuthException catch (e) {
                                        if (e.code == "email-already-in-use") {
                                          Fluttertoast.showToast(
                                              msg: "The Email was used before",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.CENTER,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.blue,
                                              textColor: Colors.black,
                                              fontSize: 16.0);
                                          print("exeption");
                                          setState(() {
                                            isloading = false;
                                          });
                                        }
                                      }
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: "Thr password not match",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.blue,
                                          textColor: Colors.black,
                                          fontSize: 16.0);
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
                                              color: Colors.lightBlueAccent,
                                              strokeWidth: 1),
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Text("Sign up".toUpperCase(),
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
                                          "Sign up".toUpperCase(),
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
                        children: [
                          Text("Have an account?",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontFamily: "fonts/TrajanPro.ttf")),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .push(animation(page: MyApp()));
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(fontSize: 19),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
