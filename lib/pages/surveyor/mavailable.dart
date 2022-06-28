// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

class AvailableMechanic extends StatefulWidget {
  AvailableMechanic({Key? key, required this.appNumber}) : super(key: key);

  String appNumber;

  @override
  State<AvailableMechanic> createState() => _AvailableMechanicState();
}

class _AvailableMechanicState extends State<AvailableMechanic> {
  List mechanicList = [];
  @override
  void initState() {
    getvailableMechanic();
    super.initState();
  }

  getvailableMechanic() async {
    String url =
        "http://$ip/workshopp/api/customer/checkAvailability?appid=${widget.appNumber}";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      mechanicList = json.decode(response.body);
      print(mechanicList);
      setState(() {});
    } else {
      mechanicList = [];
      print('error');
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: mechanicList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Container(
                  height: 80,
                  color: Colors.teal,
                  child: ListTile(
                      leading: const Icon(Icons.person, color: Colors.white),
                      title: Text(
                        mechanicList[index]['name'],
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                      trailing: Container(
                        height: 35,
                        width: 70,
                        color: Colors.white,
                        child: TextButton(
                          onPressed: () async {
                            // ignore: avoid_print
                            print(mechanicList[index]);
                            String name=mechanicList[index]['name'];
                            int time=mechanicList[index]['Time'];
                             int bayno=mechanicList[index]['Bay_no'];
                            String url =
                                "http://${ip}/workshopp/api/customer/AssignMechanic?name=${name}&timeno=$time&apid=${widget.appNumber}&bayno=${bayno}";

                            var response = await http.get(
                              Uri.parse(url),
                            );
                            if (response.body == 200) {
                              print('OK.................');

                             
                            }
                           await  getvailableMechanic();
                              setState(() {});
                          },
                          child: const Text(
                            "Assign",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                color: Colors.black),
                          ),
                        ),
                      ))),
            );
          }),
    );
  }
}
