import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class DateUtils {
  static String getTimeDifference(String startTime, String endTime){
    /// Set the format that of the Date/Time that like to parse
    /// h - 12h in am/pm
    /// m - minute in hour
    /// a - am/pm marker
    /// See more format here: https://pub.dev/documentation/intl/latest/intl/DateFormat-class.html
    var dateFormat =  DateFormat('h:ma');
    DateTime durationStart =  dateFormat.parse(startTime);
    DateTime durationEnd =  dateFormat.parse(endTime);

    return '${durationEnd.difference(durationStart).toString()} ';
  }
}
String stime = "09:00PM";
String ctime = "09:30PM";
//how to use:

class dateTime extends StatefulWidget {
  const dateTime({ Key? key }) : super(key: key);

  @override
  State<dateTime> createState() => _dateTimeState();
}

class _dateTimeState extends State<dateTime> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: avoid_print
      child: Column(
        children: [
          Text(   DateUtils.getTimeDifference(stime, "10:00PM")),
          Container(
            child: Column(
              children: [

                ElevatedButton(onPressed: (){
              stime = ctime;
               stime;
                print(   DateUtils.getTimeDifference(stime, "10:00PM"));
                Text(DateUtils.getTimeDifference(stime, "10:00PM"));
            }, child: Text('press me')),

           
              ],
            )
            
          )
        ],
      )     

    );
  }
}