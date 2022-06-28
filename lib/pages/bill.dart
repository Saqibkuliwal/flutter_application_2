// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/folderClipper.dart';
import 'package:http/http.dart' as http;

import '../main.dart';


class bill extends StatefulWidget {
  const bill({Key? key}) : super(key: key);

  @override
  State<bill> createState() => _billState();
}

class _billState extends State<bill> {
  List ? load = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadAll();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Bill Overview'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.car_rental))],
      ),
      body: ClipPath(
        clipper: folderClipper(),
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(top: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              _buildContent(context),
              _buildActionButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Expanded(
      child: ListView.builder(
      itemCount: load?.length,
      itemBuilder: (context, index) {
        String Vname = load![index]["vname"];
      return Container(
        height: 10,
        child: ListTile(
          title: Text(Vname),
        ),
      );
      //  Padding(
      //   padding: const EdgeInsets.all(5.0),
        
      //   child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      //     Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
              
      //         Text('Bill for', style: Theme.of(context).textTheme.bodyText2),
      //         Text(Vname,
      //             style: Theme.of(context).textTheme.headline6!.copyWith(
      //                   color: Colors.amber,
      //                 )),
      //       ],
      //     ),
      //     Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Text('Total Amount', style: Theme.of(context).textTheme.bodyText2),
      //         Text('1000',
      //             style: Theme.of(context).textTheme.headline6!.copyWith(
      //                   color: Colors.amber,
      //                 )),
      //       ],
      //     ),
      //   ]
      //   ),
      // );
      })
    );
  }

  Widget _buildActionButton(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
              child: Container(
                color: Colors.amberAccent,
                child: TextButton.icon(
                    onPressed: () {},
                    icon:const Icon(Icons.car_repair_sharp),
                    label:const  Text('Share Bill')),
              )),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context){
    return Expanded(
      child: Padding(padding:const EdgeInsets.all(4),
      
      child: Container(
        height:505,
        child: Column(
          
          children: [
             Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
             
                // ignore: prefer_const_constructors
                Text('Service Name',
                style:const TextStyle(fontSize: 18,
                fontWeight: FontWeight.bold,
                )),
              // ignore: prefer_const_constructors
              Text('Service Price',
                style:const TextStyle(fontSize: 18,
                fontWeight: FontWeight.bold,
                )),
              
            ],
          ),
          Container(
            child: Text('data'),
          )
          ],
          
        ),
      )
      ),
    );
  }

loadAll() async {
    setState(() {});
    String url = "http://${ip}/workshopp/api/customer/billApply?apid=5110";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      load = json.decode(response.body);
      
      setState(() {});
      
    } else {
      load = [];
      print('error');
    }
    setState(() {});
  }
}
