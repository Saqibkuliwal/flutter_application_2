import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/mechanic/service_request_view.dart';
import 'package:flutter_application_2/pages/surveyor/request.dart';

import '../ap.dart';

class mechPanel extends StatefulWidget {
 mechPanel({Key? key , required this.userName}) : super(key: key);

  String userName;
  @override
  State<mechPanel> createState() => _mechPanelState();
}

class _mechPanelState extends State<mechPanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(194, 163, 43, 243),
      appBar: AppBar(
        title: Text(widget.userName, style: TextStyle(color: Colors.white)),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 137, 112, 237),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 30),
        child: Center(
          child: Column(
            children: [
              Container(
                height: 140.0,
                width: 120.0,
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('img/mechanic.png'),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>ServiceRequestView(name: widget.userName)));
                  print(widget.userName);},
                child: Container(
                  padding: EdgeInsets.only(top: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 1 / 10,
                          width: MediaQuery.of(context).size.width * 3 / 5,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color.fromARGB(255, 34, 14, 104),
                                  Color.fromARGB(255, 141, 208, 241),
                                ]),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Text(""),
                              const Text(
                                "TO DO",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromARGB(255, 255, 255, 255)),
                                  child: const Icon(
                                    Icons.arrow_right_alt_outlined,
                                    size: 25.0,
                                    color: Colors.green,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> AP()));},
                child: Container(
                  padding: EdgeInsets.only(top: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 1 / 10,
                          width: MediaQuery.of(context).size.width * 3 / 5,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  
                                  Colors.blue,
                                  Colors.yellow,
                                ]),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Text(""),
                              const Text(
                                "          Log Out          ",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                  child: const Icon(
                                    Icons.arrow_right_alt_outlined,
                                    size: 25.0,
                                    color: Colors.green,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
