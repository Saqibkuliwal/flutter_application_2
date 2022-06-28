import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_2/pages/home.dart';
import 'package:flutter_application_2/pages/radio.dart';
import 'package:flutter_application_2/pages/radio2.dart';
import 'package:flutter_application_2/pages/service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class Appointment extends StatefulWidget {
  Appointment({Key? key, required this.regno}) : super(key: key);

  String regno;

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  DateTime date = DateTime.now();
  DateTime datee = DateTime.now();
  int countBay = 0;
  late String phoneNo;
  late int  Appointment_no ;

  //RAdioButton

  // Date: This shows a CupertinoModalPopup with a reasonable fixed height which hosts CupertinoDatePicker.
  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              // The Bottom margin is provided to align the popup above the system navigation bar.
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              // Provide a background color for the popup.
              color: CupertinoColors.systemBackground.resolveFrom(context),
              // Use a SafeArea widget to avoid system overlaps.
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }

  //initializing _value for radiobuttons
  int _value = 0;
  int _value2 = 0;
  // initializing visiblity feature
  bool _isVisible1 = true;
  bool _isVisible2 = false;

  showToast() {
    setState(() {
      _isVisible1 = !_isVisible1;
    });
  }

  showToast2() {
    setState(() {
      _isVisible2 = !_isVisible2;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPhonNo();
  }

  getPhonNo() async {
    SharedPreferences prefrence2 = await SharedPreferences.getInstance();
    phoneNo = prefrence2.getString("phonee")!;
    print("Get Phonee = ${phoneNo}");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointment'),
      ),
      body: Column(
        children: [
          Container(
              child: Container(
                  padding: EdgeInsets.all(30),
                  child: Text(
                    'Select Date',
                    style: TextStyle(
                      color: Color.fromARGB(255, 250, 57, 39),
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ))),
          Container(
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
                          const Text('Date'),
                          CupertinoButton(
                            // Display a CupertinoDatePicker in date picker mode.
                            child: Text(
                              '${datee.day}-${datee.month}-${datee.year}',
                              style: const TextStyle(
                                fontSize: 22.0,
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
          ElevatedButton(
              onPressed: () async {
                DateTime? newDate = await showDatePicker(
                    context: context,
                    initialDate: datee,
                    firstDate: datee,
                    lastDate: DateTime(2023));
                if (newDate == null) return;
                setState(() => datee = newDate);
              },
              child: Text('Select Date')),
          Container(
              child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Select Time Slot',
                    style: TextStyle(
                      color: Color.fromARGB(255, 250, 57, 39),
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ))),
          Row(
            children: [
              Expanded(
                child: Container(
                  width: 30,
                  child: Column(
                    children: [
                      MyRadioListTile<int>(
                          value: 1,
                          groupValue: _value,
                          leading: 'S-1',
                          // title: Text('One'),
                          onChanged: (value) {
                            checkBay(1);
                            //  setState(() { _value = value;)}
                            setState(() {
                              _value = value!;
                              print(_value);
                            });
                          }),
                      Center(
                        child: Text('09-11am'),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                    child: Column(
                  children: [
                    MyRadioListTile<int>(
                        value: 2,
                        groupValue: _value,
                        leading: 'S-2',
                        // title: Text('Two'),
                        onChanged: (value) {
                          checkBay(2);
                          //  setState(() { _value = value;)}
                          setState(() {
                            _value = value!;
                            print(_value);
                          });
                        }),
                    Center(
                      child: Text('11-1pm'),
                    )
                  ],
                )),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      MyRadioListTile<int>(
                          value: 3,
                          groupValue: _value,
                          leading: 'S-3',
                          // title: Text('Three'),
                          onChanged: (value) {
                            checkBay(3);
                            //  setState(() { _value = value;)}
                            setState(() {
                              _value = value!;
                              print(_value);
                            });
                          }),
                      Center(
                        child: Text('1-3pm'),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MyRadioListTile<int>(
                        value: 4,
                        groupValue: _value,
                        leading: 'S-4',
                        // title: Text('Three'),
                        onChanged: (value) {
                          checkBay(4);
                          //  setState(() { _value = value;)}
                          setState(() {
                            _value = value!;
                            print(_value);
                          });
                        }),
                    Center(child: Text('3-5pm'))
                  ],
                )),
              )
            ],
          ),
          // Center(
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Expanded(
          //             child: Container(
          //           color: countBay == 0 ? Colors.blue : Colors.grey,
          //           child: Center(
          //               child: Text(
          //             "B-1",
          //             style: TextStyle(color: Colors.white),
          //           )),
          //         )),
          //         Expanded(
          //             child: Container(
          //           color: countBay == 1 ? Colors.blue : Colors.grey,
          //           child: Center(
          //               child: Text(
          //             "B-2",
          //             style: TextStyle(color: Colors.white),
          //           )),
          //         )),
          //         Expanded(
          //             child: Container(
          //           color: countBay == 2 ? Colors.blue : Colors.grey,
          //           child: Center(
          //               child: Text(
          //             "B-3",
          //             style: TextStyle(color: Colors.white),
          //           )),
          //         ))
          //       ],
          //     ),
          //   ),
          // ),
          Container(
            height: 80,
            width: double.maxFinite,
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: ElevatedButton(
              child: Text('Book'),
              onPressed: ()async {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => Services(app_id: Appointment_no,)));
                print(datee);
                // print(_value2);
                print(_value);
               // print("apono" + Appointment_no.toString());
               await BookAppoitment();
                await proceed();
              },
            ),
          ),
          // Container(
          //   height: 80,
          //   width: double.maxFinite,
          //   padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
          //   child: ElevatedButton(
          //     child: Text('proceed'),
          //     onPressed: () async {
          //       String url = 'http://${ip}/workshopp/api/customer/apid';
          //       var response = await http.get(Uri.parse(url));
          //       if (response.statusCode == 200) {
          //         print(response.body);
          //         Appointment_no = int.parse(response.body);
          //         setState(() {});
          //         Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //                 builder: (context) => Services(
          //                       app_id: Appointment_no,
          //                     )));
          //         print(Appointment_no);
          //       }
          //        else {
          //         print(response.body);
          //       }
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }

  checkBay(int slot) async {
    String date = '${datee.day}-${datee.month}-${datee.year}';
    print(date);
    String url =
        'http://${ip}/workshopp/api/customer/selectBay?date=${date}&slot=${slot}';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print(response.body);
      countBay = int.parse(response.body);
      setState(() {});
    } else {
      print(response.body);
    }
  }

  BookAppoitment() async {
    String date = '${datee.day}-${datee.month}-${datee.year}';
    print(date);

    String url = 'http://${ip}/workshopp/api/customer/bookoppointment';
    var data = {
      'mobile_no': phoneNo,
      'reg_no': widget.regno.toString(),
      'Date': date.toString(),
      'Time': _value.toString(),
      'Bay_no': (countBay + 1).toString(),
    };

    print(data.toString());
    var response = await http.post(Uri.parse(url), body: data);

    if (response.statusCode == 200) {
      // Appointment_no = json.decode(response.body);
      // setState(() {

      // });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("saved")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(response.body)));
      print(response.body);
    }
  }
  proceed() async{
    String url = 'http://${ip}/workshopp/api/customer/apid';
                var response = await http.get(Uri.parse(url));
                if (response.statusCode == 200) {
                  print(response.body);
                  Appointment_no = int.parse(response.body);
                  setState(() {});
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Services(
                                app_id: Appointment_no,
                              )));
                  print(Appointment_no);
                }
                 else {
                  print(response.body);
                }
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      ),
    );
  }
}
