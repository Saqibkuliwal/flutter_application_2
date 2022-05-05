// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, duplicate_ignore

import 'package:flutter/material.dart';

class Services extends StatefulWidget {
  const Services({Key? key}) : super(key: key);

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Services'),
      ),
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Column(
              children: [
                //Container 1
                Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.fromLTRB(10, 17, 10, 10),
                        child: Text(
                          '-Mechanical-',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                              background: Paint()
                                ..color = Color.fromARGB(255, 77, 172, 250)
                                ..strokeJoin = StrokeJoin.round
                                ..strokeCap = StrokeCap.round
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 30.0),
                        ),
                      ),
                      Column(
                        children: [
                          Padding(padding: EdgeInsets.all(10)),
                          Container(
                            padding: EdgeInsets.all(8),
                            color: Color.fromARGB(255, 77, 172, 250),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.only(
                                      left: 15,
                                    ),
                                    child: Text(
                                      'Name',
                                      style:TextStyle(color: Colors.white,)
                                    )),
                                Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.only(
                                      left: 70,
                                    ),
                                    child: Text(
                                      'Price',
                                      style:TextStyle(color: Colors.white,)
                                    )),
                                Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.only(
                                      left: 70,
                                    ),
                                    child: Text(
                                      'Time',
                                      style:TextStyle(color: Colors.white,)
                                    ))
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  child: Text(
                                'Mechanical',
                              )),
                              Container(
                                  child: Text(
                                '-Mechanical-2',
                              ))
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //Container 2
                Container(
                  padding: EdgeInsets.fromLTRB(10, 12, 10, 10),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(8),
                        child: Text(
                          '-Electrical-',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              // backgroundColor: Colors.blueAccent[100],
                              color: Colors.white,
                              background: Paint()
                                ..color = Color.fromARGB(255, 77, 172, 250)
                                ..strokeJoin = StrokeJoin.round
                                ..strokeCap = StrokeCap.round
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 30.0),
                        ),
                      ),
                      Column(
                        children: [
                          Padding(padding: EdgeInsets.all(10)),
                          Container(
                            padding: EdgeInsets.all(8),
                            color: Color.fromARGB(255, 77, 172, 250),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // ignore: duplicate_ignore, duplicate_ignore
                                Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.only(
                                      left: 15,
                                    ),
                                    // ignore: prefer_const_constructors
                                    child: Text(
                                      'Name',
                                     style:TextStyle(color: Colors.white,)
                                    )),
                                Container(
                                    alignment: Alignment.center,
                                   padding: const EdgeInsets.only(
                                      left: 70,
                                    ),
                                    child: Text(
                                      'Price',
                                      style:TextStyle(color: Colors.white,)
                                    )),
                                Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.only(
                                      left: 70,
                                    ),
                                    child: Text(
                                      'Time',
                                      style:TextStyle(color: Colors.white,)
                                    ))
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            
                            children: [
                              Container(
                                  child: Text(
                                '-Electrical-',
                              )),
                              Container(
                                  child: Text(
                                '-Electrical-2',
                              ))
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
