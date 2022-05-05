import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/admin/addMechanic.dart';
import 'package:flutter_application_2/pages/admin/removeMechanic.dart';
import 'package:flutter_application_2/pages/admin/showMechanic.dart';

class addMechanic extends StatefulWidget {
  const addMechanic({ Key? key }) : super(key: key);

  @override
  State<addMechanic> createState() => _addMechanicState();
}

class _addMechanicState extends State<addMechanic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 151, 245, 154),
      appBar: AppBar(title: Text('Admin Panel'),
      backgroundColor: Colors.green,),
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
                  image: AssetImage('img/mechanic.png'),
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
                                    builder: (context) => showMechanics()));
                          },

                          child: Text(
                        'Show All  Mechanics',
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
                                    builder: (context) => aMechanic()));
                          },

                          child: Text(
                        'Add          Mechanic',
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
                                    builder: (context) => rMechanic()));
                          },

                          child: Text(
                        'Remove       Mechanic',
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