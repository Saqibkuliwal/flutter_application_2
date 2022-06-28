// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, duplicate_ignore

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/home.dart';
import 'package:flutter_application_2/pages/surveyor/mavailable.dart';
import 'package:flutter_application_2/pages/surveyor/surveyorPanel.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:http/http.dart' as http;

import '../../main.dart';

class Servicess extends StatefulWidget {
  Servicess({Key? key, required this.app_id}) : super(key: key);
  String app_id;

  @override
  State<Servicess> createState() => _ServicessState();
}

List<String> servicename = [
  //break, wheel
  'Oil change',
  'Filter change',
  'Wheel Alignment',
  'Brake Check',
  'Steering Alignment',
  'Glass Change'
];
List<int> serviceprice = [200, 250, 300, 150, 400, 1000];

List<int> serviceTime = [30, 30, 30, 30, 30, 30];
List<int> servicid = [];
List<bool> checkBoxes = [false, false, false, false, false, false];
int ttlprice = 0;
int ttltime = 0;

class _ServicessState extends State<Servicess> {
  List? serviceall = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    servicesall();
    updateSelectedServices();
  }

  @override
  void dispose() {
    // TODO: implement initState
    super.dispose();
    ttlprice = 0;
    ttltime = 0;
    for (int i = 0; i < checkBoxes.length; i++) {
      checkBoxes[i] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Container(
            height: size.height * 0.1,
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Total Price : ${ttlprice}",
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Total Time : ${ttltime}",
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ],
              ),
            ),
          ),
          Container(
            height: size.height * 0.8,
            color: Color.fromRGBO(255, 255, 255, 1),
            child: serviceall?.length == 0 ? loading() : allServices(),
          ),
          Container(
            height: size.height * 0.1,
            color: Colors.blue,
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await clearServices();
          await BookServices();
          await appstatus();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AvailableMechanic(
                        appNumber: widget.app_id,
                      )));
        },
        child: Text("OK"),
      ),
    );
  }

  clearServices() async {
    String url =
        "http://${ip}/workshopp/api/customer/clearService?apId=${widget.app_id}";
    var response = await http.get(Uri.parse(url));
  }

  BookServices() async {
    String url = 'http://${ip}/workshopp/api/customer/postServices';
    for (int i = 0; i < checkBoxes.length; i++) {
      print(checkBoxes[i]);
    }

    for (int i = 0; i < 6; i++) {
      String sid = servicid[i].toString();
      String apid = widget.app_id.toString();
      var data = {'serviceId': sid, 'appId': apid};
      print(data.toString());

      if (checkBoxes[i] == true) {
        var response = await http.post(Uri.parse(url), body: data);
        if (response.statusCode == 200) {
          print('data saved');
        }
      }
      setState(() {});
    }
  }

  appstatus() async {
    String url =
        "http://${ip}/workshopp/api/customer/appstatus?appId=${widget.app_id}";

    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print('updated.....................');
    }
    setState(() {});
  }

  servicesall() async {
    setState(() {});
    String url = "http://${ip}/workshopp/api/customer/services";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      serviceall = json.decode(response.body);
      setState(() {});
    } else {
      serviceall = [];
      print('error');
    }
    setState(() {});
  }

  updateSelectedServices() async {
    String url =
        "http://${ip}/workshopp/api/customer/checkSelectedService?apId=${widget.app_id}";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print(response.body);
      List list = json.decode(response.body);
      for (int i = 0; i < serviceall!.length; i++) {
        for (int j = 0; j < list.length; j++) {
          if (serviceall![i]['name'] == list[j]['name'].toString()) {
            print('Testing.....................2');
            checkBoxes[i] = true;
            ttltime = ttltime + 30;
            ttlprice = ttlprice + serviceprice[i];
          }
        }

        setState(() {});
      }
      setState(() {});
    } else {
      print('error');
    }
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

  allServices() {
    return ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          String servicenamee = serviceall![index]["name"];
          int id = serviceall![index]["id"];
          servicid.add(id);
          print(servicenamee);
          print("service id se$id");

          return Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Container(
              padding: EdgeInsets.only(bottom: 10),
              // height: size.height * 0.15,
              color: Colors.teal,
              child: Align(
                alignment: Alignment.centerLeft,
                child: ListTile(
                  trailing: Checkbox(
                    onChanged: (value) {
                      setState(() {
                        checkBoxes[index] = value!;
                        if (ttltime == 120) {
                          if (checkBoxes[index] == false) {
                            //listname[index]['column']
                            ttlprice = ttlprice - serviceprice[index];
                            ttltime = ttltime - serviceTime[index];
                            setState(() {});
                          } else {
                            checkBoxes[index] = false;
                            setState(() {});
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Maximum Time Reached")));
                          }
                        } else {
                          if (checkBoxes[index] == false) {
                            ttlprice = ttlprice - serviceprice[index];
                          }
                          if (checkBoxes[index] == true) {
                            ttlprice = ttlprice + serviceprice[index];
                          }
                          // totaltime add/ remove
                          if (checkBoxes[index] == false) {
                            ttltime = ttltime - serviceTime[index];
                          }
                          if (checkBoxes[index] == true) {
                            ttltime = ttltime + serviceTime[index];
                          }
                        }
                      });
                    },
                    value: checkBoxes[index],
                  ),
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.car_repair_outlined),
                  ),
                  title: Text(
                    // servicename[index],
                    servicenamee,
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Row(
                    children: [
                      Text("Price : ${serviceprice[index]}",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Time : ${serviceTime[index]}",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
