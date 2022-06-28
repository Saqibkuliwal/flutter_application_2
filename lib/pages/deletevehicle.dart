import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/showvehicle.dart';
import 'package:http/http.dart' as https;
import 'package:convert/convert.dart';

import '../main.dart';

class dVehicle extends StatefulWidget {
  const dVehicle({ Key? key }) : super(key: key);

  @override
  State<dVehicle> createState() => _dVehicleState();
}

class _dVehicleState extends State<dVehicle> {
  @override
  Widget build(BuildContext context) {
    TextEditingController vnumbercontroller = new TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Remove Vehicle'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),

      body: Column(
        children: [
          Container(
                      padding: const EdgeInsets.all(14),
                      child: TextFormField(
                        controller: vnumbercontroller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: ('Enter Vehicle Number'),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Vehicle number Required';
                          }
                          return null;
                        },
                      ),
                    ),

          Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: ElevatedButton(
                  child: Text('Remove'),
                  onPressed: () async {
                 String regno= vnumbercontroller.text;
                 print(regno);
                    String address =
                        "http://${ip}/workshopp/api/customer/Deletevehicle?regno=$regno";
                    var response = await https.get(Uri.parse(address));
                    if (response.statusCode == 200) {
                      print("deleted");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => showVehicle()));
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Deleted succesfully")));

                      //print(respos.body);
                    } else {
                      print("Something Went Wrong");
                      //print(respos.body);
                    }
                  }),
          )
        ],
      )
    );
  }
}