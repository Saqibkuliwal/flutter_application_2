import 'package:flutter/material.dart';

import '../ap.dart';

class surveyorPanel extends StatefulWidget {
  const surveyorPanel({Key? key}) : super(key: key);

  @override
  State<surveyorPanel> createState() => _surveyorPanelState();
}

class _surveyorPanelState extends State<surveyorPanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 74, 125, 101),
      appBar: AppBar(
        title: Text('DashBoard', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
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
                    image: AssetImage('img/survey.png'),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              GestureDetector(
                onTap: () {},
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
                                  Colors.yellow,
                                  Colors.green,
                                ]),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Text(""),
                              const Text(
                                "Assignment Requests",
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
