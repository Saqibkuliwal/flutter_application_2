// ignore_for_file: empty_statements, avoid_unnecessary_containers, unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/admin/adminScreen.dart';
import 'package:flutter_application_2/pages/admin/bottom.dart';
import 'package:flutter_application_2/pages/home.dart';
import 'package:flutter_application_2/pages/mechanic/panel.dart';
import 'package:flutter_application_2/pages/signup.dart';
import 'package:flutter_application_2/pages/surveyor/surveyorPanel.dart';
import 'package:flutter_application_2/pages/vehicle.dart';
import 'package:http/http.dart' as https;
import 'package:convert/convert.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import 'hme.dart';

class AP extends StatefulWidget {
  const AP({Key? key}) : super(key: key);

  @override
  State<AP> createState() => _APState();
}

class _APState extends State<AP> {
//     Future<String> _givenumber() async{
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('mobile',phonecontroller.text );
//     return phonecontroller.text;
//   }
//     final prefs = await SharedPreferences.getInstance();
//     final String? mobile = prefs.getString(_givenumber);
  // }

  final _formKey = GlobalKey<FormState>();
  TextEditingController passwordcontroller = new TextEditingController();
  TextEditingController phonecontroller = new TextEditingController();
  List? resultList;

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    return new WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            title: Text('WORKSHOP'),
            automaticallyImplyLeading: false,
          ),
          resizeToAvoidBottomInset: false,
          body:  Form(
                    key: _formKey,
                    child: Column(children: <Widget>[
                      Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.fromLTRB(10, 50, 10, 15),
                          child: Text(
                            '-SIGN IN-',
                            style: TextStyle(
                              color: Colors.blue[900],
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                      Container(
                        padding: const EdgeInsets.all(15),
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: phonecontroller,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'PHONE NUMBER'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '*Phone Number Required';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        child: TextFormField(
                          obscureText: true,
                          controller: passwordcontroller,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'PASSWORD',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '*Password Required';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        height: 50,
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: ElevatedButton(
                          child: Text('LOGIN'),
                          onPressed: () async {
                            SharedPreferences prefrence2 =
                                await SharedPreferences.getInstance();
                            var number = phonecontroller.text;
                            prefrence2.setString("phone", phonecontroller.text);

                            SharedPreferences prefrence3 =
                                await SharedPreferences.getInstance();
                            var numberr = phonecontroller.text;
                            prefrence3.setString("phonee", phonecontroller.text);

                            String mobilenumber = phonecontroller.text;
                            String password = passwordcontroller.text;

                            String address =
                                "http://${ip}/workshopp/api/customer/signin?mobile_no=$mobilenumber&password=$password";
                            var response = await https.get(Uri.parse(address));
                            if (response.statusCode == 200) {
                              resultList = json.decode(response.body);
                              setState(() {});
                              if (resultList?.length == 0) {
                                print("Number or Password are Wrong");
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text("Enter Correct Information")));
                              }
                              if (resultList?.length == 1) {
                                String? role =
                                    resultList?[0]["role"].toString();
                                print("$role");
                                if (role?.toLowerCase() == "admin") {
                                  print("admin");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => bottom()));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text("Login Succeed")));
                                }
                                if (role?.toLowerCase() == "mechanic") {
                                  print("mechanic");
                                 
                                  String name=resultList![0]['name'];
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>mechPanel(userName: name,)));
                                }
                                if (role?.toLowerCase() == "surveyor") {
                                  print("surveyor");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              surveyorPanel()));
                                  // ignore: prefer_const_constructors
                                }

                                if (role?.toLowerCase() == "customer") {
                                  print("customer");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Hme()));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const  SnackBar(content: Text("Login Succeed")));

                                  // ignore: prefer_const_constructors
                                }

                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>ReaderScreen()));
                              }
                            } else {
                              print("Something went Wrong");
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text("Enter correct Information")));
                            }
                            if (_formKey.currentState!.validate()) {
                              print(phonecontroller.text);
                              print(passwordcontroller.text);
                            }
                            ;
                          },
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.fromLTRB(40, 13, 40, 0),
                        child: Text(
                          'Not Registered?',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        //padding: const EdgeInsets.all(1),
                        child: TextButton(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.blue[900],
                                fontSize: 24,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Signup()));
                            }),
                      ),
                    ]),
                  ),
                
              ),
        );
  }
}
