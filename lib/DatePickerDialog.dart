import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';



class DatePickerDialog {
  BuildContext context;
  DateTime _date = new DateTime.now();
  DateFormat dateFormat ;
  DatePickerCallback datePickerCallback;
  int id;

  DatePickerDialog({@required this.context ,@required this.id,@required this.datePickerCallback, this.dateFormat});


  Future<Null> showDatePickerDialog() async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: new DateTime(2016),
        lastDate: new DateTime(2019)
    );

    if(picked != null && picked != _date) {
      _date = picked;
      datePickerCallback.selectedDate(dateFormat==null?new DateFormat.yMd().format(_date):dateFormat.format(_date) , id);
    }

  }


}

abstract class DatePickerCallback{
  void selectedDate(String date , int id);
}