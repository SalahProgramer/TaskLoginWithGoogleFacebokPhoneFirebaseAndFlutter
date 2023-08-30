import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'main.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  FirebaseAuth inst=FirebaseAuth.instance;



  var user=FirebaseAuth.instance.currentUser;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    inst.authStateChanges().listen((user) {
      if(user==null){
        print("No have a user");
        Navigator.of(context).pop();
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MyApp(),));
      }
      else{
        print("have user");
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("images/backgroound.jpg"))),
                child: SafeArea(
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              margin: EdgeInsets.all(20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xff00008b), width: 3),
                                          borderRadius: BorderRadius.circular(40),
                                        )),
                                    backgroundImage: AssetImage("images/res2.png"),
                                    radius: 40,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 20, top: 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(user!.email.toString()+"",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                                fontFamily: 'CrimsonText')),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Flutter Developer".toUpperCase(),
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.blue,
                                                letterSpacing: 3,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  )
                                ],
                              )),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                          alignment: Alignment.center,
                                          child: AlertDialog(
                                            elevation: 19,
                                            alignment: Alignment.center,
                                            shadowColor: Colors.red,
                                            shape: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 5, color: Colors.black),
                                              borderRadius: BorderRadius.circular(25),
                                            ),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    setState(() {


                                                      inst.signOut();

                                                    });
                                                  },
                                                  child: Text("Yes".toUpperCase(),
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          color: Colors.blue,
                                                          letterSpacing: 3,
                                                          fontWeight:
                                                          FontWeight.bold))),
                                              TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      Navigator.pop(context);
                                                    });
                                                  },
                                                  child: Text("No".toUpperCase(),
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          color: Colors.blue,
                                                          letterSpacing: 3,
                                                          fontWeight: FontWeight.bold)))
                                            ],
                                            title: Text(
                                              "Are you sure to exit?",
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.black,
                                                  letterSpacing: 3,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ));
                                    },
                                  );
                                  // Navigator.push(context,MaterialPageRoute(builder: (context) => login(),));
                                });
                              },
                              icon: Icon(Icons.cancel_outlined))
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        height: 833,
                        padding: EdgeInsets.all(40),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50))),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 80,
                                      child: FloatingActionButton(
                                        onPressed: () {},
                                        child: Icon(
                                          Icons.home,
                                          color: Colors.deepPurple,
                                        ),
                                        elevation: 9,
                                        backgroundColor: Colors.white,
                                        shape: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(50),
                                            borderSide:
                                            BorderSide(color: Colors.deepPurple)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Dashboard",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontFamily: 'Pacifico'))
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 80,
                                      child: FloatingActionButton(
                                        onPressed: () {},
                                        child: Icon(
                                          Icons.maps_home_work_sharp,
                                          color: Colors.deepPurple,
                                        ),
                                        elevation: 9,
                                        backgroundColor: Colors.white,
                                        shape: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(50),
                                            borderSide:
                                            BorderSide(color: Colors.deepPurple)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Homework",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontFamily: 'Pacifico'))
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 80,
                                      child: FloatingActionButton(
                                        onPressed: () {},
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          child: Image.asset("images/d.png"),
                                        ),
                                        elevation: 9,
                                        backgroundColor: Colors.white,
                                        shape: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(50),
                                            borderSide:
                                            BorderSide(color: Colors.deepPurple)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Attendance",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontFamily: 'Pacifico'))
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 80,
                                      child: FloatingActionButton(
                                        onPressed: () {},
                                        child: Icon(
                                          Icons.details_rounded,
                                          color: Colors.deepPurple,
                                        ),
                                        elevation: 9,
                                        backgroundColor: Colors.white,
                                        shape: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(50),
                                            borderSide:
                                            BorderSide(color: Colors.deepPurple)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Fee Details",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontFamily: 'Pacifico'))
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 80,
                                      child: FloatingActionButton(
                                        onPressed: () {},
                                        child: Icon(
                                          Icons.person,
                                          color: Colors.deepPurple,
                                        ),
                                        elevation: 9,
                                        backgroundColor: Colors.white,
                                        shape: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(50),
                                            borderSide:
                                            BorderSide(color: Colors.deepPurple)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Examination",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontFamily: 'Pacifico'))
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 80,
                                      child: FloatingActionButton(
                                        onPressed: () {},
                                        child: Icon(
                                          Icons.maps_home_work_outlined,
                                          color: Colors.deepPurple,
                                        ),
                                        elevation: 9,
                                        backgroundColor: Colors.white,
                                        shape: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(50),
                                            borderSide:
                                            BorderSide(color: Colors.deepPurple)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Report Card",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontFamily: 'Pacifico'))
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 80,
                                      child: FloatingActionButton(
                                        onPressed: () {},
                                        child: Icon(
                                          Icons.calendar_month,
                                          color: Colors.deepPurple,
                                        ),
                                        elevation: 9,
                                        backgroundColor: Colors.white,
                                        shape: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(50),
                                            borderSide:
                                            BorderSide(color: Colors.deepPurple)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Calender",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontFamily: 'Pacifico'))
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 80,
                                      child: FloatingActionButton(
                                        onPressed: () {},
                                        child: Icon(
                                          Icons.developer_board,
                                          color: Colors.deepPurple,
                                        ),
                                        elevation: 9,
                                        backgroundColor: Colors.white,
                                        shape: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(50),
                                            borderSide:
                                            BorderSide(color: Colors.deepPurple)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Notice Board",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontFamily: 'Pacifico'))
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 80,
                                      child: FloatingActionButton(
                                        onPressed: () {},
                                        child: Icon(
                                          Icons.mediation_sharp,
                                          color: Colors.deepPurple,
                                        ),
                                        elevation: 9,
                                        backgroundColor: Colors.white,
                                        shape: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(50),
                                            borderSide:
                                            BorderSide(color: Colors.deepPurple)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Multi Media",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontFamily: 'Pacifico'))
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 80,
                                      child: FloatingActionButton(
                                        onPressed: () {},
                                        child: Icon(
                                          Icons.cabin,
                                          color: Colors.deepPurple,
                                        ),
                                        elevation: 9,
                                        backgroundColor: Colors.white,
                                        shape: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(50),
                                            borderSide:
                                            BorderSide(color: Colors.deepPurple)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Academic Year",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontFamily: 'Pacifico'))
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 80,
                                      child: FloatingActionButton(
                                        onPressed: () {},
                                        child: Icon(
                                          Icons.person,
                                          color: Colors.deepPurple,
                                        ),
                                        elevation: 9,
                                        backgroundColor: Colors.white,
                                        shape: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(50),
                                            borderSide:
                                            BorderSide(color: Colors.deepPurple)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Profile",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontFamily: 'Pacifico'))
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      setState(() {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                                alignment: Alignment.center,
                                                child: AlertDialog(
                                                  elevation: 19,
                                                  alignment: Alignment.center,
                                                  shadowColor: Colors.red,
                                                  shape: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 5, color: Colors.black),
                                                    borderRadius:
                                                    BorderRadius.circular(25),
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () {
                                                          setState(() {
                                                           inst.signOut();
                                                          });
                                                        },
                                                        child: Text("Yes".toUpperCase(),
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                color: Colors.blue,
                                                                letterSpacing: 3,
                                                                fontWeight:
                                                                FontWeight.bold))),
                                                    TextButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            Navigator.pop(context);
                                                          });
                                                        },
                                                        child: Text("No".toUpperCase(),
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                color: Colors.blue,
                                                                letterSpacing: 3,
                                                                fontWeight:
                                                                FontWeight.bold)))
                                                  ],
                                                  title: Text(
                                                    "Are you sure to exit?",
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        color: Colors.black,
                                                        letterSpacing: 3,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                ));
                                          },
                                        );
                                      });
                                    },
                                    child: Text("Log out".toUpperCase(),
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.blue,
                                            letterSpacing: 3,
                                            fontWeight: FontWeight.bold)))
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )),
    );
  }
}
