import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/ap.dart';
import 'package:flutter_application_2/pages/home.dart';
import 'package:flutter_application_2/pages/showvehicle.dart';
import 'package:http/http.dart' as https;
import 'package:shared_preferences/shared_preferences.dart';

class Vehicle extends StatefulWidget {
  @override
  State<Vehicle> createState() => _VehicleState();
}

class _VehicleState extends State<Vehicle> {





  final _formKey = GlobalKey<FormState>();
   String? number;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPhoneNumber();
  }
  @override
  Widget build(BuildContext context) {
    TextEditingController vnamecontroller = new TextEditingController();
    TextEditingController vnumbercontroller = new TextEditingController();
    TextEditingController vmodelcontroller = new TextEditingController();
    TextEditingController vcolorcontroller = new TextEditingController();
    return Stack(
      children: [
        // Background(),
        Scaffold(
            // backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text('-WORKSHOP-'),
              automaticallyImplyLeading: false,
            ),
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              reverse: true,
              child: Form(
                key: _formKey,
                // width: double.maxFinite,
                // height: double.maxFinite,
                // decoration: BoxDecoration(

                //     image: DecorationImage(

                //         image: AssetImage('img/t.png'),
                //         fit: BoxFit.fill,
                //         colorFilter: ColorFilter.mode(
                //             Colors.black.withOpacity(0.3), BlendMode.dstATop))),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 25, 10, 10),
                      alignment: Alignment.center,
                      child: Text(
                        'Add Vehicle',
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.blue[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(14),
                      child: TextFormField(
                        controller: vnamecontroller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: ('Enter Vehicle Name'),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Vehicle name Required';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(14),
                      child: TextFormField(
                        controller: vnumbercontroller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: ('Enter Vehicle Number'),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Vehicle number Required';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(14),
                      child: TextFormField(
                        controller: vmodelcontroller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: ('Enter Vehicle Model'),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Vehicle name Required';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(14),
                      child: TextFormField(
                        controller: vcolorcontroller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: ('Enter Vehicle Color'),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Vehicle name Required';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      height: 50,
                      padding: const EdgeInsets.all(14),
                      child: ElevatedButton(
                          onPressed: () async {
                            String address =
                                "http://192.168.137.1/workshopp/api/customer/addvehicle";
                            var data = {
                              "name": vnamecontroller.text,
                              "reg_no": vnumbercontroller.text,
                              "model": vmodelcontroller.text,
                              "color": vcolorcontroller.text,
                               "mobile_no":number,
                            };
                            var respons = await https.post(Uri.parse(address),
                                body: data);

                            if (respons.statusCode == 200) {
                              print("Data Saved");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => showVehicle()));
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Vehicle Info Saved")));

                              //print(respos.body);
                            } else {
                              print("Something Went Wrong");
                              //print(respos.body);
                            }
                            if (_formKey.currentState!.validate()) {
                              print(vnamecontroller.text);
                              print(vnumbercontroller.text);
                              print(vcolorcontroller.text);
                              print(vmodelcontroller.text);
                            }
                          },
                          child: const Text('Add Vehicle')),
                    ),
                  ],
                ),
              ),
            ))
      ],
    );
  }
  getPhoneNumber() async{
    SharedPreferences prefrence2 = await SharedPreferences.getInstance();
                  number= prefrence2.getString("phone");
                  print("Get Phone = ${number}");
  }
}
