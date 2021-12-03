import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  navigateToStart() async {
    Navigator.pushReplacementNamed(context, "Start");
  }

  navigateToHome() async {
    Navigator.pushReplacementNamed(context, "Home");
  }

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please, Enter your Email.");
        }
        if (!RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
          return ("Please, Enter a valid Email.");
        }

        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.all(20),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Please, Enter your password.");
        }
        if (!regex.hasMatch(value)) {
          return ("Password length required: Min 6 characters.");
        }
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.all(20),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blue,
      child: MaterialButton(
        onPressed: () {
          signIn(emailController.text, passwordController.text);
        },
        padding: EdgeInsets.all(20),
        minWidth: MediaQuery.of(context).size.width,
        child: Text(
          "LOGIN",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 5,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: navigateToStart,
        ),
        title: Text(
          "Login",
          style: GoogleFonts.lato(
            textStyle: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: .5),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
                padding: EdgeInsets.all(20),
                child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 400,
                          child: Image.asset(
                            'images/3.jpeg',
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          child: Text(
                            'Please, Enter your credentials :',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: .2),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        emailField,
                        SizedBox(
                          height: 25,
                        ),
                        passwordField,
                        SizedBox(
                          height: 25,
                        ),
                        loginButton,
                        SizedBox(
                          height: 25,
                        ),

                        // SizedBox(
                        //   height: 25,
                        Material(
                          borderRadius: BorderRadius.circular(25),
                          elevation: 5,
                          color: Colors.white,
                          child: MaterialButton(
                            padding: EdgeInsets.all(15),
                            onPressed: navigateToStart,
                            child: Text(
                              " <- Back",
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: .2),
                              ),
                            ),
                          ),
                        )
                        // )
                      ],
                    ))),
          ),
        ),
      ),
    );
  }

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login Successful!"),
                navigateToHome(),
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}
