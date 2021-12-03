import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './start.dart';
import 'package:google_fonts/google_fonts.dart';
import './login.dart';
import './register.dart';
import './home.dart';
import './settings.dart';
import './page/Chat.dart';
import 'diet_page.dart';
import 'Reading.dart';
// import './page/chat_page.dart';
import './api/firebaseAPI.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await FirebaseAPI.addRandomUsers(Users.initUsers);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
        primaryColor: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Start(),
      routes: <String, WidgetBuilder>{
        "Login": (BuildContext context) => Login(),
        "Start": (BuildContext context) => Start(),
        "Register": (BuildContext context) => Register(),
        "Home": (BuildContext context) => Home(),
        "Settings": (BuildContext context) => Settings(),
        "Chat": (BuildContext context) => ChatPage(),
        "Diet": (BuildContext context) => dietpage(),
        "Reading": (BuildContext context) => Readingpage(),
      },
    );
  }
}
