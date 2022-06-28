import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/admin/mechanic.dart';
import 'package:http/http.dart' as https;

import '../../main.dart';

class rMechanic extends StatefulWidget {
  const rMechanic({Key? key}) : super(key: key);

  @override
  State<rMechanic> createState() => _rMechanicState();
}

class _rMechanicState extends State<rMechanic> {
  TextEditingController phonecontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 151, 245, 154),
      appBar: AppBar(
        title: Text('Remove Mechanic'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 120.0,
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
            Container(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                controller: phonecontroller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'MECHANIC PHONE NUMBER'),
              ),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: ElevatedButton(
                  child: Text('Remove'),
                  onPressed: () async {
                    String mobilenumber = phonecontroller.text;
                    String address =
                        "http://${ip}/workshopp/api/customer/DeleteMechanic?mobile_no=$mobilenumber";
                    var response = await https.get(Uri.parse(address));
                    if (response.statusCode == 200) {
                      print("deleted");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => addMechanic()));
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Deleted succesfully")));

                      //print(respos.body);
                    } else {
                      print("Something Went Wrong");
                      //print(respos.body);
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
