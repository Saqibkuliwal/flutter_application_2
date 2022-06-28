// ignore_for_file: prefer_const_constructors, unused_label, unrelated_type_equality_checks

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../main.dart';
class ServiceRequestView extends StatefulWidget {
   ServiceRequestView({ Key? key , required this.name}) : super(key: key);
  String name; 
  @override
  State<ServiceRequestView> createState() => _ServiceRequestViewState();
}

class _ServiceRequestViewState extends State<ServiceRequestView> {
  List? serviceList;
  String ? Timeslt;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      getData();
      getPhoneNumber();
  }

  getData() async {
    print(widget.name);
 String url =
        "http://$ip/workshopp/api/customer/checkMechanicasRequest?name=${widget.name}";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      serviceList = json.decode(response.body);
      print(serviceList);
      
      setState(() {});
    } else {
      serviceList = [];
      print('error');
    }
  }
  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return Scaffold(
       
        body: 
        //serviceList == null ? loading() : showserv());
         SafeArea(
          child: ListView(
        children: [
          Container(
            height: size.height * 0.1,
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
             
            ),
          ),
          Container(
            height: size.height * 0.8,
            color: Color.fromRGBO(255, 255, 255, 1),
            child: serviceList == null ? loading() : showserv()
          ),
          Container(
            height: size.height * 0.1,
            
            color: Colors.blue,
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
                            // ignore: avoid_print
                            
                          String? time =  Timeslt;

                          print(time);
                          print(widget.name);
                            String url =
                                "http://${ip}/workshopp/api/customer/Done?name=${widget.name}&timeno=$time";

                            var response = await http.get(
                              Uri.parse(url),
                            );
                            if (response.statusCode == 200) {
                              print('OK.................');
                            
                             
                            }
                            else {print(response.body);};
                        String url2 =
                                "http://${ip}/workshopp/api/customer/Donee?appno=5112";

                            var response2 = await http.get(
                              Uri.parse(url2),
                            );
                            if (response2.statusCode == 200) {
                              print('OK2.................');
                            
                             
                            }
                            else {print("error2");};
                          },
                          child: const Text(
                            "Done",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                color: Colors.black),
                          ),
       
       
    ),
    );
  }

  loading() {
    return Container(
        // ignore: 
        child: Center(
      child: SpinKitHourGlass(
        color: Color(0xFF0f65b3),
        size: 80.0,
      ),
    ));
  }
  showserv() {
    return ListView.builder(
      itemCount: serviceList?.length,
      itemBuilder: (context, index) {
        String regno = serviceList![index]["name"];
        
        
        
        return Container(
            height: 150,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            color: Color.fromARGB(255, 78, 171, 246),
            child: Center(
              
              child: ListTile(
                  leading: const Icon(Icons.person, color: Colors.white),
                  title: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       
                       
                        Text('Services To Do:',style: TextStyle(color: Colors.white,)),
                        Text(serviceList![index]["name"],
                        
                            style: TextStyle(
                                fontSize: 26, color: Color.fromARGB(255, 32, 24, 24))),
                        
                      ],
                    ),
                  ),
                 
                  ),
                  
            )
            );
      },
    );
    // ignore: dead_code
    
  }
getPhoneNumber() async{
    SharedPreferences prefrence2 = await SharedPreferences.getInstance();
                  Timeslt= prefrence2.getString("Time");
                  print("Time = ${Timeslt}");
  }
}