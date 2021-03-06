import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/ap.dart';
import 'package:flutter_application_2/pages/appointment.dart';
import 'package:flutter_application_2/pages/bill.dart';
import 'package:flutter_application_2/pages/showvehicle.dart';
import 'package:flutter_application_2/pages/signup.dart';
import 'package:flutter_application_2/pages/vehicle.dart';
import 'package:flutter/src/widgets/icon.dart';
import 'package:flutter_application_2/yourappoint.dart';

class Home extends StatefulWidget {
  const Home({Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WORKSHOP'),
        automaticallyImplyLeading: false,
      ),
      body:  GridView.count(
              padding: const EdgeInsets.only(
                top: 17.0,
              ),
              crossAxisCount: 2,
              children: [
                GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Vehicle())),
                  child: Card(
                    color: Colors.transparent,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('img/1.png'),
                        ),
                      ),
                      // child: Text(
                      //   'a',
                      // ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (() => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const showVehicle()))),
                  child: Card(
                    color: Colors.transparent,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('img/2.png'),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const showVehicle()));
                  },
                  child: Card(
                    color: Colors.transparent,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage('img/3.png')),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const yourAppoint())),
                  child: Card(
                    color: Colors.transparent,
                    child: Container(
                      decoration: const BoxDecoration(
                          image:
                              DecorationImage(image: AssetImage('img/4.png'))),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const bill())),
                  child: Card(
                    color: Colors.transparent,
                    child: Container(
                      decoration: const BoxDecoration(
                          image:
                              DecorationImage(image: AssetImage('img/5.png'))),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const AP())),
                  child: Card(
                    color: Colors.transparent,
                    child: Container(
                      decoration: const BoxDecoration(
                          image:
                              DecorationImage(image: AssetImage('img/6.png'))),
                    ),
                  ),
                )
              ],
            ),
          );
        
      
    
  }
}
