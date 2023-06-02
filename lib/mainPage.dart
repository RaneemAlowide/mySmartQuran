import 'package:mysmartquran/sessions.dart';
import 'package:mysmartquran/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mysmartquran/animation/FadeAnimation.dart';
import 'package:mysmartquran/login.dart';
import 'package:mysmartquran/signup.dart';
import 'MyAI.dart';
import 'package:mysmartquran/mainPage.dart';
import 'setting.dart';



void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: mainPage(),
      )
  );
}
class mainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  MaterialPageRoute(builder: (context) {
                    return mainPage();
                  }),
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
                    ));
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
      ),
      body: SafeArea(
        child: Container(

          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
                Text(
                  "Welcome, to SmartQuran ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),

              SizedBox(height: 40),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFe5e1e8),
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                        Text(
                          "Raneem",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.black,
                          ),
                        ),

                        Icon(
                          Icons.account_circle,
                          color: Colors.black,
                          size: 40,
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Text(
                      "Learning progress",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10,),
                    LinearProgressIndicator(
                      value: 0.3,
                      backgroundColor: Colors.white,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "0%",
                          style: TextStyle(
                            color:Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "100%",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child:
                            MaterialButton(
                              minWidth: 150,
                              height: 100,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => LoginPage()),
                                );
                              },
                              color: Color(0xFFC88EA7),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                "My Quran",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                            ),

                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                            child:
                            MaterialButton(
                              minWidth: 150,
                              height: 100,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => MyAi()),
                                );
                              },
                              color: Color(0xFFE3F4F4),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                "My AI helper",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child:
                            MaterialButton(
                              minWidth: 150,
                              height: 100,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => sessionsPage()),
                                );
                              },
                              color: Color(0xFFD6E8DB),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                "My sessions",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child:
                            MaterialButton(
                              minWidth: 150,
                              height: 100,
                              onPressed: () {},
                              color: Color(0xFFFFBF9B),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                "Tafser",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 50),
                ],
              ),
        ),
      ),
    );
  }
}

