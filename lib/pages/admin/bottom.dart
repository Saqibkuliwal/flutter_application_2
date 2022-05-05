// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'adminScreen.dart';
import 'mechanic.dart';
import 'surveyor.dart';

class bottom extends StatefulWidget {
  const bottom({ Key? key }) : super(key: key);

  @override
  State<bottom> createState() => _bottomState();
}

class _bottomState extends State<bottom> {
    int currentIndex = 0;
  final screens=[
      Admin(),
      addSurveyor(),
      addMechanic(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
                  bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.green,
              currentIndex: currentIndex,
              onTap:(index) => setState(()=> currentIndex =index),
              // ignore: prefer_const_literals_to_create_immutables
              items: [
        BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.green),
        BottomNavigationBarItem(
            icon: const Icon(Icons.assignment_ind),
            label: 'Surveyor',
            backgroundColor: Colors.green),
        BottomNavigationBarItem(
         icon: const Icon(Icons.construction),
         label: 'Mechanic',
         backgroundColor: Colors.green)
      ]),

      
    );
  }
}