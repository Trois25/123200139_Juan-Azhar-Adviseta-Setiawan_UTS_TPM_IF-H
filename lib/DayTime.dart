import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

import 'package:tpm_uts/homepage.dart';


class DayTime extends StatefulWidget {
  const DayTime({Key? key}) : super(key: key);

  @override
  State<DayTime> createState() => _DayTimeState();
}

class _DayTimeState extends State<DayTime> {

  DateTime today = DateTime.now();

  String getTime(){
    var Date = DateTime.now();
    return new DateFormat("HH : mm : ss").format(Date.toUtc().add(Duration(hours: hours)));
  }

  String getDate(){
    var Date = DateTime.now();
    return new DateFormat("dd / MM / yyyy").format(Date);
  }

  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> zone = [
      DropdownMenuItem(child: Text("WIB"),value: "WIB"),
      DropdownMenuItem(child: Text("WITA"),value: "WITA"),
      DropdownMenuItem(child: Text("WIT"),value: "WIT"),
    ];
    return zone;
  }

  String selectedZone = "WIB";
  int hours = 7;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Day Time"),
          actions: [
            IconButton(
                onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context)=>HomePage()));
                },
                icon: Icon(Icons.navigate_before))
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: Text("Date"),
                      ),
                      SizedBox(height: 20),
                      Container(
                          child: Row(
                            children: [
                              Text(
                                  "${getDate()}",
                                  style: TextStyle(
                                  color: Color(0xff2d386b),
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700),
                              )
                            ],
                          )
                      )
                    ],
                  ),
                ),
                Container(
                    child: Column(
                      children: [
                        Container(
                          child: Text("Time"),
                        ),
                        SizedBox(height: 20),
                        Container(
                            child: Row(
                              children: [
                                TimerBuilder.periodic(Duration(seconds: 1), builder: (context) {
                                  print("${getTime()}");
                                  return Text(
                                    "${getTime()}  $selectedZone",
                                    style: TextStyle(
                                        color: Color(0xff2d386b),
                                        fontSize: 30,
                                        fontWeight: FontWeight.w700),
                                  );
                                }),
                              ],
                            )
                        ),
                        SizedBox(height: 20),
                        Container(
                          child:DropdownButton(
                              value: selectedZone,
                              onChanged: (String? newZone){
                                setState(() {
                                  selectedZone = newZone!;
                                  if(selectedZone == "WITA"){
                                    hours = 8;
                                  }else if (selectedZone == "WIT"){
                                    hours = 9;
                                  }else{
                                    hours = 7;
                                  }
                                });
                              },
                              items: dropdownItems
                          ),
                        )
                      ],
                    )
                ),
              ],
            ),
          ),
        )
    );
  }
}
