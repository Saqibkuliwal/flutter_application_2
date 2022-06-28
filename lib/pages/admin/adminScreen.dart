// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/admin/bottomServeyor.dart';
import 'package:flutter_application_2/pages/admin/mechanic.dart';
import 'package:flutter_application_2/pages/admin/surveyor.dart';
import 'package:flutter_application_2/pages/bill.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 151, 245, 154),
      appBar: AppBar(
        title: Text('Admin Panel'),
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(15)),
            Container(
              height: 120.0,
              width: 120.0,
             
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('img/admin.png'),
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
                                    builder: (context) => bottomSurveyor()));
                          },
                          child: Text(
                            '➊   Surveyor ↠',
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
                                    builder: (context) => addMechanic()));
                          },
                          child: Text(
                            '➋   Mechanic ↠',
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
                                    builder: (context) => bill()));
                          },
                          child: Text(
                        '➌    Reports  ↠',
                        style: TextStyle(
                            fontSize: 28,
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
