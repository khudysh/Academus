import 'package:flutter/material.dart';
import 'package:srm_test/layouts/groups.dart';
import 'package:srm_test/layouts/timetable.dart';

Widget switchBody(int selectedIndex) {
  if (selectedIndex == 0) {
    return Groups();
  }
  else if (selectedIndex == 1) {
    return TimeTable();
  }
  else {
    return Text("GG");
  }
}