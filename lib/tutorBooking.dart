import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'BookedPage.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'setting.dart';
import 'mainPage.dart';
void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Tutor(),
      )
  );
}




class Tutor extends StatefulWidget {
  @override
  _TutorState createState() => _TutorState();
}
class _TutorState extends State<Tutor> {
  int _selectedIndex = 0;


  List<Widget> _widgetOptions = <Widget>[
    TeacherList(),
  ];

  List<Teacher> bookedSessions=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Teacher booking",
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
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search teachers...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[200],
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
          ),
        ],
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
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _openSessionsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SessionsBookedPage(bookedSessions: bookedSessions),
      ),
    );
  }
}

class TeacherList extends StatefulWidget {
  @override
  TeacherListState createState() => TeacherListState();
}

class TeacherListState extends State<TeacherList> {
  List<Teacher> _teachers = [
    Teacher(
      name: 'الشيخ محمد',
      availability: 'Monday 10am - 12pm',
      subject: 'تفسير سورة البقرة',
      isBooked: false,
    ),
    Teacher(
      name: 'أ.عبدالعزيز',
      availability: 'Tuesday 2pm - 4pm',
      subject: 'حلقة ذكر',
      isBooked: false,
    ),
    Teacher(
      name: 'أ.عبدالله',
      availability: 'Wednesday 9am - 11am',
      subject: 'تفسير',
      isBooked: false,
    ),
    Teacher(
      name: 'الشيخ سلمان',
      availability: 'Thursday 1pm - 3pm',
      subject: 'حلقة حفظ',
      isBooked: false,
    ),
    Teacher(
      name: 'الشيخ خالد',
      availability: 'Friday 3pm - 5pm',
      subject: 'حلقة اسئلة',
      isBooked: false,
    ),
  ];

  List<Teacher> bookedSessions = [];

  Future<void> writeBookingToFile(Teacher teacher) async {
    final file = await _localFile;
    final sessionInfo = '${teacher.name}, ${teacher.availability}, ${teacher
        .subject}\n';

    try {
      await file.writeAsString(sessionInfo, mode: FileMode.append);
    } catch (e) {
      print('Error writing to file: $e');
    }
  }

  Future<File> get _localFile async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/mybookings.txt');
  }

  void _bookSession(Teacher teacher) async {
    if (!teacher.isBooked && isSessionAvailable(teacher)) {
      setState(() {
        teacher.isBooked = true;
        bookedSessions.add(teacher);
      });

      await writeBookingToFile(teacher);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Session booked with ${teacher.name}')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Selected session is fully booked')),
      );
    }
  }


  bool isSessionAvailable(Teacher teacher) {
    if (teacher.name == 'الشيخ محمد') {
      return false;
    }
    return true;
  }

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _teachers.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            _bookSession(_teachers[index]);
          },
          child: Container(
            margin: EdgeInsets.all(4),
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blueGrey),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 3,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: ListTile(
              title: Text(
                _teachers[index].name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5c7878),
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _teachers[index].availability,
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  Text(
                    'Subject: ${_teachers[index].subject}',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ), // Additional subtitle for subject
                ],
              ),
              trailing: _teachers[index].isBooked
                  ? Text('Booked')
                  : ElevatedButton(
                onPressed: () {
                  _bookSession(_teachers[index]);
                },
                child: Text('Book now'),
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.grey; // Color when button is pressed
                      } else if (states.contains(MaterialState.disabled)) {
                        return Colors.grey; // Color when button is disabled
                      }
                      return Color(0xFFB27C93); // Default color when button is enabled
                    },
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

  class Teacher {
  final String name;
  final String availability;
  final String subject;
  bool isBooked;

  Teacher({
    required this.name,
    required this.availability,
    required this.subject,
    this.isBooked = false,
  });
}

class SessionItem extends StatelessWidget {
  final String tutorName;

  SessionItem({required this.tutorName});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(tutorName),
    );
  }
}
