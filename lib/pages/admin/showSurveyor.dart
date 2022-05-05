// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class showSurveyor extends StatefulWidget {
  const showSurveyor({Key? key}) : super(key: key);

  @override
  State<showSurveyor> createState() => _showSurveyorState();
}

class _showSurveyorState extends State<showSurveyor> {
  List? surveyorList = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllSurveyors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Surveyors')),
        body: surveyorList == null ? loading() : allSurveyors());
  }

  getAllSurveyors() async {
    String url = "http://192.168.18.93/workshopp/api/customer/surveyors";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      surveyorList = json.decode(response.body);
    } else {
      surveyorList = null;
      print('error');
    }
    setState(() {});
  }

  loading() {
    return Container(
        child: Center(
      child: SpinKitCircle(
        color: Color(0xFF0f65b3),
        size: 80.0,
      ),
    ));
  }

  allSurveyors() {
    return ListView.builder(
      itemCount: surveyorList?.length,
      itemBuilder: (context, index) {
        return Container(
            height: 150,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            color: Color.fromARGB(255, 78, 171, 246),
            child: Center(
              child: ListTile(
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  

                  children: [
                    SizedBox(height: 5),
                    Text('Mobile Number',style: TextStyle(fontWeight: FontWeight.w600,
                    fontSize: 17,),),
                    SizedBox(height: 10),
                    Text(
                  surveyorList![index]["mobile_no"],
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold),
                ),
                  ],
                ),
                title: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Name',style: TextStyle(fontWeight: FontWeight.w600),),
                      Text(surveyorList![index]["name"],
                          style:
                              TextStyle(fontSize: 26, color: Colors.redAccent)),
                      Text('Password',style: TextStyle(fontWeight: FontWeight.w600),),
                      Text(surveyorList![index]["password"],
                          style: TextStyle(
                            fontSize: 26,
                            color: Colors.redAccent,
                          )),
                    ],
                  ),
                ),
                trailing: Container(
                  height: 30.0,
                  width: 30.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('img/survey.png'),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ));
      },
    );
  }
}
