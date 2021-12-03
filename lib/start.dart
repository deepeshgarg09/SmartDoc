import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_fonts/google_fonts.dart';
import './login.dart';
import './register.dart';
import './responsive.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  void activity() => print('pressed!');
  final List<String> entries = <String>['A', 'B', 'C'];
  navigateToLogin() async {
    Navigator.pushReplacementNamed(context, "Login");
  }

  navigateToRegister() async {
    Navigator.pushReplacementNamed(context, "Register");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SmartDoc",
          style: GoogleFonts.lato(
            textStyle: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                letterSpacing: .5),
          ),
        ),
        backgroundColor: Colors.blue,
        elevation: 5,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // SizedBox(height: 35.0),
                Container(
                  // height: 400,
                  margin: EdgeInsets.only(top: 1.0),
                  child: Image(
                    height: 280.0,
                    image: AssetImage('images/2.png'),
                    // fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 35.0),
                RichText(
                    text: TextSpan(
                        text: 'Welcome to ',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: .5),
                        ),
                        children: <TextSpan>[
                      TextSpan(
                        text: 'SmartDoc! ',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              color: Colors.blue,
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: .2),
                        ),
                      ),
                      TextSpan(
                          text: '👩‍⚕️\u200d', // emoji characters
                          style: TextStyle(
                            fontFamily: 'EmojiOne',
                            fontSize: 40,
                          )),
                    ])),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'A SMART MEDICAL ASSISTANT for you!',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                ),
                SizedBox(
                  height: 20,
                ),
                ButtonTheme(
                  minWidth: 300,
                  height: 40,
                  child: RaisedButton(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.blue,
                    onPressed: navigateToLogin,
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                ButtonTheme(
                  minWidth: 300,
                  height: 40,
                  child: RaisedButton(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Text(
                        'REGISTER',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.blue,
                      onPressed: navigateToRegister),
                ),

                SizedBox(height: 20.0),
                // with custom text

                SizedBox(
                  height: 25.0,
                ),
                Container(
                    margin: EdgeInsets.only(
                      left: 15.0,
                      right: 15.0,
                    ),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                        width: 4.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: RichText(
                        text: TextSpan(
                            text: '☑\u200d ', // emoji characters
                            style: TextStyle(
                              fontFamily: 'EmojiOne',
                            ),
                            children: <TextSpan>[
                          TextSpan(
                            text: 'Easily “scan-and-input” the prescription.',
                            // style: TextStyle(
                            //   fontSize: 16.0,
                            //   // fontStyle: FontStyle.italic,
                            //   color: Colors.black,
                            // ),
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: .5),
                            ),
                          ),
                        ]))),

                Container(
                    margin: EdgeInsets.only(
                      left: 15.0,
                      right: 15.0,
                      top: 15.0,
                    ),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                        width: 4.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: RichText(
                        text: TextSpan(
                            text: '☑\u200d ', // emoji characters
                            style: TextStyle(
                              fontFamily: 'EmojiOne',
                            ),
                            children: <TextSpan>[
                          TextSpan(
                            text:
                                'Personalized drug schedule on daily routine.',
                            // style: TextStyle(
                            //   fontSize: 16.0,
                            //   // fontStyle: FontStyle.italic,
                            //   color: Colors.black,
                            // ),
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: .5),
                            ),
                          ),
                        ]))),
                Container(
                    margin: EdgeInsets.only(
                      left: 15.0,
                      right: 15.0,
                      top: 15.0,
                    ),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                        width: 4.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: RichText(
                        text: TextSpan(
                            text: '☑\u200d ', // emoji characters
                            style: TextStyle(
                              fontFamily: 'EmojiOne',
                            ),
                            children: <TextSpan>[
                          TextSpan(
                            text:
                                'Support for online consultancy with Doctors.',
                            // style: TextStyle(
                            //   fontSize: 16.0,
                            //   // fontStyle: FontStyle.italic,
                            //   color: Colors.black,
                            // ),
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: .5),
                            ),
                          ),
                        ])))
              ]),
        ),
      ),
    );
  }
}
