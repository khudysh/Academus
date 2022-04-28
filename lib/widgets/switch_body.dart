import 'package:flutter/material.dart';
import 'package:srm_test/screens/groups.dart';
import 'package:srm_test/screens/timetable.dart';
import 'package:srm_test/screens/register.dart';
import 'package:srm_test/screens/home.dart';
import 'package:srm_test/screens/students.dart';

Widget switchBody(int selectedIndex) {
  switch (selectedIndex) {
    case 0:
      return const Home();
    case 1:
      return const Register();
    case 2:
      return const TimeTable();
    case 3:
      return const Groups();
    case 4:
      return const Students();
    default:
      return const Home();
  }
}