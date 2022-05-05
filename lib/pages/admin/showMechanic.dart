import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;


class showMechanics extends StatefulWidget {
  const showMechanics({ Key? key }) : super(key: key);

  @override
  State<showMechanics> createState() => _showMechanicsState();
}

class _showMechanicsState extends State<showMechanics> {
    List? surveyorList = null;
    


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllMechanic();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mechanics')),
      body: surveyorList==null?
      loading():allMechanic()
    );
  }
  getAllMechanic() async{
      String url="http://192.168.18.93/workshopp/api/customer/mechanics";
      var response= await http.get(Uri.parse(url));
      if(response.statusCode==200){
        surveyorList=json.decode(response.body);
      }
      else{
         surveyorList = null;
         print('error');
      }
      setState(() {      });
}
loading(){
  return Container(
    child: Center(
      child:SpinKitCircle(
        color: Color(0xFF0f65b3),
        size: 80.0,
      ),
    )
  );
}
allMechanic(){
  return ListView.builder(
    itemCount: surveyorList?.length,
    itemBuilder: (context,index){
      return Container(
        height: 150,
        margin: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
        color: Color.fromARGB(255, 78, 171, 246),
        child: Center(
          child: ListTile(
            leading:Text(surveyorList![index]["mobile_no"],style: TextStyle(fontSize: 27,
            color:Colors.yellow,fontWeight:FontWeight.bold),),
            title: Center(
              
              child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Text('Name'),
                Text(surveyorList![index]["name"],style: TextStyle(fontSize: 26,
            color:Colors.redAccent)),
             Text('Password'),
                Text(surveyorList![index]["password"],style: TextStyle(fontSize: 26,
            color:Colors.redAccent)),
            
              ],
            ),
          ),
        ),
      ));
    },
  );
  }
}