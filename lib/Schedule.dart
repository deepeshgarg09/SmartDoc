// ignore: file_names
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class scheduleArray {
  Map<String, dynamic> scheduleArr;

  scheduleArray(this.scheduleArr);
}

class Schedule extends StatefulWidget {
  final Map<String, dynamic>? drugs;

  const Schedule({Key? key, this.drugs}) : super(key: key);

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  navigateToHome() async {
    Navigator.pushReplacementNamed(context, "Home");
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int l = widget.drugs!.length;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 5,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              navigateToHome();
            },
          ),
          title: Text(
            "Back",
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: .5),
            ),
          ),
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              alignment: Alignment.topCenter,
              color: Colors.blue,
              height: MediaQuery.of(context).size.height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.calendar_today, color: Colors.white),
                      SizedBox(
                        width: 15,
                      ),
                      RichText(
                        text: TextSpan(
                            text: "Schedule ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 30,
                            ),
                            children: [
                              TextSpan(
                                text: " By SmartDoc",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                ),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 80,
              child: Container(
                height: MediaQuery.of(context).size.height - 210,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            if (widget.drugs!.containsKey('Info 1'))
                              for (var entry in widget.drugs!.entries)
                                if (entry.key.substring(0, 4) == 'Info')
                                  buildTaskListItem(
                                      entry.key, entry.value, 18, ""),
                            if (widget.drugs!.containsKey('Info 1') == false)
                              for (var entry in widget.drugs!.entries)
                                if (entry.key.substring(0, 4) != 'Info')
                                  buildTaskListItem(
                                      entry.key, entry.value, 25, " IST")
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }

  Container buildTaskListItem(String time, String work, double fS, String t) {
    return Container(
      margin: EdgeInsets.only(bottom: 05, top: 30),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 20,
                height: 15,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(5),
                    )),
              ),
              SizedBox(
                width: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: time,
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: t,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                              ),
                            )
                          ]),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.only(right: 10, left: 30),
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  work,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: fS,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
