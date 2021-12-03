import 'package:flutter/material.dart';

class Readingpage extends StatefulWidget {
  const Readingpage({Key? key}) : super(key: key);

  @override
  _ReadingpageState createState() => _ReadingpageState();
}

class _ReadingpageState extends State<Readingpage> {
  navigateToHome() async {
    Navigator.pushReplacementNamed(context, "Home");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Essential Health Tips For Seniors',
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
            padding: EdgeInsets.only(right: 15),
          ),
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
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
                        text: 'Keep Yourself Active : ',
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
                                'Do something to keep you fit each day. Physical activity helps you stay at a healthy weight.',
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
                        text: 'Eat well : ',
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
                                'With physical activity, eating nutritious foods in the right amounts can help keep you healthy.',
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
                          text: 'Quit smoking : ',
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
                                  'Take this critical step to improve your health and combat aging. Smoking kills by causing cancer.',
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
                        text: 'Stay up-to-date ',
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
                                'on your health, immunizations and other health screenings.',
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
                        text: 'Manage stress : ',
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
                                'Try exercises or relaxation techniques perhaps meditation or yoga as means of coping.',
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
                        text: 'Get plenty of rest : ',
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
                                'Not only can sleep reduce your stress level, but sleep is how your body repairs itself.',
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
                        text: 'Take steps/actions to prevent infections : ',
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
                                'Getting annual vaccinations is another way to stay healthy throughout the year.',
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
                        text: 'Schedule annual physicals : ',
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
                                'Scheduling a yearly checkup can also keep you healthy.',
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
                        text: 'Avoid contact with people who are sick : ',
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
                                'Another way to protect yourself year-round is to avoid being close to people who are sick. ',
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
                        text: 'The takeaway : ',
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
                                'The flu and other viruses can be dangerous as you become older.',
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
                ],
              ),
            )),
      ),
    );
  }
}
