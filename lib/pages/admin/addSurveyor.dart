import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/admin/surveyor.dart';
import 'package:http/http.dart' as https;

import '../../main.dart';


class aSurveyor extends StatefulWidget {
  const aSurveyor({ Key? key }) : super(key: key);

  @override
  State<aSurveyor> createState() => _aSurveyorState();
}

class _aSurveyorState extends State<aSurveyor> {
final _formKey = GlobalKey<FormState>();
TextEditingController namecontroller = new TextEditingController();
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  TextEditingController phonecontroller = new TextEditingController();
  String roleSelected = "surveyor";

  String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
     if (value == null || value.isEmpty || !regex.hasMatch(value))
      return 'Enter a valid email address';
    else
      return null;
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 160, 240, 163),
      appBar: AppBar(
        title: Text('Add Surveyor'),
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
      ),
      resizeToAvoidBottomInset: false,
      body: Form(
        autovalidateMode: AutovalidateMode.always,
                key: _formKey,
                child: Column(children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.fromLTRB(10, 30, 10, 15),
                      child: Text(
                        'Add Information',
                        style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                  Container(
                    padding: const EdgeInsets.all(13),
                    child: TextFormField(
                      controller: namecontroller,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '*Name Required';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: TextFormField(
                      controller: emailcontroller,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: 'E-Mail'),
                          validator: (value) => validateEmail(value)
                         
                        
                        
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: TextFormField(
                      controller: phonecontroller,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'PHONE NUMBER'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '*Phone Number Required';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: TextFormField(
                      controller: passwordcontroller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'PASSWORD',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '*Password Required';
                        }
                        return null;
                      },
                    ),
                  ),
                 
                  Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: ElevatedButton(
                      child: Text('Add'),
                      onPressed: () async {
                        String address =
                            "http://${ip}/workshopp/api/customer/signup";
                        var data = {
                          "name": namecontroller.text,
                          "mobile_no": phonecontroller.text,
                          "email": emailcontroller.text,
                          "password": passwordcontroller.text,
                          "role": roleSelected,
                        };
                        var respons =
                            await https.post(Uri.parse(address), body: data);

                        if (respons.statusCode == 200) {
                          print("Data Saved");
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => addSurveyor()));
                          //print(respos.body);
                        } else {
                          print("Something Went Wrong");
                          //print(respos.body);
                        }

                        if (_formKey.currentState!.validate()) {}
                        ;
                      },
                    ),
                  ),
                ]),
              ),
         
         
    );
  }
}