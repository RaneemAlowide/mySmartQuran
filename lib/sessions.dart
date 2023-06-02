import 'package:mysmartquran/signup.dart';
import 'package:mysmartquran/tutorBooking.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mysmartquran/animation/FadeAnimation.dart';
import 'package:table_calendar/table_calendar.dart';
import 'BookedPage.dart';
import 'mainPage.dart';
import 'setting.dart';


void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  sessionsPage(),
      )
  );
}
class sessionsPage extends StatefulWidget {
  @override
  _SessionsPageState createState() => _SessionsPageState();
}

class _SessionsPageState extends State<sessionsPage> {
  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  void _openBookingsPage(BuildContext context) {
    // Replace this with your implementation to open the bookings page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SessionsBookedPage(bookedSessions: [],)),
    );
  }


  void _openAvailableTeachersPage(BuildContext context) {
    // Replace this with your implementation to open the available teachers page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Tutor()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("My sessions", style: TextStyle(color: Colors.black),),
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black,),
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
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
                Text(
                  "My Calendar",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),

              SizedBox(height: 10),

              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFe5e1e8),
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(15),
                ),

                child: Column(
                  children: [
                    //Text(("Selected day: ") + today.toString().split(" ")[0]),
                    Container(
                      child: TableCalendar(
                        headerStyle: HeaderStyle(
                          formatButtonVisible: false,
                          titleCentered: true,
                        ),
                        rowHeight: 40,
                        availableGestures: AvailableGestures.all,
                        selectedDayPredicate: (day) => isSameDay(day, today),
                        focusedDay: today,
                        firstDay: DateTime.utc(2010, 10, 16),
                        lastDay: DateTime.utc(2030, 3, 14),
                        onDaySelected: _onDaySelected,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child:
                        MaterialButton(
                          minWidth: 400,
                          height: 80,
                          onPressed: () {
                            _openBookingsPage(context);
                          },
                          color: Color(0xFFE3F4F4),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            "My booked sessions",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                        ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child:
                        MaterialButton(
                          minWidth: 400,
                          height: 80,
                          onPressed: () {
                            _openAvailableTeachersPage(context);
                          },
                          color: Color(0xFFD6E8DB),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            "Available sessions/Teachers",
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
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}


