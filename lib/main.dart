import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/ap.dart';
import 'package:flutter_application_2/pages/appointment.dart';
import 'package:flutter_application_2/pages/dateTime/date.dart';
import 'package:flutter_application_2/pages/home.dart';
import 'package:flutter_application_2/pages/service.dart';
import 'package:flutter_application_2/pages/showvehicle.dart';
import 'package:flutter_application_2/pages/surveyor/surveyorPanel.dart';
import 'package:flutter_application_2/pages/vehicle.dart';
import 'package:flutter_application_2/pages/welcome.dart';

import 'pages/admin/adminScreen.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    // ignore: prefer_const_constructors
    return MaterialApp(
      title: 'Demo',
      // ignore: prefer_const_constructors
      home : AP()
    );
  }
}