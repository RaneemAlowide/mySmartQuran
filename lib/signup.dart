import 'package:flutter/material.dart';
import 'package:mysmartquran/animation/FadeAnimation.dart';
import 'mainPage.dart';
// import 'DatabaseHelper.dart';
import 'login.dart';
import 'dart:async';

import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String email = '';
  String password = '';
  String username = '';
  int number = 0;
  int age = 0;

  void saveSignupData() async {
    final signupData = {
      'username': username,
      'email': email,
      'number': number,
      'age': age,
      'password': password,
    };

    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/signup_data.json');

    await file.writeAsString(jsonEncode(signupData));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Create an account, It's free",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  makeInput(
                    label: "Username",
                    obscureText: false,
                    onChanged: (value) {
                      username = value;
                      print(username);
                    },
                  ),
                  makeInput(
                    label: "Email",
                    obscureText: false,
                    onChanged: (value) {
                      email = value;
                      print(email);
                    },
                  ),
                  makeInput(
                    label: "Phone number",
                    obscureText: false,
                    onChanged: (value) {
                      number = int.parse(value);
                      print(number);
                    },
                  ),
                  makeInput(
                    label: "Age",
                    obscureText: false,
                    onChanged: (value) {
                      age = int.parse(value);
                      print(age);
                    },
                  ),
                  makeInput(
                    label: "Password",
                    obscureText: true,
                    onChanged: (value) {
                      password = value;
                      print(value);
                    },
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 3, left: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border(
                    bottom: BorderSide(color: Colors.black),
                    top: BorderSide(color: Colors.black),
                    left: BorderSide(color: Colors.black),
                    right: BorderSide(color: Colors.black),
                  ),
                ),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    if (isValidSignup(username, email, number, age, password)) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => mainPage()),
                      );
                      saveSignupData();
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Invalid Signup"),
                            content: Text("Please fill in all fields correctly."),
                            actions: <Widget>[
                              TextButton(
                                child: Text("OK"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  color: Color(0xFFb9afc3),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Already have an account?"),
                  Text(
                    " Login",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeInput({label, obscureText = false, onChanged}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 1),
        TextField(
          obscureText: obscureText,
          onChanged: onChanged,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  bool isValidSignup(
      String username,
      String email,
      int number,
      int age,
      String password,
      ) {
    // Perform your signup validation here
    // Return true if the signup is valid, otherwise return false
    // You can replace this with your own logic to validate the signup
    return username.isNotEmpty &&
        email.isNotEmpty &&
        number > 0 &&
        age > 0 &&
        password.isNotEmpty;
  }
}


