import 'package:flutter/material.dart';
import 'package:flutter_application_2/billapp.dart';
import 'package:flutter_application_2/pages/ap.dart';
import 'package:flutter_application_2/pages/bill.dart';
import 'package:flutter_application_2/yourappoint.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'showvehicle.dart';

class Hme extends StatefulWidget {
  const Hme({ Key? key }) : super(key: key);

  @override
  State<Hme> createState() => _HmeState();
}

class _HmeState extends State<Hme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('WORKSHOP AUTOMATION'),
      centerTitle: true,
      automaticallyImplyLeading: false,),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Card(
          child: Container(
            height: 100,
            
            child: Center(
              child: ListTile(
                onTap: (() => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const showVehicle()))),
                leading: const Icon(Icons.car_repair),
                title:const Text("MY VEHICLES      ➻",style: TextStyle(fontSize: 26),),
              ),
            ),
          ),
          elevation: 8,
          shadowColor: Colors.blueAccent,
          margin:const EdgeInsets.all(20),
          shape:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:const BorderSide(color: Colors.blueAccent, width: 1)
          ),
        ),
        
        Card(
          child: Container(
            height: 100,
            
            child: Center(
              child: ListTile(
                onTap: (() => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const yourAppoint()))),
                leading: const Icon(Icons.car_repair),
                title:const Text("MY APPOINTMENTS ➻",style: TextStyle(fontSize: 22),),
              ),
            ),
          ),
          elevation: 8,
          shadowColor: Colors.blueAccent,
          margin:const EdgeInsets.all(20),
          shape:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:const BorderSide(color: Colors.blueAccent, width: 1)
          ),
        ),
        Card(
          child: Container(
            height: 100,
            
            child: Center(
              child: ListTile(
                onTap: (() => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const billapp()))),
                leading: const Icon(Icons.car_repair),
                title:const Text("BILLS                    ➻",style: TextStyle(fontSize: 26),),
              ),
            ),
          ),
          elevation: 8,
          shadowColor: Colors.blueAccent,
          margin:const EdgeInsets.all(20),
          shape:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:const BorderSide(color: Colors.blueAccent, width: 1)
          ),
        ),
        Card(
          child: Container(
            height: 100,
            
            child: Center(
              child: ListTile(
                onTap: (() => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AP()))),
                leading: const Icon(Icons.car_repair),
                title:const Text("LOGOUT               ➻",style: TextStyle(fontSize: 26),),
              ),
            ),
          ),
          elevation: 8,
          shadowColor: Colors.blueAccent,
          margin:const EdgeInsets.all(20),
          shape:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:const BorderSide(color: Colors.blueAccent, width: 1)
          ),
        ),
        ],
      ),
    );
  }
}