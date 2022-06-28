// ignore_for_file: prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../main.dart';


class bil extends StatefulWidget {
   bil({ Key? key,  required this.app_id }) : super(key: key);
  String? app_id;
  @override
  State<bil> createState() => _bilState();
}

class _bilState extends State<bil> {
   List ? load = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadAll();
    
  }


  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: null,
      //AppBar(automaticallyImplyLeading: false,
    //  backgroundColor: Colors.amberAccent,),
      body: 
        //serviceList == null ? loading() : showserv());
         SafeArea(
          child: ListView(
        children: [
          Container(
            height: size.height * 0.1,
            color: Color.fromARGB(255, 195, 187, 100),
            child: load == null ? loading() : appTodays()
             
            ),
            Container(
            height: size.height * 0.1,
            
            color: Color.fromARGB(255, 0, 0, 0),
            child: load == null ? loading() : bt()

          ),
          
          Container(
            
            height: size.height * 0.7,
            color: Color.fromARGB(255, 0, 0, 0),
            child: load == null ? loading() : srvce()
          ),
          
          Container(
            height: size.height * 0.1,
            
            color: Colors.blue,
          )
        ],
      )),
    );
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
      itemCount: load!.length,
      itemBuilder: (context, index) {
        String Vname = load![0]["vname"].toString();
        print(Vname);
         return Padding(
          padding: EdgeInsets.only(top: 6),
           // height: 10,
           // margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
           // color: Color.fromARGB(255, 78, 171, 246),
            child: Container(
              child: ListTile(
                  
                  title:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        
                        Column(
                          children: [
                           const Text('Bill For:',style: TextStyle(fontWeight: FontWeight.w600,),),
                            Text(Vname,),
                          ],
                        ),
                        Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                           const Text('Total Bill:',style: TextStyle(fontWeight: FontWeight.w600),),
                           const Text('1550.00'),
                          ],
                        ),

                        
                      ],
                    ),
                  
                   onTap: () async {
                    
                   }
                  ),
                  
            ));
      },
    );
  }

  loadAll() async {
     String apid = widget.app_id.toString();
    setState(() {});
    String url = "http://${ip}/workshopp/api/customer/billApply?apid=$apid";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      load = json.decode(response.body);
      print(load!.toList());
      print(widget.app_id);
      setState(() {});
      
    } else {
      load = [];
      print('error');
    }
    setState(() {});
  }

  srvce() {
    return 
    
     ListView.builder(
      itemCount:load?.length,
      itemBuilder: (context, index) {
        
        String Sname = load![index]["sname"].toString();
        String Sprice = load![index]["sprice"].toString();
        print(Sname);
        print(Sprice);
         return Container(
           // height: 300,
           // margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
           // color: Color.fromARGB(255, 78, 171, 246),
            child: 
                 ListTile(
                  
                  title:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(Sname,style:const TextStyle(color: Color.fromARGB(255, 195, 187, 100),),),
                            
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                           Text(Sprice+'.00',style:const TextStyle(color: Color.fromARGB(255, 195, 187, 100),),),
                          ],
                        ),

                        
                      ],
                    ),
                  
                   onTap: () async {
                    
                   }
                  ),
            );
      },
    );
    
  }

  bt() {
    return ListView.builder(
      itemCount: load?.length,
      itemBuilder: (context, index) {
                int slot = load![0]["stime"];
                int bay = load![0]["sbay"];


        print(slot.toString());
         return Padding(
          padding: EdgeInsets.only(top: 5),
           // height: 10,
           // margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
           // color: Color.fromARGB(255, 78, 171, 246),
            child: Container(
              child: ListTile(
                  
                  title:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        
                        Column(
                          children: [
                           const Text('TimeSlot:',style: TextStyle(fontWeight: FontWeight.w600,color: Color.fromARGB(255, 195, 187, 100),),),
                           const Text('Bay      :',style: TextStyle(fontWeight: FontWeight.w600,color: Color.fromARGB(255, 195, 187, 100),),),
                          ],
                        ),
                        Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                           Text(slot.toString(),style:const TextStyle(color: Color.fromARGB(255, 195, 187, 100),),),
                           Text(bay.toString(),style:const TextStyle(color: Color.fromARGB(255, 195, 187, 100),),),
                          ],
                        ),

                        
                      ],
                    ),
                  
                   onTap: () async {
                    
                   }
                  ),
            ));
      },
    );
  }
}