import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'DatePickerDialog.dart';
import 'package:intl/intl.dart';



class Community extends StatefulWidget {

  FloatingButtonClick floatingButtonClick;
  Community({@required this.floatingButtonClick});

  @override
  State<StatefulWidget> createState() {
    return new _CommunityState(floatingButtonClick: this.floatingButtonClick);
  }
}

class _CommunityState extends State<Community> implements DatePickerCallback {

  DatePickerDialog datePickerDialog;
  DatePickerDialog datePickerDialog2;
  FloatingButtonClick floatingButtonClick;
  _CommunityState({@required this.floatingButtonClick});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    datePickerDialog =
    new DatePickerDialog(context: context, datePickerCallback: this , dateFormat: new DateFormat.yMMMMd(), id: 1222);
    datePickerDialog2 =
    new DatePickerDialog(context: context, datePickerCallback: this , id: 1222);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(),
      floatingActionButton: new FloatingActionButton(onPressed: clickonButton,
      child: new Icon(Icons.message , color: Colors.white,),
        backgroundColor: Colors.green,
      ),

    );
  }


  void clickonButton(){
    datePickerDialog.showDatePickerDialog();
    this.floatingButtonClick.onFloatingClicked(50);
  }

  @override
  void selectedDate(String date, int id) {
    print('Date formated: ${date}  + ${id.toString()}');
  }

}
abstract class FloatingButtonClick{
  void onFloatingClicked(int count);
}