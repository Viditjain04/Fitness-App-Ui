import 'package:fitness_ui_app/radial_folder.dart';
import 'package:fitness_ui_app/themes/colors.dart';
import 'package:fitness_ui_app/themes/date_utills.dart';
import 'package:fitness_ui_app/top_bar.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness App',
      theme: appTheme,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime selectDate = DateTime.now();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _addDate() {
    selectDate = selectDate.add(Duration(days: 1));
  }

  _subtractDate() {
    selectDate = selectDate.subtract(Duration(days: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pinkAccent[600],
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Stack(children: <Widget>[
                  TopBar(),
                  Positioned(
                    top: 60.0,
                    left: 2.0,
                    right: 2.0,
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 35.0,
                          ),
                          onPressed: () {
                            setState(() {
                              _subtractDate();
                            });
                          },
                        ),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Text(
                                formatterDayOfWeek.format(selectDate),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 27,
                                    color: Colors.yellow,
                                    letterSpacing: 3.3),
                              ),
                              Text(
                                formatterDate.format(selectDate),
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 21.0,
                                    color: Colors.white,
                                    letterSpacing: 1.2),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 35.0,
                          ),
                          onPressed: () {
                            setState(() {
                              _addDate();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ]),
                RadialProgress(),
                SizedBox(
                  height: 38.0,
                ),
                MonthlyTargetRow(),
              ],
            ),
          ],
        ));
  }
}

class MonthlyTargetRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Lost weight',
                      style: TextStyle(
                          decorationStyle: TextDecorationStyle.solid,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Card(
                color: Colors.black,
                elevation: 2.0,
                child: Text(
                  '3.8kg / 7kg',
                  style: TextStyle(
                      color: Colors.white, fontSize: 20.0, letterSpacing: 5.0),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Running per month',
                      style: TextStyle(
                          decorationStyle: TextDecorationStyle.solid,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Card(
                color: Colors.black,
                elevation: 2.0,
                child: Text(
                  '15.3km / 20km',
                  style: TextStyle(
                      color: Colors.white, fontSize: 20.0, letterSpacing: 5.0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
