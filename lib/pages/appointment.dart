import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_2/pages/home.dart';
import 'package:flutter_application_2/pages/radio.dart';
import 'package:flutter_application_2/pages/radio2.dart';
import 'package:flutter_application_2/pages/service.dart';

class Appointment extends StatefulWidget {
  const Appointment({Key? key}) : super(key: key);

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  DateTime date = DateTime.now();
DateTime datee = DateTime.now();
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
  // int _value2 = 0;
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
                            onPressed: (){},

                            
                          ),
                        ],
                      ),
                      // ElevatedButton(
                      //       onPressed: () {
                      //         _showDialog(
                      //           CupertinoDatePicker(
                      //             initialDateTime: date,
                      //             mode: CupertinoDatePickerMode.date,
                      //             use24hFormat: true,
                      //             // This is called when the user changes the date.
                      //             onDateTimeChanged: (DateTime newDate) {
                      //               setState(() => date = newDate);
                      //             },
                      //           ),
                      //         );
                      //         // showToast2();
                      //       },
                      //       child:Text('Select Date')
                            
                      //     ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Text(
            
          //   '${datee.year}/${datee.month}/${datee.day}',
          //   style: TextStyle(fontSize: 32),
          // ),const SizedBox(height: 16,),
          ElevatedButton(onPressed: () async{
            DateTime? newDate = await
            showDatePicker(context: context, initialDate: datee, firstDate: DateTime(2022), lastDate: DateTime(2023));
          if (newDate ==null)return;
          setState(() =>datee = newDate);
          }, child: Text('Select Date')),
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
          // Visibility(
          //   visible: _isVisible2,
            // child:
             Row(
               mainAxisSize: MainAxisSize.min,
               children: [
                 Container(
                   child: Column(
                     children: [
                       MyRadioListTile<int>(
                         value: 1,
                         groupValue: _value,
                         leading: 'S-1',
                         // title: Text('One'),
                         onChanged: (value) => setState(() => _value = value!),
                       ),
                       Center(
                         child: Text('09-11am'),
                       )
                     ],
                   ),
                 ),
                 Container(
                     child: Column(
                   children: [
                     MyRadioListTile<int>(
                       value: 2,
                       groupValue: _value,
                       leading: 'S-2',
                       // title: Text('Two'),
                       onChanged: (value) => setState(() => _value = value!),
                     ),
                     Center(
                       child: Text('11-1pm'),
                     )
                   ],
                 )),
                 Container(
                   child: Column(
                     children: [
                       MyRadioListTile<int>(
                         value: 3,
                         groupValue: _value,
                         leading: 'S-3',
                         // title: Text('Three'),
                         onChanged: (value) => setState(() => _value = value!),
                       ),
                       Center(
                         child: Text('1-3pm'),
                       )
                     ],
                   ),
                 ),
                 Container(
                     child: Column(
                       mainAxisSize: MainAxisSize.min,
                   children: [
                     MyRadioListTile<int>(
                       value: 4,
                       groupValue: _value,
                       leading: 'S-4',
                       // title: Text('Three'),
                       onChanged: (value) => setState(() => _value = value!),
                     ),
                     Center(child: Text('3-5pm'))
                   ],
                 ))
               ],
             ),
            
            
          // ),
          // Container(
          //     padding: EdgeInsets.all(10),
          //     child: Text(
          //       'Select A Bay',
          //       style: TextStyle(
          //         color: Color.fromARGB(255, 250, 57, 39),
          //         fontSize: 25,
          //         fontWeight: FontWeight.w500,
          //       ),
          //     )),
          // Visibility(
          //   visible: _isVisible1,
            //  Center(
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       MyRadioListTile2<int>(
            //         value: 1,
            //         groupValue: _value2,
            //         leading: 'B-1',
            //         // title: Text('Three'),
            //         onChanged: (value) => setState(() => _value2 = value!),
            //       ),
            //       MyRadioListTile2<int>(
            //         value: 2,
            //         groupValue: _value2,
            //         leading: 'B-2',
            //         // title: Text('Three'),
            //         onChanged: (value) => setState(() => _value2 = value!),
            //       ),
            //       MyRadioListTile2<int>(
            //         value: 3,
            //         groupValue: _value2,
            //         leading: 'B-3',
            //         // title: Text('Three'),
            //         onChanged: (value) => setState(() => _value2 = value!),
            //       ),
            //     ],
            //   ),
            // ),
            // Center(
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       MyRadioListTile2<int>(
            //         value: 4,
            //         groupValue: _value2,
            //         leading: 'B-4',
            //         // title: Text('Three'),
            //         onChanged: (value) => setState(() => _value2 = value!),
            //       ),
            //       MyRadioListTile2<int>(
            //         value: 5,
            //         groupValue: _value2,
            //         leading: 'B-5',
            //         // title: Text('Three'),
            //         onChanged: (value) => setState(() => _value2 = value!),
            //       ),
            //       MyRadioListTile2<int>(
            //         value: 6,
            //         groupValue: _value2,
            //         leading: 'B-6',
            //         // title: Text('Three'),
            //         onChanged: (value) => setState(() => _value2 = value!),
            //       ),
            //     ],
            //   ),
            // ),
          
          
          Container(
            height: 80,
            width: double.maxFinite,
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: ElevatedButton(
              child: Text('Book'),
              onPressed: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => Services()));
                    print(datee);
                    // print(_value2);
                    print(_value);
              },
            ),
          ),
        ],
      ),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      ),
    );
  }
}
