// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/admin/addSurveyor.dart';
import 'package:flutter_application_2/pages/admin/removeSurveyor.dart';

import 'adminScreen.dart';
import 'surveyor.dart';

class bottomSurveyor extends StatefulWidget {
  const bottomSurveyor({ Key? key }) : super(key: key);

  @override
  State<bottomSurveyor> createState() => _bottomState();
}

class _bottomState extends State<bottomSurveyor> {
    int currentIndex = 0;
  final screens=[
      addSurveyor(),
      aSurveyor(),
      rSurveyor(),
      Admin()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
                  bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.white,
              currentIndex: currentIndex,
              onTap:(index) => setState(()=> currentIndex =index),
              // ignore: prefer_const_literals_to_create_immutables
              items: [
        BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'Surveyor',
            backgroundColor: Colors.green),
        BottomNavigationBarItem(
            icon: const Icon(Icons.assignment_ind),
            label: 'Add Surveyor',
            backgroundColor: Colors.green),
        BottomNavigationBarItem(
         icon: const Icon(Icons.construction),
         label: 'Remove Surveyor',
         backgroundColor: Colors.green),
         BottomNavigationBarItem(
         icon: const Icon(Icons.construction),
         label: 'Home',
         backgroundColor: Colors.green)
      ]),

      
    );
  }
}
