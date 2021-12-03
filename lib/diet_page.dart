import 'package:flutter/material.dart';

class dietpage extends StatefulWidget {
  const dietpage({Key? key}) : super(key: key);

  @override
  _dietpageState createState() => _dietpageState();
}

class _dietpageState extends State<dietpage> {
  navigateToHome() async {
    Navigator.pushReplacementNamed(context, "Home");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Exercises to Improve Strength & Balance ',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.5),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: navigateToHome,
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 15.0),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Colors.white],
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
                  Container(
                    margin: EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                        width: 5,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        text: 'Walking ',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                          wordSpacing: 0.4,
                          height: 1.3,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                ' is one of the best & least stressful and accessible forms of exercise. ',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                        width: 5,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        text: 'Regular stretching : ',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                          wordSpacing: 0.4,
                          height: 1.3,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                'Stretching should be done every day because it’s an essential exercise to keep your muscles in top condition.',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                        width: 5,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                          text: 'Chair yoga ',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.blue[800],
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                            wordSpacing: 0.4,
                            height: 1.3,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  'is a low-impact form of exercise that improves muscle strength, mobility, balance and flexibility.',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                        width: 5,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        text: 'Stationary cycling',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                          wordSpacing: 0.4,
                          height: 1.3,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                ' is a great form of aerobic exercise and the best part is that it doesn’t exert any impact on your joints, so there’s a very minimal chance of injury.',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                        width: 5,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        text: 'Pilates : ',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                          wordSpacing: 0.4,
                          height: 1.3,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                'Breathing, alignment, concentration and core strength are emphasized.',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
