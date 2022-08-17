import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateParsing on DateTime {
  static String get abbrDate => DateFormat.yMMMd().format(DateTime.now());

  ///Tue, Jan 25, 2022
  static String get dateMonthYear => DateFormat.yMMMEd().format(DateTime.now());

  static formatDateToDateMonthYear(DateTime time) => DateFormat.yMMMEd().format(time);

  static formatTimeOfDay(DateTime time) => DateFormat.jm().format(time);
}

extension TimeParsing on TimeOfDay{
  static formatTime(TimeOfDay time) => '${time.hour}:${time.minute} ${time.period.name}'.toString();

}

