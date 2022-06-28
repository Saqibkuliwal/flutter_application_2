// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';

class yourAppoint extends StatefulWidget {
  const yourAppoint({Key? key}) : super(key: key);

  @override
  State<yourAppoint> createState() => _yourAppointState();
}

class _yourAppointState extends State<yourAppoint> {
  List? show = null;
  String? number;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllappoint();
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Appointments'),
          automaticallyImplyLeading: false,
          centerTitle: true,
          leading: IconButton(
          icon: new Icon(Icons.car_repair), onPressed: () {  },
        ),),
        body: show == null ? loading() : showAppointments());
  }

  getAllappoint() async {
    SharedPreferences prefrence2 = await SharedPreferences.getInstance();
    number = prefrence2.getString("phone");
    print("Get Phone = ${number}");
    String url =
        "http://${ip}/workshopp/api/customer/showappointment?mobile_no=$number";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      show = json.decode(response.body);
      print('Loading ${number}');
      print(show);
    } else {
      show = null;
      print('error');
    }
    setState(() {});
  }

  loading() {
    return Container(
        // ignore: 
        child: Center(
      child: SpinKitCubeGrid(
        color: Color(0xFF0f65b3),
        size: 80.0,
      ),
    ));
  }

  showAppointments() {
    return ListView.builder(
      itemCount: show?.length,
      itemBuilder: (context, index) {
        String regno = show![index]["reg_no"];
        int slot = show![index]["Time"];
      //  Null bayy = show![index]["Bay_no"];
        
        
        return Container(
            height: 150,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            color: Color.fromARGB(255, 78, 171, 246),
            child: Center(
              child: ListTile(
                  leading: SizedBox(
                    child: Column(
                     
                      children:[
                        Text("Registration Number",style: TextStyle(color: Colors.white,)),
                        Text(
                    regno,
                    style: TextStyle(
                        fontSize: 27,
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold),
                  ),
                      ]
                    ),
                  ),
                  title: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Selected Slot',style: TextStyle(color: Colors.white,),),
                        Text(slot.toString(),
                            style: TextStyle(
                                fontSize: 26, color: Colors.redAccent)),
                        // Text('Assigned Bay',style: TextStyle(color: Colors.white,)),
                        // Text(bayy.toString(),
                        //     style: TextStyle(
                        //         fontSize: 26, color: Colors.redAccent)),
                        Text('Date:',style: TextStyle(color: Colors.white,)),
                        Text(show![index]["Date"],
                            style: TextStyle(
                                fontSize: 26, color: Colors.redAccent)),
                        
                      ],
                    ),
                  ),
                  // onTap: () async {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => Appointment(
                  //                 regno: regno,
                  //               )));
                  //   SharedPreferences prefrence2 =
                  //       await SharedPreferences.getInstance();
                  //   var iindex = index.toString();
                  //   prefrence2.setString("phone", iindex);
                  //   print(iindex);
                  // }
                  ),
            ));
      },
    );
  }
}
