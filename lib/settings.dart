import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'Schedule.dart';
import 'home.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController bedTimeController = new TextEditingController();
  final TextEditingController wakeUpController = new TextEditingController();
  final TextEditingController prescriptionController =
      new TextEditingController();
  final TextEditingController breakfastController = new TextEditingController();
  final TextEditingController lunchController = new TextEditingController();
  final TextEditingController dinnerController = new TextEditingController();
  final TextEditingController startExerciseontroller =
      new TextEditingController();
  final TextEditingController endExerciseController =
      new TextEditingController();

  String? bed;
  String? wake;
  String? exStart;
  String? exEnd;
  String? breakfast;
  String? lunch;
  String? dinner;

  TimeOfDay? time;
  TimeOfDay? picked;

  File? selectedImage;
  String? message = "";

  var final_response;

  uploadImage() async {
    final request = http.MultipartRequest(
        "POST",
        Uri.parse(
            'http://8d75-2401-4900-16d9-79ff-41a4-815d-3220-7dda.ngrok.io/upload'));
    final headers = {"Content-type": "multipart/form-data"};
    request.files.add(http.MultipartFile('image',
        selectedImage!.readAsBytes().asStream(), selectedImage!.lengthSync(),
        filename: selectedImage!.path.split("/").last));
    request.headers.addAll(headers);
    final response = await request.send();
    http.Response res = await http.Response.fromStream(response);
    final resJson = jsonDecode(res.body);
    message = resJson["message"];
    prescriptionController.text = "Image Uploaded Successfully!";
    setState(() {});
  }

  Future getImage() async {
    final pickedImage =
        await ImagePicker().getImage(source: ImageSource.gallery);
    selectedImage = File(pickedImage!.path);
    prescriptionController.text = "Image Uploaded Successfully!";
    uploadImage();
    setState(() {});
  }

  navigateToHome() async {
    Navigator.pushReplacementNamed(context, "Home");
  }

  @override
  void initState() {
    super.initState();
    time = TimeOfDay.now();
  }

  Future<Null> selectTime(BuildContext context, TextEditingController t) async {
    picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        time = picked;
      });
    }
    t.text = picked.toString().substring(10, 15);
  }

  Future<void> _savingData() async {
    final validation = _formkey.currentState?.validate();
    if (!validation!) {
      return;
    }

    _formkey.currentState?.save();
  }

  Widget build(BuildContext context) {
    final bedTimeField = TextFormField(
      autofocus: false,
      controller: bedTimeController,
      keyboardType: TextInputType.datetime,
      onTap: () {
        selectTime(context, bedTimeController);
      },
      onSaved: (value) {
        bedTimeController.text = value!;
        bed = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please, Enter mandatory details.");
        }
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.add_circle_outlined),
        contentPadding: EdgeInsets.all(20),
        hintText: "Bed Time",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );

    final wakeUpField = TextFormField(
      autofocus: false,
      controller: wakeUpController,
      keyboardType: TextInputType.datetime,
      onTap: () {
        selectTime(context, wakeUpController);
      },
      onSaved: (value) {
        wakeUpController.text = value!;
        wake = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please, Enter mandatory details.");
        }
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        suffixIcon: Icon(
          Icons.add_circle_outlined,
        ),
        contentPadding: EdgeInsets.all(20),
        hintText: "Wake Up Time",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );

    final prescriptionField = TextFormField(
      autofocus: false,
      controller: prescriptionController,
      keyboardType: TextInputType.text,
      onSaved: (value) {
        prescriptionController.text = "Image uploaded successfully.";
      },
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please, Enter mandatory details.");
        }
      },
      onTap: () {
        getImage();
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.add_circle_outlined),
        contentPadding: EdgeInsets.all(20),
        hintText: "Upload Prescription",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );

    final breakfastField = TextFormField(
      autofocus: false,
      controller: breakfastController,
      keyboardType: TextInputType.datetime,
      onTap: () {
        selectTime(context, breakfastController);
      },
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please, Enter mandatory details.");
        }
      },
      onSaved: (value) {
        breakfastController.text = value!;
        breakfast = value;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.add_circle_outlined),
        contentPadding: EdgeInsets.all(20),
        hintText: "Breakfast Time",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );

    final lunchField = TextFormField(
      autofocus: false,
      controller: lunchController,
      keyboardType: TextInputType.datetime,
      onTap: () {
        selectTime(context, lunchController);
      },
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please, Enter mandatory details.");
        }
      },
      onSaved: (value) {
        lunchController.text = value!;
        lunch = value;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.add_circle_outlined),
        contentPadding: EdgeInsets.all(20),
        hintText: "Lunch Time",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );

    final dinnerField = TextFormField(
      autofocus: false,
      controller: dinnerController,
      keyboardType: TextInputType.datetime,
      onTap: () {
        selectTime(context, dinnerController);
      },
      onSaved: (value) {
        dinnerController.text = value!;
        dinner = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please, Enter mandatory details.");
        }
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.add_circle_outlined),
        contentPadding: EdgeInsets.all(20),
        hintText: "Dinner Time",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );

    final startExerciseField = TextFormField(
      autofocus: false,
      controller: startExerciseontroller,
      keyboardType: TextInputType.datetime,
      onTap: () {
        selectTime(context, startExerciseontroller);
      },
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please, Enter mandatory details.");
        }
      },
      onSaved: (value) {
        startExerciseontroller.text = value!;
        exStart = value;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.add_circle_outlined),
        contentPadding: EdgeInsets.all(20),
        hintText: "Exerice Time (Start)",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );

    final endExerciseField = TextFormField(
      autofocus: false,
      controller: endExerciseController,
      keyboardType: TextInputType.datetime,
      onTap: () {
        selectTime(context, endExerciseController);
      },
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please, Enter mandatory details.");
        }
      },
      onSaved: (value) {
        endExerciseController.text = value!;
        exEnd = value;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.add_circle_outlined),
        contentPadding: EdgeInsets.all(20),
        hintText: "Exercise Time (End)",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );

    final backButton = Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(20),
      color: Colors.blue,
      child: MaterialButton(
        onPressed: navigateToHome,
        padding: EdgeInsets.all(20),
        minWidth: 100,
        child: Text(
          "Back",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    final scheduleButton = Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(20),
      color: Colors.blue,
      child: MaterialButton(
        onPressed: () async {
          _savingData();

          final url = Uri.parse(
              'http://8d75-2401-4900-16d9-79ff-41a4-815d-3220-7dda.ngrok.io/schedule');

          final response = await http.post(url,
              body: json.encode({
                'bed': bed,
                'wake': wake,
                'lunch': lunch,
                'breakfast': breakfast,
                'dinner': dinner,
                'exStart': exStart,
                'exEnd': exEnd
              }),
              headers: {'Content-type': "application/json; charset=utf-8"});

          print('StatusCode: ${response.statusCode}');
          print('Return Date: ${response.body}');
          Fluttertoast.showToast(
              msg: "Scheduling is completed.", timeInSecForIosWeb: 3);
          final ans = jsonDecode(response.body) as Map<String, dynamic>;
          if (response.statusCode == 200) {
            final jsonResponse =
                jsonDecode(response.body) as Map<String, dynamic>;
            print(jsonResponse[8.5]);
          } else {
            print('Request Failed!');
          }

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => Schedule(
                drugs: ans,
              ),
            ),
          );
          // final response2 = await http.get(url);
          // print(response2.body);

          // final decoded = json.decode(response2.body) as Map<String, dynamic>;

          // setState(() {
          //   final_response = decoded[8.5];
          // });
          // print(final_response);
        },
        padding: EdgeInsets.all(20),
        minWidth: 100,
        child: Text(
          "Schedule",
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
          onPressed: navigateToHome,
        ),
        title: Text(
          "Settings",
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
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                        child: Text(
                          "Sleeping Time :",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                color: Colors.blue,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: .5),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      bedTimeField,
                      SizedBox(
                        height: 5,
                      ),
                      wakeUpField,
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 20,
                        child: Text(
                          "Prescription :",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                color: Colors.blue,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: .5),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      prescriptionField,
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 20,
                        child: Text(
                          "Meal Time :",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                color: Colors.blue,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: .5),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      breakfastField,
                      SizedBox(
                        height: 5,
                      ),
                      lunchField,
                      SizedBox(
                        height: 5,
                      ),
                      dinnerField,
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 20,
                        child: Text(
                          "Exercise Time :",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                color: Colors.blue,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: .5),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      startExerciseField,
                      SizedBox(
                        height: 5,
                      ),
                      endExerciseField,
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          backButton,
                          SizedBox(
                            width: 10,
                          ),
                          scheduleButton,
                        ],
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
