import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:task4/animation.dart';
import 'package:task4/register.dart';

class verfiy extends StatefulWidget {
  final String numberphone;

  const verfiy({super.key, required this.numberphone});

  @override
  State<verfiy> createState() => _verfiyState();
}

class _verfiyState extends State<verfiy> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController control1 = TextEditingController();
  TextEditingController control2 = TextEditingController();
  TextEditingController control3 = TextEditingController();
  TextEditingController control4 = TextEditingController();
  TextEditingController control5 = TextEditingController();
  TextEditingController control6 = TextEditingController();

  FocusNode ver0 = FocusNode();

  FocusNode ver1 = FocusNode();
  FocusNode ver2 = FocusNode();
  FocusNode ver3 = FocusNode();
  FocusNode ver4 = FocusNode();
  FocusNode ver5 = FocusNode();
  String? phoneno;
  String? smscode;
  String? verify;




  var verificationId = "";
  dynamic credentials;
  // final _userRepo = Get.put(UserRepository());

  // UserModel? _userModel;
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

  @override
  void initState() {
    print((this.widget.numberphone)+"                   jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
    verifyPhoneNumber(this.widget.numberphone);

    super.initState();
  }

// FirebaseAuth instance = FirebaseAuth.instance;
  bool isloading = false;

  sendCode() async {
    try {
      String smsCode = control1.text.toString() +
          control2.text.toString() +
          control3.text.toString() +
          control4.text.toString() +
          control5.text.toString() +
          control6.text.toString();
      // Create a PhoneAuthCredential with the code
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verify!, smsCode: smsCode);
      FirebaseAuth instance = FirebaseAuth.instance;


      // Sign the user in (or link) with the credential
      await instance.signInWithCredential(credential);
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Error Not correct the value,check",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.black,
          fontSize: 16.0);
    }
  }

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
                        width: 60,
                        decoration: BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white)),
                        child: TextField(
                          controller: control1,
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
                        width: 60,
                        decoration: BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white)),
                        child: TextField(
                          controller: control2,
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
                        width: 60,
                        decoration: BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white)),
                        child: TextField(
                          controller: control3,
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
                        width: 60,
                        decoration: BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white)),
                        child: TextField(
                          controller: control4,
                          focusNode: ver3,
                          onChanged: (value) {
                            print(value.toString());
                            FocusScope.of(context).requestFocus(ver4);
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
                        width: 60,
                        decoration: BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white)),
                        child: TextField(
                          controller: control5,
                          focusNode: ver4,
                          onChanged: (value) {
                            print(value.toString());
                            FocusScope.of(context).requestFocus(ver5);
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
                        width: 60,
                        decoration: BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white)),
                        child: TextField(
                          controller: control6,
                          focusNode: ver5,
                          // onChanged: (value) {
                          //   print(value.toString());
                          //   FocusScope.of(context).requestFocus(ver4);
                          // },
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
                    height: MediaQuery.of(context).size.height * 0.20,
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
                            sendCode();
                            await Future.delayed(Duration(seconds: 2));
                            setState(() {
                              isloading = false;
                            });
                          },
                          child: isloading
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                      CircularProgressIndicator(
                                          color: Colors.lightBlueAccent,
                                          strokeWidth: 1),
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
                            Navigator.of(context)
                                .push(animation(page: register()));
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
