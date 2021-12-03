import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Schedule.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var favoriteStar = false;

  navigateToStart() async {
    Navigator.pushReplacementNamed(context, "Start");
  }

  navigateToReading() async {
    Navigator.pushReplacementNamed(context, "Reading");
  }

  navigateToDiet() async {
    Navigator.pushReplacementNamed(context, "Diet");
  }

  navigateToSettings() async {
    Navigator.pushReplacementNamed(context, "Settings");
  }

  navigateToChat() async {
    Navigator.pushReplacementNamed(context, "Chat");
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF2196F3),
                Color(0xFF2196F3),
                // Colors.cyan, Colors.yellow], stops: [0.5, 1.0
              ],
            ),
          ),
        ),
        elevation: 0.0,
        title: Text(
          'SmartDoc',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: navigateToStart,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(favoriteStar ? Icons.star : Icons.star_border),
            onPressed: () {
              setState(() {
                if (favoriteStar) {
                  favoriteStar = false;
                } else {
                  favoriteStar = true;
                }
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                // Color(0xFF2196F3),
                // Color(0xFF2196F3),
                Colors.white, Colors.white
              ],
              stops: [0.5, 1.0],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),
                      child: Image(
                        image: Picture().albumCover,
                        // -> remove below 2 lines if you don't like it .
                        fit: BoxFit.cover,
                        width: queryData.size.width / 1.5, height: 300,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.blue,
                      width: 5,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: RichText(
                    text: TextSpan(
                      text: ' Welcome to ',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'SmartDoc! ',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                            text: '👩‍⚕️\u200d', // emoji characters
                            style: TextStyle(
                              fontFamily: 'EmojiOne',
                              fontSize: 25,
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: navigateToChat,
                      child: Container(
                        // foregroundDecoration: ,
                        height: 100,
                        width: queryData.size.width / 2.5,
                        margin: EdgeInsets.only(
                          left: 2,
                          right: 1,
                        ),
                        padding: EdgeInsets.only(
                          left: 15,
                          right: 15,
                          top: 30,
                          bottom: 15,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red[400],
                          border: Border.all(
                            color: Colors.blue,
                            width: 2.5,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: RichText(
                          text: TextSpan(
                            text: '👩🏾‍⚕️\u200d ', // emoji characters
                            style: TextStyle(
                              fontFamily: 'EmojiOne',
                              fontSize: 22,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Chat with Doc',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    letterSpacing: .5),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: navigateToSettings,
                      child: Container(
                        height: 100,
                        width: queryData.size.width / 2.5,
                        margin: EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        padding: EdgeInsets.only(
                          left: 25,
                          right: 15,
                          top: 30,
                          bottom: 15,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green[400],
                          border: Border.all(
                            color: Colors.blue,
                            width: 2.5,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: RichText(
                          text: TextSpan(
                            text: '⌛\u200d ', // emoji characters
                            style: TextStyle(
                              fontFamily: 'EmojiOne',
                              fontSize: 22,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Schedule',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    letterSpacing: .5),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: navigateToReading,
                      child: Container(
                        height: 100,
                        width: queryData.size.width / 2.5,
                        margin: EdgeInsets.only(
                          left: 2,
                          right: 1,
                        ),
                        padding: EdgeInsets.only(
                          left: 35,
                          right: 15,
                          top: 30,
                          bottom: 15,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.yellow[700],
                          border: Border.all(
                            color: Colors.blue,
                            width: 2.5,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: RichText(
                          text: TextSpan(
                            text: '📖\u200d ', // emoji characters
                            style: TextStyle(
                              fontFamily: 'EmojiOne',
                              fontSize: 22,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Reading',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    letterSpacing: .5),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: navigateToDiet,
                      child: Container(
                        height: 100,
                        width: queryData.size.width / 2.5,
                        margin: EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        padding: EdgeInsets.only(
                          left: 30,
                          right: 15,
                          top: 30,
                          bottom: 15,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(
                            color: Colors.blueAccent,
                            width: 2.5,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: RichText(
                          text: TextSpan(
                            text: '🧘‍♂️\u200d ', // emoji characters
                            style: TextStyle(
                              fontFamily: 'EmojiOne',
                              fontSize: 22,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Exercises',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    letterSpacing: .5),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('search'),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              title: Text('camera'),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('person'),
              backgroundColor: Colors.blue),
        ],
      ),
    );
  }
}

class Picture {
  String title = 'IMG';
  String creatorName = 'ABC';
  AssetImage albumCover = AssetImage('images/1.png');
}


//  Children:const<Widget>[
//  Icon(
//       Icons.settings,
//       size: 24.0,
//     ),
//     Icon(
//       Icons.description,
//       size: 30.0,
//     ),
//     Icon(
//       Icons.find_in_page
//       color: Colors.blue,
//       size: 36.0,
//     ),
//   ],





