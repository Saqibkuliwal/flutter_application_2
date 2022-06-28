import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/appointment.dart';
import 'package:flutter_application_2/pages/deletevehicle.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import 'vehicle.dart';

class showVehicle extends StatefulWidget {
  const showVehicle({Key? key}) : super(key: key);

  @override
  State<showVehicle> createState() => _showVehicleState();
}

class _showVehicleState extends State<showVehicle> {
  List? vehicleList = null;
  String? number;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllVehicle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text('Vehicles'),
              // ignore: prefer_const_constructors
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const dVehicle()));
                },
                child: Icon(
                  Icons.remove,
                ),
              ),
            ],
          ),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Vehicle()));
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: vehicleList == null ? loading() : allVehicles());
  }

  getAllVehicle() async {
    SharedPreferences prefrence2 = await SharedPreferences.getInstance();
    number = prefrence2.getString("phone");
    print("Get Phone = ${number}");
    String url =
        "http://${ip}/workshopp/api/customer/allVehicles?mobile_no=$number";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      vehicleList = json.decode(response.body);
      print('Loading ${number}');
    } else {
      vehicleList = null;
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

  allVehicles() {
    return ListView.builder(
      itemCount: vehicleList?.length,
      itemBuilder: (context, index) {
        String regno = vehicleList![index]["reg_no"];
        return Container(
            height: 150,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            color: Color.fromARGB(255, 78, 171, 246),
            child: Center(
              child: ListTile(
                  leading: Text(
                    vehicleList![index]["name"],
                    style: TextStyle(
                        fontSize: 27,
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold),
                  ),
                  title: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Registration Number'),
                        Text(regno,
                            style: TextStyle(
                                fontSize: 26, color: Colors.redAccent)),
                        Text('Vehicle Color'),
                        Text(vehicleList![index]["color"],
                            style: TextStyle(
                                fontSize: 26, color: Colors.redAccent)),
                      ],
                    ),
                  ),
                  onTap: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Appointment(
                                  regno: regno,
                                )));
                    SharedPreferences prefrence2 =
                        await SharedPreferences.getInstance();
                    var iindex = index.toString();
                    prefrence2.setString("phone", iindex);
                    print(iindex);
                  }),
            ));
      },
    );
  }
}
