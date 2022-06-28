// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/surveyor/servicecheck.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';


class Request extends StatefulWidget {
  const Request({ Key? key }) : super(key: key);

  @override
  State<Request> createState() => _RequestState();
}

class _RequestState extends State<Request> {
    DateTime datee = DateTime.now();
      List? appList = null;
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApp();
    
  }


  @override
  Widget build(BuildContext context) {
        Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: Text('Today Appointments'),
      centerTitle: true,
      automaticallyImplyLeading: false,),
    body: SafeArea(
     child: ListView(
        children: [
         Container(
           height: size.height * 0.1,
            child: CupertinoPageScaffold(
              child: DefaultTextStyle(
                style: TextStyle(
                  color: CupertinoColors.label.resolveFrom(context),
                  fontSize: 22.0,
                ),
                child: Container(
                  child: Column(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _DatePickerItem(
                        children: <Widget>[
                          
                          CupertinoButton(
                            // Display a CupertinoDatePicker in date picker mode.
                            child: Text(
                              '${datee.day}-${datee.month}-${datee.year}',
                              style: const TextStyle(
                                fontSize: 22.0,
                                color: Colors.black38,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: size.height * 0.9,
            color: Color.fromRGBO(255, 255, 255, 1),
            child: appList == null ? loading() : appTodays(),
          ),
         
      ],
    )
     ),
    
    );
  }
  getApp() async {
    String date = '${datee.day}-${datee.month}-${datee.year}';
    print(date);
    String url =
        "http://${ip}/workshopp/api/customer/appToday?datee=${date}";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      appList = json.decode(response.body);
    } else {
      appList = null;
      print('error 200');
    }
    setState(() {});
  }

    loading() {
    return Container(
        child: Center(
      child: SpinKitDualRing(
        color: Color(0xFF0f65b3),
        size: 80.0,
      ),
    ));
  }
  appTodays() {
    return ListView.builder(
      itemCount: appList?.length,
      itemBuilder: (context, index) {
        String regno = appList![index]["reg_no"];
        int slot = appList![index]["Time"];
        String ap_no=appList![index]["Appoitment_no"].toString();
        
        
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
                        
                      ],
                    ),
                  ),
                   onTap: () async {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Servicess(app_id: ap_no.toString(),)));
                   SharedPreferences prefrence2 =
                                await SharedPreferences.getInstance();
                            var Timeslt = slot;
                            prefrence2.setString("Time", slot.toString());
                   }
                  ),
            ));
      },
    );
  }

}
















// This class simply decorates a row of widgets for datetime Thanks.
class _DatePickerItem extends StatelessWidget {
  const _DatePickerItem({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
          bottom: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }
}
