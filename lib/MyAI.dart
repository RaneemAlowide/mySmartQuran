import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mysmartquran/animation/FadeAnimation.dart';
import 'setting.dart';
import 'mainPage.dart';
import 'setting.dart';
void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyAi(),
      )
  );
}


class MyAi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "My AI Helper",
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
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 30),
                Text(
                "لنتقن سورة الفاتحه",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
               ),


              SizedBox(height: 30),
                Container(
                  height: 450,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('assets/alfateha.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

              SizedBox(height: 15),
                Text(
                  "press and start reading",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),

              SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    // Handle button press
                  },
                  child: Material(
                    elevation: 10, // Adjust the elevation value as needed
                    shape: CircleBorder(),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xE7BB9AA6),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.mic,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

            ],
          ),
        ),
      ),
    );
  }
}