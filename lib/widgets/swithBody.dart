import 'package:flutter/material.dart';
import 'package:srm_test/layouts/groups.dart';

Widget switchBody(int selectedIndex) {
  if (selectedIndex == 0) {
    return Groups();
  } else {
    return Text("GG");
  }
}