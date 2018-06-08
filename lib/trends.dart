import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'TimePickerDialog.dart';

class Trends extends StatefulWidget {
  Trends({
    Key key
  }) : super(key:key) {
    print("new Trends");
  }


  @override
  State<StatefulWidget> createState() {
    print("Creating new TrendsState");
    return new _TrendsState();
  }

}

class _TrendsState extends State<Trends> implements TimePickerCallback {

  List <Map<String, dynamic>> posts = [];
  TimePickerDialog timePickerDialog;


  _TrendsState() {
    print("new TrendsState");
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timePickerDialog = new TimePickerDialog(context: context, id: 1333 , timePickerCallback: this);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: new Container(),
      floatingActionButton: new FloatingActionButton(onPressed: clickonButton,
        child: new Icon(Icons.send , color: Colors.white,),
        backgroundColor: Colors.blue,
      ),
    );
  }
  void clickonButton(){
   timePickerDialog.showTimePickerDialog();
  }

  @override
  void selectedTime(String time, int id) {
    print('Time formated: ${time}');

  }

}