import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:senops/model/userModel.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController NameController = new TextEditingController();
  final TextEditingController confirmPasswordController =
      new TextEditingController();

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
          prefixIcon: Icon(Icons.email),
          hintText: "Email",
          contentPadding: EdgeInsets.all(15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    final nameField = TextFormField(
      autofocus: false,
      controller: NameController,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please, Enter your name.");
        }
        return null;
      },
      onSaved: (value) {
        NameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle_rounded),
          hintText: "Full Name",
          contentPadding: EdgeInsets.all(15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      onSaved: (value) {
        passwordController.text = value!;
      },
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Please, Enter your password.");
        }
        if (!regex.hasMatch(value)) {
          return ("Password length required: Min 6 characters.");
        }
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          hintText: "Password",
          contentPadding: EdgeInsets.all(15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: confirmPasswordController,
      obscureText: true,
      onSaved: (value) {
        confirmPasswordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      validator: (value) {
        if (passwordController.text != confirmPasswordController.text) {
          return ("Passwords don't match.");
        }
        return null;
      },
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          hintText: "Confirm Password",
          contentPadding: EdgeInsets.all(15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    final registerButton = Material(
      elevation: 5,
      color: Colors.blue,
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        onPressed: () {
          signUp(emailController.text, passwordController.text);
        },
        padding: EdgeInsets.all(20),
        minWidth: MediaQuery.of(context).size.width,
        child: Text(
          "Register",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: navigateToStart,
        ),
        title: Text(
          "Back to Main Screen",
          style: GoogleFonts.lato(
            textStyle: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: .5),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 280,
                      child: Image.asset(
                        'images/3.jpeg',
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 30,
                      child: Text(
                        'Please, Enter your details :',
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
                    nameField,
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
                    confirmPasswordField,
                    SizedBox(
                      height: 25,
                    ),
                    registerButton,
                    SizedBox(
                      height: 25,
                    ),
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFiretore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFiretore() async {
    FirebaseFirestore ff = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    userModel uM = userModel();

    uM.email = user!.email;
    uM.uid = user.uid;
    uM.fullName = NameController.text;

    await ff.collection("users").doc(user.uid).set(uM.toMap());
    Fluttertoast.showToast(msg: "Account created successfully.");
    navigateToHome();
  }
}
