import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mysmartquran/animation/FadeAnimation.dart';
import 'mainPage.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'setting.dart';
import 'main.dart';

void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: settingpage(),
      )
  );
}
class settingpage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<settingpage> {
  bool screenReaderEnabled = false;
  bool captionsEnabled = false;
  bool signLanguageVideosEnabled = false;

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Settings",
          style: TextStyle(color: Colors.black),
        ),
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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: MaterialButton(
              onPressed: () {},
              child: Image.asset(
                'assets/ask.png',
                width: 60,
                height: 40,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return mainPage();
                    },
                  ),
                );
              },
              child: Image.asset(
                'assets/Myquran.png',
                width: 60,
                height: 40,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return settingpage();
                    },
                  ),
                );
              },
              child: Icon(
                Icons.settings,
                color: Color(0xFF19376D),
                size: 30,
              ),
            ),
            label: '',
          ),
        ],
        backgroundColor: Color(0xFFA6B1E1),
        // Bottom navigation bar items...
      ),

      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column (
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Accessibility Options:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(left: 17, right: 17),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Screen Reader",
                            style: TextStyle(fontSize: 16),
                          ),
                          Switch(
                            value: screenReaderEnabled,
                            onChanged: (value) {
                              setState(() {
                                screenReaderEnabled = value;
                                print(screenReaderEnabled);
                              });
                            },
                            activeTrackColor: Colors.lightGreenAccent,
                            activeColor: Colors.green,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(left: 17, right: 17),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Captions",
                            style: TextStyle(fontSize: 16),
                          ),
                          Switch(
                            value: captionsEnabled,
                            onChanged: (value) {
                              setState(() {
                                captionsEnabled = value;
                                print(captionsEnabled);
                              });
                            },
                            activeTrackColor: Colors.lightGreenAccent,
                            activeColor: Colors.green,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(left: 17, right: 17),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Sign Language Videos",
                            style: TextStyle(fontSize: 16),
                          ),
                          Switch(
                            value: signLanguageVideosEnabled,
                            onChanged: (value) {
                              setState(() {
                                signLanguageVideosEnabled = value;
                                print(signLanguageVideosEnabled);
                              });
                            },
                            activeTrackColor: Colors.lightGreenAccent,
                            activeColor: Colors.green,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text("__________________________________________________"),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    minWidth: 300,
                    height: 40,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    color: Color(0xFFFF6969),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "logout",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}





