import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';



class TimePickerDialog {

  BuildContext context;
  TimeOfDay _time = new TimeOfDay.now();
  int id;
  TimePickerCallback timePickerCallback;


  TimePickerDialog({@required this.context ,@required this.id ,@required this.timePickerCallback});



  Future<Null> showTimePickerDialog() async {
    final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: _time
    );

    if(picked != null && picked != _time) {
        _time = picked;
        timePickerCallback.selectedTime(_time.toString(), id);

    }
  }
}


abstract class TimePickerCallback{
  void selectedTime(String time , int id);
}