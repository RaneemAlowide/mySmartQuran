import 'package:mysmartquran/tutorBooking.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'setting.dart';
import 'mainPage.dart';




class SessionsBookedPage extends StatefulWidget {
  final List<Teacher> bookedSessions;

  SessionsBookedPage({required this.bookedSessions});

  @override
  _SessionsBookedPageState createState() => _SessionsBookedPageState();
}

class _SessionsBookedPageState extends State<SessionsBookedPage> {
  List<String> sessionData = [];

  @override
  void initState() {
    super.initState();
    readBookingFromFile();
  }

  void readBookingFromFile() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();

      setState(() {
        sessionData = contents.split('\n').where((line) => line.isNotEmpty).toList();
      });
    } catch (e) {
      print('Error reading file: $e');
    }
  }

  Future<File> get _localFile async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/mybookings.txt');
  }

  void deleteSession(int index) async {
    setState(() {
      sessionData.removeAt(index);
    });

    final file = await _localFile;
    await file.writeAsString(sessionData.join('\n'));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Session deleted')),
    );
  }

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
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "My sessions",
          style: TextStyle(color: Colors.black),
        ),
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

      body: sessionData.isNotEmpty
          ? ListView.builder(
        itemCount: sessionData.length,
        itemBuilder: (BuildContext context, int index) {
          final sessionInfo = sessionData[index].split(',');

          return ListTile(
            title: Text(sessionInfo[0]), // Teacher name
            subtitle: Text(
                'Start Time: ${sessionInfo[1]}\nEnd Time: ${sessionInfo[2]}'),
            trailing: ElevatedButton(
              onPressed: () {
                deleteSession(index);
              },
              child: Text('cancel booking'),
              style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF5c7878)), // Change the button color here
            ),

            ),
          );
        },
      )
          : Center(
        child: Text('No sessions booked'),
      ),
    );
  }
}
