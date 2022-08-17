import 'package:flutter/material.dart';

class DateAndTime{

  static Future<Object>  selectDate({required BuildContext context}) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        firstDate: DateTime.now(),
        lastDate: DateTime(2030));
    if(picked != null) {
      return picked;
    } else {
      return 'No date selected';
    }
  }

  static  Future<Object> selectTime({required BuildContext context}) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialEntryMode:TimePickerEntryMode.dial,
      initialTime: TimeOfDay.now(),
    );
    if(picked != null) {
      return picked;
    } else {
      return  'No date selected';
    }

  }


  // static Map<String,dynamic> timeOfDayToFirebase(TimeOfDay timeOfDay){
  //   return {
  //     'hour':timeOfDay!'',
  //     'minute':timeOfDay!.minute??''
  //   };
  // }
  //
  // static TimeOfDay firebaseToTimeOfDay(Map data){
  //   return TimeOfDay(
  //       hour: data['hour'],
  //       minute: data['minute']);
  // }
}
