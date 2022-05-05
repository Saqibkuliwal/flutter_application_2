import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/ap.dart';
import 'package:flutter_application_2/pages/welcome.dart';
import 'package:http/http.dart' as https;

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  TextEditingController phonecontroller = new TextEditingController();

  // var roleList = ["Select Role", "admin", "mechanic", "surveyor", "customer"];
  String roleSelected = "customer";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WORKSHOP'),
        automaticallyImplyLeading: false,
      ),
      resizeToAvoidBottomInset: false,
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('img/t.png'),
                      fit: BoxFit.fill,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.3), BlendMode.dstATop))),
              child: Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.fromLTRB(10, 30, 10, 15),
                      child: Text(
                        'SIGN UP',
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
                    child: TextField(
                      controller: emailcontroller,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: 'E-Mail'),
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
                  // Container(
                  //   height: 55,
                  //   width: double.maxFinite,
                  //   color: Colors.transparent,
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(left: 25),
                  //     child: DropdownButton(
                  //       value: roleSelected,
                  //       dropdownColor: Colors.grey[400],
                  //       items: roleList.map((String items) {
                  //         return DropdownMenuItem(
                  //             value: items,
                  //             child: Text(
                  //               items,
                  //               style: TextStyle(
                  //                   fontSize: 18, fontWeight: FontWeight.w600),
                  //             ));
                  //       }).toList(),
                  //       onChanged: (String? value) {
                  //         roleSelected = value!;
                  //         setState(() {});
                  //         print(roleSelected);
                  //       },
                  //     ),
                  //   ),
                  // ),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: ElevatedButton(
                      child: Text('SIGN UP'),
                      onPressed: () async {
                        String address =
                            "http://192.168.137.1/workshopp/api/customer/signup";
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
                              MaterialPageRoute(builder: (context) => AP()));
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
          }),
    );
  }
}
