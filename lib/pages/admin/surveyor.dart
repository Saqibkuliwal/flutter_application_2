// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/admin/showSurveyor.dart';

import 'addSurveyor.dart';
import 'removeSurveyor.dart';

class addSurveyor extends StatefulWidget {
  const addSurveyor({Key? key}) : super(key: key);

  @override
  State<addSurveyor> createState() => _addSurveyorState();
}

class _addSurveyorState extends State<addSurveyor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 151, 245, 154),
      appBar: AppBar(
        title: Text('Admin Panel'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(15)),
            Container(
              height: 120.0,
              width: 120.0,
              // ignore: prefer_const_constructors
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('img/survey.png'),
                  fit: BoxFit.fill,
                ),
                shape: BoxShape.circle,
              ),
            ),
            Container(
              // decoration: new BoxDecoration(color: Colors.green),
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.all(29),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => showSurveyor()));
                          },
                          child: Text(
                            'Show All  Surveyors',
                            style: TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                                backgroundColor:
                                    Color.fromARGB(255, 207, 228, 246)),
                          ))),
                  Container(
                      padding: EdgeInsets.all(29),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => aSurveyor()));
                          },
                          child: Text(
                            'Add          Surveyor',
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                backgroundColor:
                                    Color.fromARGB(255, 207, 228, 246)),
                          ))),
                  Container(
                      padding: EdgeInsets.all(29),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => rSurveyor()));
                          },
                          child: Text(
                            'Remove       Surveyor',
                            style: TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                                backgroundColor:
                                    Color.fromARGB(255, 207, 228, 246)),
                          ))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
