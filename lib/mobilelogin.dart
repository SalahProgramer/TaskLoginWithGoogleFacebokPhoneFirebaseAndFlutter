import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class phone extends StatefulWidget {
  const phone({super.key});

  @override
  State<phone> createState() => _phoneState();
}

class _phoneState extends State<phone> {
  final _formKey = GlobalKey<FormState>();

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
                      "Enter your mobile no",
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
                        Text(
                            "You will receive a 4 digitcode to \n \nverify next",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: "fonts/TrajanPro.ttf")),
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 40, right: 40, top: 20),
                      padding: EdgeInsets.only(
                          left: 20, right: 20, bottom: 10, top: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(colors: [
                            Colors.blueAccent,
                            Colors.black,
                            Colors.teal,
                          ], transform: GradientRotation(9)),
                          border: Border.all(color: Colors.white)),
                      child: Stack(
                        children: [
                          InternationalPhoneNumberInput(
                            onInputChanged: (value) {},

                            initialValue: PhoneNumber(isoCode: 'PS'),
                            textAlign: TextAlign.center,
                            searchBoxDecoration: InputDecoration(

                              labelText: "Search by country name or dial code",

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
                              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                              leadingPadding: 0,
                              useEmoji: false,
                              showFlags: true,
                              setSelectorButtonAsPrefixIcon: false,
                            ),
                            inputDecoration: InputDecoration(
                              border: InputBorder.none,
                                // enabledBorder: OutlineInputBorder(
                                //     borderSide: BorderSide(
                                //         color: Colors.white, width: 2),
                                //     borderRadius: BorderRadius.circular(20)),
                                // border: OutlineInputBorder(
                                //     borderSide: BorderSide(
                                //         color: Colors.white, width: 2),
                                //     borderRadius: BorderRadius.circular(20)),
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




                      // TextField(
                      //   // autovalidateMode: AutovalidateMode.onUserInteraction,
                      //
                      //   style: TextStyle(color: Colors.white, fontSize: 15),
                      //   decoration: InputDecoration(
                      //     suffixIcon: InternationalPhoneNumberInput(
                      //         cursorColor: Colors.white,
                      //
                      //         textStyle: TextStyle(
                      //             color: Colors.white
                      //
                      //         ),
                      //         onInputChanged: (value) {}),
                      //       filled: true,
                      //       contentPadding: EdgeInsets.all(50),
                      //
                      //       labelStyle: TextStyle(color: Colors.white),
                      //       hintText: "Mobile no",
                      //       hintStyle:
                      //           TextStyle(color: Colors.white70, fontSize: 15),
                      //       prefixIcon: Icon(
                      //         Icons.phone_android_rounded,
                      //         color: Colors.white,
                      //       ),
                      //       border: OutlineInputBorder(
                      //           borderRadius:
                      //               BorderRadius.all(Radius.circular(20)),
                      //           borderSide: BorderSide(color: Colors.white)),
                      //       enabledBorder: OutlineInputBorder(
                      //           borderRadius:
                      //               BorderRadius.all(Radius.circular(20)),
                      //           borderSide: BorderSide(color: Colors.white))),
                      //
                      //   keyboardType: TextInputType.number,
                      // )
                      ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.20,
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      width: 160,
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
                                  width: 10,
                                ),
                                Text("send otp".toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily:
                                        "fonts/TrajanPro.ttf"))
                              ])
                              : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.send),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "send otp".toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "fonts/TrajanPro.ttf"),
                              ),
                            ],
                          ))),
                  SizedBox(height: 30,),
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
                          onPressed: () {},
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
