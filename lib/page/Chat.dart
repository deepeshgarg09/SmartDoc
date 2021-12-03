import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:senops/model/user.dart';
import 'package:senops/api/firebaseAPI.dart';
import 'package:senops/widgets/chatBody.dart';
import 'package:senops/widgets/chatHeader.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  navigateToHome() async {
    Navigator.pushReplacementNamed(context, "Home");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 5,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: navigateToHome,
          ),
          title: Text(
            "Chat with Doctor",
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: .5),
            ),
          ),
        ),
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: StreamBuilder<List<user>>(
              stream: FirebaseAPI.getUsers(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  default:
                    if (snapshot.hasError) {
                      print(snapshot.error);
                      return buildText('Something went wrong. Try again later');
                    } else {
                      final usr = snapshot.data;
                      if (usr!.isEmpty) {
                        return buildText('No Users found');
                      } else {
                        return Column(
                          children: [
                            ChatHeaderWidget(users: usr),
                            ChatBodyWidget(users: usr)
                          ],
                        );
                      }
                    }
                }
              }),
        ));
  }

  Widget buildText(String s) => Center(
        child: Text(
          s,
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      );
}
