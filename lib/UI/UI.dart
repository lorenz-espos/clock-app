import 'dart:async';
import 'dart:io';
import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  static ThemeMode theme = ThemeMode.light;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime dateToday = new DateTime.now();
  TimeOfDay time = new TimeOfDay.now();
  int currYear = 0;
  int currMonth = 0;
  int currDay = 0;
  int button = 0;
  var color = Colors.black;
  var colorS = Colors.red;
  static ThemeMode theme = ThemeMode.light;
  void darkMode() {
    theme = ThemeMode.dark;
    MyHomePage.theme = theme;
    color = Colors.white;
    colorS = Colors.orange;
  }

  void lightMode() {
    theme = ThemeMode.light;
    MyHomePage.theme = theme;
    color = Colors.black;
    colorS = Colors.red;
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (time.minute != TimeOfDay.now().minute) {
        setState(() {
          time = TimeOfDay.now();
        });
      }
    });
  }

  _MyHomePageState() {
    currYear = dateToday.year;
    currMonth = dateToday.month;
    currDay = dateToday.day;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          //darkMode button
          IconButton(
            icon: Icon(CupertinoIcons.lightbulb_fill),
            onPressed: () {
              if (button == 0) {
                darkMode();
                button++;
              } else {
                lightMode();
                button = 0;
              }
            },
            tooltip: ('Change Mode'),
          ),
        ],
        elevation: 0,
      ),
      body: Column(
        children: [
          //digital clock
          Card(
            child: Container(
              height: 120,
              child: Row(
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Expanded(
                        child: Icon(
                          Icons.access_time,
                          size: 50,
                        ),
                        flex: 2,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 10,
                            child: ListTile(
                              title: Text(
                                '  ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              subtitle: Text(
                                '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 60,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    flex: 5,
                  ),
                ],
              ),
            ),
            elevation: 10,
            margin: EdgeInsets.all(10),
          ),
          Card(
            child: Container(
              height: 300,
              child: AnalogClock(
                showDigitalClock: false,
                isLive: true,
                tickColor: color,
                minuteHandColor: color,
                hourHandColor: color,
                numberColor: color,
                secondHandColor: colorS,
              ),
            ),
            elevation: 10,
            margin: EdgeInsets.all(10),
          ),
          Card(
            child: Container(
              height: 120,
              child: Row(
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Expanded(
                        child: Icon(
                          CupertinoIcons.calendar,
                          size: 50,
                        ),
                        flex: 2,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 10,
                            child: ListTile(
                              title: Text(
                                '  ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              subtitle: Text(
                                '$currDay-$currMonth-$currYear',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    flex: 5,
                  ),
                ],
              ),
            ),
            elevation: 10,
            margin: EdgeInsets.all(10),
          ),
        ],
      ),
    );
  }
}
