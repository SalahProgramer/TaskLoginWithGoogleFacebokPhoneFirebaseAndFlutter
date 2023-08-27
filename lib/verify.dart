import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:task4/animation.dart';
import 'package:task4/register.dart';

class verfiy extends StatefulWidget {
  const verfiy({super.key});

  @override
  State<verfiy> createState() => _verfiyState();
}

class _verfiyState extends State<verfiy> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController g = TextEditingController();

  FocusNode ver1 = FocusNode();
  FocusNode ver2 = FocusNode();
  FocusNode ver3 = FocusNode();

  // FirebaseAuth instance = FirebaseAuth.instance;
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 80, bottom: 20),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/background.jpg"), fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "OTP Verification",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 35,
                          color: Colors.white,
                          fontFamily: "Pacifico"),
                    ),
                  ),
                  SizedBox(
                    height: 90,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Enter OTP code to Sent\n \nto Mobile no",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontFamily: "fonts/TrajanPro.ttf")),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.white12,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white)),
                        child: TextField(
                          // focusNode: ver0,
                          onChanged: (value) {
                            print(value.toString());
                            FocusScope.of(context).requestFocus(ver1);
                          },
                          style: TextStyle(
                              height: 1, fontSize: 40, color: Colors.white),
                          textAlign: TextAlign.center,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.lime),
                              ),
                              contentPadding: EdgeInsets.all(20),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.white),
                              )),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 80,

                        decoration: BoxDecoration(
                            color: Colors.white12,

                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white)),
                        child: TextField(
                          controller: g,
                          focusNode: ver1,
                          onChanged: (value) {
                            FocusScope.of(context).requestFocus(ver2);
                          },
                          style: TextStyle(
                              height: 1, fontSize: 40, color: Colors.white),
                          textAlign: TextAlign.center,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.lime),
                              ),
                              contentPadding: EdgeInsets.all(20),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.white),
                              )),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.white12,

                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white)),
                        child: TextField(
                          focusNode: ver2,
                          onChanged: (value) {
                            FocusScope.of(context).requestFocus(ver3);
                          },
                          style: TextStyle(
                              height: 1, fontSize: 40, color: Colors.white),
                          textAlign: TextAlign.center,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.lime),
                              ),
                              contentPadding: EdgeInsets.all(20),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.white),
                              )),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.white12,

                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white)),
                        child: TextField(
                          focusNode: ver3,
                          style: TextStyle(
                              height: 1, fontSize: 40, color: Colors.white),
                          textAlign: TextAlign.center,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.lime),
                              ),
                              contentPadding: EdgeInsets.all(20),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.white),
                              )),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.20,
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      width: 190,
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
                          await Future.delayed(Duration(seconds: 1));
                          setState(() {
                            isloading=false;
                          });
                          },
                          child: isloading
                              ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(
                                    color: Colors.white, strokeWidth: 3),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Verify & PROCEED".toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily:
                                        "fonts/TrajanPro.ttf"))
                              ])
                              : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.verified),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Verify & PROCEED".toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "fonts/TrajanPro.ttf"),
                              ),
                            ],
                          ))),
                  SizedBox(
                    height: 30,
                  ),
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

                            Navigator.of(context).push(animation(page: register()));



                          },
                          child: Text(
                            "Register",
                            style: TextStyle(fontSize: 15),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
